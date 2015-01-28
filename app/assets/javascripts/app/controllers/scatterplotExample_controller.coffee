angular.module('demo.controllers').
controller 'ScatterplotExampleController', ()->

  class ScatterplotExampleController
    margin =
      top: 40
      right: 20
      bottom: 30
      left: 40

    width =  960 - margin.left - margin.right
    height =  500 - margin.top - margin.bottom

    xScale = d3.scale.linear().range([0,width])
    yScale = d3.scale.linear().range([height,0])

    xValue = (d) ->
      +d.Calories

    yValue = (d) ->
      +d["Protein (g)"]

    cValue = (d) ->
      d.Manufacturer

    color = d3.scale.category10()

    xMap = (d) ->
      xScale xValue(d)

    yMap = (d) =>
      yScale yValue(d)

    xAxis = d3.svg.axis().scale(xScale).orient("bottom")
    yAxis = d3.svg.axis().scale(yScale).orient("left")
      
    svg = d3.select('#content')
      .append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
      .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")")

    drawDots = (data) ->
      i = 0
      _(data).each( (datum) =>
        cr = 12
        svg.selectAll(".dot").data(data)
          .enter()
            .append("circle")
            .attr("class", "dot")
            .attr("r", cr)
            .attr("cx",(d)=>
             xMap(d)
            )
            .attr("cy", (d)=>
              yMap(d)
            )
            .style("fill", (d) ->
              color cValue(d)
        ).on("mouseover", (d) =>
          tooltip
            .transition()
            .duration(200)
            .style "opacity", .9
          tooltip
            .html(d["Cereal Name"] + "<br/> (" + xValue(d) + ", " + yValue(d) + ")")
            .style("left", (d3.event.pageX + 5) + "px")
            .style "top", (d3.event.pageY - 28) + "px"
          return
        ).on "mouseout", (d) =>
          tooltip.transition()
            .duration(500)
            .style "opacity", 0
          return

        i += 1
      )

    numericize = (data)->
      _(data).each( (datum) ->
        datum.Calories = +datum.Calories
        datum["Protein (g)"] = +datum["Protein (g)"]
      )

    domainize = (data)->
      domainizeX(data)
      domainizeY(data)

    domainizeX = (data)->
      xScale.domain([
        d3.min(data, xValue) - 1
        d3.max(data, xValue) + 1
      ])

    domainizeY = (data)->
      yScale.domain([
        d3.min(data, yValue) - 1
        d3.max(data, yValue) + 1
      ])

    drawAxes = ->
      drawXAxis()
      drawYAxis()

    drawXAxis = ->
      svg.append("g") # x axis
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis)
      .append("text")
        .attr("class", "label")
        .attr("x", width )
        .attr("y", -6)
        .style("text-anchor", "end")
        .text "Calories"

    drawYAxis = ->
      svg.append("g")
          .attr("class", "y axis")
          .call(yAxis)
        .append("text")
          .attr("class", "label")
          .attr("transform", "rotate(-90)")
          .attr("y", 6)
          .attr("dy", ".71em")
          .style("text-anchor", "end")
          .text "Protein (g)"

    tooltip = d3.select('#content')
      .append("div")
        .attr("class", "tooltip")
        .style("opacity", 0)

    drawLegend = ->
      legend = svg.selectAll(".legend")
        .data(color.domain())
        .enter()
          .append("g")
            .attr("class", "legend")
            .attr("transform", (d, i) ->
              "translate(0," + i * 20 + ")"
            )
      console.log legend
      legend.append("rect")
        .attr("x", width - 18)
        .attr("width", 18)
        .attr("height", 18)
        .style "fill", color
      
      legend.append("text")
        .attr("x", width - 24)
        .attr("y", 9)
        .attr("dy", ".35em")
        .style("text-anchor", "end")
        .text (d) ->
          d

    init: ->
      console.log 'scatterplot init'
      d3.csv "/static/cereal.csv", (error, data) =>
        numericize(data)
        domainize(data)
        drawAxes()
        drawDots(data)
        drawLegend()

  new ScatterplotExampleController

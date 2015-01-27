angular.module('demo.controllers').
controller 'CircleNestController', (RightFactory)->

  class CircleNestController

    constructor: ->
      @data = RightFactory.data
      @data.nums = [34,21,13,7,3]

    init: ->
      @circle = d3.select '#circleNest'
        .append 'svg'
        .attr 'width', 900
        .attr 'height', 900

      @circle.append 'circle'
        .style 'stroke', 'gray'
        .style 'fill', 'blue'
        .attr 'r', 40
        .attr 'cx', 42
        .attr 'cy', 42

      @circle.selectAll '#circleNest'
        .data @data.nums
        .enter().append 'circle'
          .attr 'r', (d)-> d
          .style 'stroke','pink'
          .style 'fill', 'olive'
          .attr 'cx', (d)-> 10+d
          .attr 'cy', 40
        
      d3.selectAll("circle").transition()
        .duration 600
        .delay (d,i)-> d*i*10
        .attr 'r', (d)->0.68*d


  new CircleNestController

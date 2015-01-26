angular.module('demo.controllers').
controller 'RightPanelDddController', (Right)->

  class RightPanelController

    constructor: ->
      @data = Right.data 
      @data.nums = [34,21,13,7,3]
      @circle = d3.select '#circleNest'
        .append 'svg'
        .attr 'width', 900
        .attr 'height', 900

      window.svg = @circle
      window.nums = @data.nums

      #@circle.append 'circle'
        #.style 'stroke', 'gray'
        #.style 'fill', 'blue'
        #.attr 'r', 40
        #.attr 'cx', 42
        #.attr 'cy', 42

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

  new RightPanelController

angular.module('demo.controllers').
controller 'CircleNestController', (RightFactory)->

  class CircleNestController

    constructor: ->
      @data = RightFactory.data
      @data.nums = [34,21,13,7,3]

    init: ->
      @circle = d3.select '#circleNest'
        .append 'svg'

      @circle.append 'circle'
        .attr 'class', 'hindMost'
        .attr 'r', 40
        .attr 'cx', 42
        .attr 'cy', 42

      @circle.selectAll '#circleNest'
        .data @data.nums
        .enter().append 'circle'
          .attr 'class', 'nested'
          .attr 'r', (d)-> d
          .attr 'cx', (d)-> 10+d
          .attr 'cy', 40
        
      d3.selectAll("circle").transition()
        .duration 600
        .delay (d,i)-> d*i*10
        .attr 'r', (d)->0.68*d


  new CircleNestController

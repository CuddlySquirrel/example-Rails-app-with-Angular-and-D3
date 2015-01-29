angular.module('demo.controllers').
controller 'CircleNestController', (RightFactory)->

  class CircleNestController

    constructor: ->
      @data = RightFactory.data
      @data.nums = [37,23,14,9,5]

    init: ->
      @circle = d3.select '#circleNest'
        .append 'svg'

      @circle.append 'circle'
        .attr 'class', 'hindMost'
        .attr 'r', 60
        .attr 'cx', 62
        .attr 'cy', 62

      @circle.selectAll '#circleNest'
        .data @data.nums
        .enter().append 'circle'
          .attr 'class', 'nested'
          .attr 'r', (d)-> d
          .attr 'cx', (d)-> 30+d
          .attr 'cy', 60
        
      d3.selectAll("circle").transition()
        .duration 600
        .delay (d,i)-> d*i*10
        .attr 'r', (d)->0.68*d


  new CircleNestController

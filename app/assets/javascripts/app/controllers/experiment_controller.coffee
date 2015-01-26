angular.module('demo.controllers').
controller 'ExperimentController', ()->

  class ExperimentController

    constructor: ->
      @width = 300
      @height = 300
      @x = d3.time.scale().range([0, @width])
      @y = d3.scale.linear().range([@height, 0])
      @xAxis = d3.svg.axis().scale(@x).orient("bottom")
      @yAxis = d3.svg.axis().scale(@y).orient("left")

      @data =
        ['o','h','l','c']
      @something = 'hfhfhf'
      @style =
        background: "blue"

    init: ->
      @something = 'ttt'
      console.log @x
      console.log @y
      console.log @data

  new ExperimentController

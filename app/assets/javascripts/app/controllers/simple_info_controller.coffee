angular.module('demo.controllers').
controller 'SimpleInfoController', (SimpleInfoFactory)->
  
  class SimpleInfoController

    constructor: ->
      @data = SimpleInfoFactory.data

  new SimpleInfoController
  


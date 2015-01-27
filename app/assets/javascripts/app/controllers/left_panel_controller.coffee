angular.module('demo.controllers').
controller 'LeftPanelController', (LeftFactory)->
  
  class LeftPanelController

    constructor: ->
      @data = LeftFactory.data

  new LeftPanelController
  


angular.module('demo.controllers').
controller 'RightPanelController', (RightFactory)->

  class RightPanelController

    constructor: ->
      @data = RightFactory.data 

  new RightPanelController

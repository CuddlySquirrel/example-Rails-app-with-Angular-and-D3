angular.module('demo.controllers').
controller 'RightPanelClickedController', (RightFactory)->

  class RightPanelClickedController

    constructor: ->
      @data = RightClicked.data

  new RightPanelClickedController

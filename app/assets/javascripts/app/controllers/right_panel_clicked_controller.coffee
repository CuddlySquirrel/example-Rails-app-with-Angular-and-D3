angular.module('demo.controllers').
controller 'RightPanelClickedController', (Right)->

  class RightPanelClickedController

    constructor: ->
      @data = RightClicked.data

  new RightPanelClickedController

angular.module('demo.controllers').
controller 'RightPanelController', (Right)->

  class RightPanelController

    constructor: ->
      @data = Right.data 

  new RightPanelController

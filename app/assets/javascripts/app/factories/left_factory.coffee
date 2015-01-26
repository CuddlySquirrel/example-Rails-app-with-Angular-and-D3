angular.module('demo.factories').
factory 'LeftFactory',()->

  class LeftFactory

    constructor: ->
      @data =
        msg: '+++ '
        tim: '789'
        search: 'rrr'
        moo: '---'
        fips:
          [
            {name: 'wombat',outfit: 'wiggle'}
            {name: 'tarzan',outfit: 'small'}
            {name: 'cozmo',outfit: 'mud'}
          ]

  new LeftFactory
  


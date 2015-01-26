angular.module('demo.factories').
factory 'Left',()->

  class Left

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

  new Left()
  


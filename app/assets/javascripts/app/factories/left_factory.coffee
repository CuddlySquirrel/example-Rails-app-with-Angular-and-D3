angular.module('demo.factories').
factory 'LeftFactory',()->

  class LeftFactory

    constructor: ->
      @data =
        msg: '++ a message ++ '
        tim: '789'
        search: 'rrr'
        moo: '---'
        fips:
          [
            {name: 'wombat',outfit: 'fat'}
            {name: 'tarzan',outfit: 'small'}
            {name: 'cozmos',outfit: 'outer space'}
          ]

  new LeftFactory
  


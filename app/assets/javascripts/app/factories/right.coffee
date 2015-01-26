angular.module('demo.factories').
factory 'Right',()->

  class Right

    constructor: ->
      @data =
        msg: '+ggggg+'
        tim: 'hhh'
        search: 'ccc'
        moo: '-6-'
        fips:
          [
            {name: 'cangaroo',outfit: 'wiggle'}
            {name: 'big bad wolf',outfit: 'silk robe'}
            {name: 'gorgon',outfit: 'snake hat'}
          ]

  new Right()
  


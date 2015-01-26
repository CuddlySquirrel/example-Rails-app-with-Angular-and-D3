angular.module('demo.factories').
factory 'RightClicked',()->

  class RightClicked

    constructor: ->
      @data =
        msg: '+eiuwwieu+'
        tim: 'h0000hh'
        search: 'c----cc'
        moo: '-6::::-'
        fips:
          [
            {name: 'caooooooongaroo',outfit: 'wiggle'}
            {name: 'big bad wolf',outfit: 'silk robe'}
            {name: 'gorgon',outfit: 'snake hat'}
          ]

  new RightClicked()
  


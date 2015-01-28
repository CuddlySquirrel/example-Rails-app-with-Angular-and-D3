angular.module('demo.factories').
factory 'SimpleInfoFactory',()->

  class SimpleInfoFactory

    constructor: ->
      @data =
        msg: 'Buncha Silly'
        infoList:
          [
            {name: 'wombat',desc: 'chubby cute lil fella'}
            {name: 'tarzan',desc: 'rambunctious vine swinging champion'}
            {name: 'cozmos',desc: 'outer space cadet'}
          ]

  new SimpleInfoFactory
  


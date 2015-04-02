angular.module('demo.factories').
factory 'SimpleInfoFactory',()->

  class SimpleInfoFactory

    constructor: ->
      @data =
        msg: 'msg from SimpleInfoFactory'
        infoList:
          [
            {name: 'data',desc: 'more data'}
            {name: 'additional data',desc: 'more additional data'}
          ]

  new SimpleInfoFactory
  


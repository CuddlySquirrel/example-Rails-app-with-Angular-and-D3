angular.module('demo.directives').
directive 'LeftStatusDirective', ()->
  restrict: 'A'
  link: (scope, element, attrs)->
    initClasses = attrs['class']

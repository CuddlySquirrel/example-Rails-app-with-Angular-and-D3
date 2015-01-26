angular.module('demo.directives').
directive 'LeftStatusDirective', (Left)->
  restrict: 'A'
  link: (scope, element, attrs)->
    initClasses = attrs['class']

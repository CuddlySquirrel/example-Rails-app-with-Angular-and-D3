angular.module('demo.directives').
directive 'LeftStatusDirective', (LeftFactory)->
  restrict: 'A'
  link: (scope, element, attrs)->
    initClasses = attrs['class']

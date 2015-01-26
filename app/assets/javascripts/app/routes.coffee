angular.module('demo').
config ($stateProvider,$urlRouterProvider,$locationProvider) ->
  $locationProvider.html5Mode true

  $stateProvider
    .state 'simple',
      url: '/angular/simple'
      views:
        simpleright:
          templateUrl: '/templates/simple'
          controller: 'RightPanelController as ctrl'

    .state 'dddright',
      url: '/angular/hexagonMesh'
      views:
        dddright:
          templateUrl: '/templates/circleNest'
          controller: 'RightPanelDddController as ctrl'

    .state 'scatterplotExample',
      url: '/chart/scatterplotExample'
      views:
        scatterplotExample:
          templateUrl: '/templates/scatterplotExample'
          controller: 'ScatterplotExampleController as ctrl'

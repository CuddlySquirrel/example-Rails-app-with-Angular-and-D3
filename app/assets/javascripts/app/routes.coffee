angular.module('demo').
config ($stateProvider,$urlRouterProvider,$locationProvider) ->
  $locationProvider.html5Mode true
  window.sp = $stateProvider

  $stateProvider
    .state 'simple',
      url: '/angular/simple'
      views:
        simpleright:
          templateUrl: '/templates/simple'
          controller: 'RightPanelController as ctrl'

    .state 'circleNest',
      url: '/angular/hexagonMesh'
      views:
        circleNest:
          templateUrl: '/templates/circleNest'
          controller: 'RightPanelDddController as ctrl'

    .state 'scatterplotExample',
      url: '/chart/scatterplotExample'
      views:
        scatterplotExample:
          templateUrl: '/templates/scatterplotExample'
          controller: 'ScatterplotExampleController as ctrl'

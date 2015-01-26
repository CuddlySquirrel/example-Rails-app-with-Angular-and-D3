angular.module('demo').
config ($stateProvider,$urlRouterProvider,$locationProvider) ->
  $locationProvider.html5Mode true

  $stateProvider
    .state 'experiment',
      url: '/chart/experiment'
      views:
        experiment:
          templateUrl: '/templates/experiment'
          controller: 'ExperimentController as ctrl'
    .state 'candles',
      url: '/chart/candles'
      views:
        candles:
          templateUrl: '/templates/candles'
          controller: 'CandlesController as ctrl'
    .state 'scatterplotExample',
      url: '/chart/scatterplotExample'
      views:
        scatterplotExample:
          templateUrl: '/templates/scatterplotExample'
          controller: 'ScatterplotExampleController as ctrl'
    .state 'simple',
      url: '/angular/simple'
      #location: false
      views:
        simpleright:
          templateUrl: '/templates/simple'
          controller: 'RightPanelController as ctrl'
    .state 'dddright',
      url: '/angular/hexagonMesh'
      views:
        dddright:
          templateUrl: '/templates/ddd'
          controller: 'RightPanelDddController as ctrl' 

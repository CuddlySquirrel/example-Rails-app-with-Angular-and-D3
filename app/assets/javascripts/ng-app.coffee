app = angular.module 'demoApp',[]
app.factory 'Data', ()->
  msg: '3 3 3 - - -',
  tim: 'bip',
  search: 'bat',
  fips: 
    [
      {name: 'timmy',outfit: 'tight'}
      {name: 'batman',outfit: 'silly'}
      {name: 'cozmo',outfit: 'pup'}
    ]

  
window.Bibby = ($scope,Data) ->
  $scope.data = Data
  $scope.fips = Data.fips
  $scope.rev = (msg) -> 
    msg.split("").reverse().join("")
window.Vibby = ($scope,Data) ->
  $scope.data = Data
      
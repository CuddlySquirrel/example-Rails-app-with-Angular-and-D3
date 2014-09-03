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

app.directive 'superman', ()-> # scan DOM for custom element and replace it with the template
  restrict: 'E',
  template: '<div id="sandgren">html template</div>'
    
app.directive 'sandgren',()->
  # scan DOM for elements with attribute 'sandgren' and fire the linked function...
  restrict: 'A',
  link: ()->
    $('#sandgren').html('bdsm? PARTY!')
  # scan DOM for elements with class 'sandgren' and fire the linked function...
#   restrict: 'C', 
#   link: ()->
#     $('#sandgren').html('wooping coff')
    
    
app = angular.module "behaviorApp", []

app.factory 'Data', ()->
  msg: '# b 3 +  ',
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

app.directive "enter", ()->
  (sc,el,attrs)->
    el.bind 'mouseenter',()->
      setStatus('inside')
      el.removeClass attrs.leave
      el.addClass attrs.enter

app.directive "leave", ()->
  (sc,el,attrs)->
    el.bind 'mouseleave',()->
      setStatus('out')
      el.removeClass attrs.enter
      el.addClass attrs.leave
      
app.directive 'status',()->
  restrict: 'A'
  link: setStatus 'status'
  
window.setStatus = (text)->
  $('div [status]').append('<div>- '+text+' -</div>')
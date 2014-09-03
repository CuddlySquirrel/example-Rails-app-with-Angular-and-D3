app = angular.module "behaviorApp", []
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

app.directive "enter", ()->
  (sc,el,attrs)->
    el.bind 'mouseenter',()->
      $('div [status]').append('<div>enter<div/>')
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
  link: setStatus 'top'
  
window.setStatus = (text)->
  $('div [status]').append('<div>'+text+'<div/>')
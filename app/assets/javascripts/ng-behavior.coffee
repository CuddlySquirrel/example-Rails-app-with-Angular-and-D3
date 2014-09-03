app = angular.module "behaviorApp", []
 
app.directive "enter", ()->
  (sc,el)->
    el.bind 'mouseenter',()->
      $('div [status]').append('<div>enter<div/>')

app.directive "leave", ()->
  (sc,el)->
    el.bind 'mouseleave',()->
      setStatus('out')
      
app.directive 'status',()->
  restrict: 'A'
  link: setStatus 'top'
  
window.setStatus = (text)->
  $('div [status]').append('<div>'+text+'<div/>')
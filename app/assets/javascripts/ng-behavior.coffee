app = angular.module "behaviorApp", []

app.factory 'Data', ()->
  msg: '# b== '
  tim: 'bip'
  search: 'bat'
  moo: 'silly'
  fips: 
    [
      {name: 'timmy',outfit: 'wiggle'}
      {name: 'batman',outfit: 'silly'}
      {name: 'cozmo',outfit: 'pup'}
    ]

app.controller 'StatusCtrl', ($scope,Data) ->
  console.log 'controller'
  $scope.data = Data
  window.g = $scope.data
  $scope.fips = Data.fips
  $scope.rev = (msg) -> 
      msg.split("").reverse().join("") $scope.showit = ()-> $('.'+$scope.data.fips[1].name).css({visibility:'visible'}) $scope.hideit = ()-> $('.'+$scope.data.fips[1].name).css({visibility:'hidden'})
  $scope.toggleMouseover = (scope,element,self,initClasses)->
    dat = element.data('event')[self.type]
    scope.setStatus(dat.s+' '+scope.rev(dat.s))
    element.removeClass self.target.className
    element.addClass initClasses+ ' '+element.data('event')[self.type].c
  $scope.setStatus = (text)->
    $('div [status]').html('<div>- '+text+' -</div>')
  
app.directive 'status',()->
  restrict: 'A'
  transclude: true
  scope:
    unders: '@'
  template: 
    "<div> + lil bwaby {{unders}} + </div>"
  
app.directive "statusizer", ()->
  restrict: 'A'
  link:
    (scope,element,attr)->
      initClasses = attr['class']
      element.bind 'mouseenter',(self)->
        scope.toggleMouseover(scope,element,self,initClasses)
        scope.hideit()
      element.bind 'mouseleave',(self)->
        scope.toggleMouseover(scope,element,self,initClasses)
        scope.showit()

      
      
      

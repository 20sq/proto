angular.module('20sq-proto.finale', [])

.config ($stateProvider) ->
  $stateProvider.state 'f',
    url: '/f'
    templateUrl: 'finale/finale.tpl.html'
    controller: 'FinaleController'
    data:
      title: ''

.factory 'TheSettings', ->
  return [
    'How you two met?'
    'The first activity you did together?'
    'The caption of your first picture?'
    'The times when you go to college together?'
    'The first song you taught him?'
    'The first song he sang to you?'
    'The first time you two got really close?'
    'The first time you kissed?'
    'The first time you hold hands?'
    'The first time he took care of you?'
    'Your first trip together?'
    'The first time you quarrel?'
    'The moments where you two almost parted?'
    'How he stands by your side?'
    'That you were always staying by his side?'
    '''
    It'd take years to recount your memories...
    And more to make new ones.
    '''
  ]

.controller 'FinaleController',
($scope, TheSettings, $timeout, $state) ->
  $scope.header = 'Do you remember...'
  $scope.setting = null

  ix = -1
  lastIx = TheSettings.length - 1

  $scope.next = ->
    return $state.go('p') if ix >= lastIx

    $scope.loading = true

    $timeout ->
      $scope.loading = false
      $scope.setting = TheSettings[++ix]
      $scope.header = 'Do you agree that' if ix is lastIx
    , 1000

  $scope.next()

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
    'That it will probably take years to recount your memories...'
  ]

.factory 'TheProposal', ->
  return [
    'Will you...'
    'allow him to'
    'walk with you'
    'hand in hand'
    'through the wind and rain'
    'till the end of time?'
  ]

.controller 'FinaleController',
($scope, TheSettings, TheProposal, $timeout, $interval) ->
  $scope.step = 'settings'

  $scope.setting = null
  $scope.ix = -1

  lastIx = TheSettings.length - 1

  $scope.next = ->
    $scope.loading = true

    $timeout ->
      $scope.loading = false

      return propose() if $scope.ix >= lastIx

      $scope.ix++
      $scope.setting = TheSettings[$scope.ix]
    , 1000

  propose = ->
    $scope.step = 'propose'
    $scope.loadingProposal = true
    $scope.proposal = []

    ix = 0

    $scope.proposal.push TheProposal[ix]

    $interval( ->
      $scope.proposal.push TheProposal[++ix]
    , 1500, TheProposal.length
    ).then ->
      $scope.loadingProposal = false

  $scope.next()

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
    {
      q: 'Do you feel comfortable being with him?'
      a: 'He feels comfortable.'
    }
    {
      q: 'Do you think he can take care of you?'
      a: 'He promise you his best.'
    }
    {
      q: 'Will you live as \'us\' with him?'
      a: 'Absolutely, yes.'
    }
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

  $scope.setting = TheSettings[0]
  $scope.question = $scope.setting.q
  $scope.answer = null
  $scope.num = 1

  $scope.next = ->
    $scope.answer = $scope.setting.a

    $timeout ->
      $scope.loading = true

      $timeout ->
        $scope.loading = false

        return propose() if $scope.num >= TheSettings.length

        $scope.setting = TheSettings[$scope.num]
        $scope.question = $scope.setting.q
        $scope.answer = null
        $scope.num++
      , 500
    , 4000

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
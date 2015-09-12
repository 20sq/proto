angular.module('20sq-proto.proposal', [])

.config ($stateProvider) ->
  $stateProvider.state 'p',
    url: '/p'
    templateUrl: 'proposal/proposal.tpl.html'
    controller: 'ProposalController'
    data:
      title: ''

.factory 'TheProposal', ->
  return [
    'Will you...'
    'allow him to'
    'walk with you'
    'hand in hand'
    'through the wind and rain'
    'till the end of time?'
  ]

.controller 'ProposalController',
($scope, TheProposal, $interval) ->
  $scope.loading = true
  $scope.proposal = []

  ix = 0

  $scope.proposal.push TheProposal[ix]

  $interval( ->
    $scope.proposal.push TheProposal[++ix]
  , 1500, TheProposal.length
  ).then ->
    $scope.loading = false

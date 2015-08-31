angular.module('20sq-proto.questions', [])

.config ($stateProvider) ->
  $stateProvider.state 'q',
    url: '/q/:set?'
    templateUrl: 'questions/questions.tpl.html'
    controller: 'QuestionsController'
    data:
      title: ''

.factory 'Questions', ->
  return {
    A: [
      'What is your name?'
      'Is the person a female?'
      'Is she same age with you?'
      'Are you working together?'
      'Did you went to the same school?'
      'Have you met her this year?'
      'Did you went to a trip together this year?'
      'Do you live in the same country?'
      'Is she working in the tech industry?'
    ]
    B: [
      'What is your name?'
      'Is the person a male?'
      'Is he same age with you?'
      'Are you working together?'
      'Did you went to the same school?'
      'Have you met him this year?'
      'Did you went to a trip together this year?'
      'Is he important to you?'
      'Do you think he can take care of you?'
    ]
  }

# .factory 'TheQuestion', ->
#   return [
#     'Will you allow him to:'
#     'walk with you'
#     'hand in hand'
#     'through the wind and rain'
#     'till the end of time?'
#   ]

.controller 'QuestionsController', ($scope, $stateParams, Questions) ->
  setName = if $stateParams.set then $stateParams.set.toUpperCase() else 'A'

  $scope.questions = Questions[setName]
  $scope.question = $scope.questions[0]
  $scope.num = 1

  $scope.answers = []
  $scope.answer = null
  $scope.answerSet = null

  $scope.next = ->
    return displayAnswer() if $scope.num >= $scope.questions.length

    $scope.answers.push $scope.answer
    $scope.question = $scope.questions[$scope.num]
    $scope.num++

  displayAnswer = ->
    $scope.answerSet = setName

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
      'Is the person a female?'
      'Is he same age with you?'
      'Are you working together?'
      'Did you went to the same school?'
      'Have you met him this year?'
      'Did you went to a trip together this year?'
    ]
  }

.factory 'Answers', ->
  return {
    A:
      relationship: 'your best friend'
      name: 'Eileen Gan'
      gender: 'f'
      photo: '''
        https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfp1/v/t1.0-1/
        p160x160/10360951_10152584421506989_3601066943606323060_n.jpg?
        oh=52dfd43761088a3db451c787a16db243&oe=56613FC9&
        __gda__=1449087838_593897ee867f3b27bfad6496e0fde664
      '''
      attended: 'Penang Chinese Girls\' Private High School'
      location: 'Singapore'
    B:
      relationship: 'your loved one'
      name: 'Kenny Ki'
      gender: 'm'
      photo: '''
        https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xat1/v/t1.0-1/
        p160x160/1907937_10155184997970217_3586963649043877238_n.jpg?
        oh=0b62b1821d53cb18c1fd02faf68d0e5c&oe=56717916&
        __gda__=1451252602_fc0bd48005f9a4044ffda05707edaf9a
      '''
      attended: 'Tunku Abdul Rahman College'
      location: 'Singapore'
      trip: 'Bandung this year'
  }

.controller 'QuestionsController',
($scope, $stateParams, Questions, Answers, $timeout) ->
  $scope.setName =
    if $stateParams.set then $stateParams.set.toUpperCase() else 'A'
  $scope.questions = Questions[$scope.setName]
  $scope.question = $scope.questions[0]
  $scope.num = 1
  $scope.loading = false

  $scope.userAnswers = []
  $scope.answer = null
  $scope.answerSet = null

  $scope.next = ->
    return displayAnswer() if $scope.num >= $scope.questions.length

    $scope.loading = true

    $timeout ->
      $scope.userAnswers.push $scope.answer
      $scope.question = $scope.questions[$scope.num]
      $scope.num++
      $scope.loading = false
    , 400

  displayAnswer = ->
    $scope.loading = true

    $timeout ->
      $scope.answerSet = Answers[$scope.setName]
    , 1000

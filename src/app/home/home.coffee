angular.module('20sq-proto.home', [])

.config ($stateProvider) ->
  $stateProvider.state 'home',
    url: '/'
    templateUrl: 'home/home.tpl.html'
    controller: 'HomeController'
    data:
      title: ''

.controller 'HomeController', ($scope) ->
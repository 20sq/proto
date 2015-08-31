angular.module('20sq-proto', [
  'ui.bootstrap'
  'ui.router'
  'templates-app'
  'templates-common'
  '20sq-proto.home'
  '20sq-proto.questions'
])

.config ($locationProvider, $urlRouterProvider) ->
  $locationProvider.html5Mode
    enabled: true
    requireBase: false
  $locationProvider.hashPrefix '#'
  $urlRouterProvider.otherwise '/'

.constant 'appConst',
  appTitle: '20SQ'

.run ($rootScope, appConst) ->
  $rootScope.pageTitle = $rootScope.appTitle = appConst.appTitle

  $rootScope.$on '$stateChangeSuccess', (e, toState) ->
    title = toState.data and toState.data.title
    $rootScope.pageTitle =
      appConst.appTitle + (if title then ' - ' + title else '')
angular.module '20sq-proto', [
  'ui.router'
  'templates-app'
  'templates-common'
]

.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'

.constant 'appConst',
  appTitle: '20SQ'

.run ($rootScope, appConst) ->
  $rootScope.pageTitle = $rootScope.appTitle = appConst.appTitle

  $rootScope.$on 'title:update', (e, title) ->
    $rootScope.pageTitle = appConst.appTitle + (if title then ' - ' + title else '')
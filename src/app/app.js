angular.module('20sq-proto', [
  'ui.bootstrap',
  'ui.router',
  'templates-app',
  'templates-common',
  '20sq-proto.home'
])

.config(function($locationProvider, $urlRouterProvider) {
  $locationProvider.html5Mode({
    enabled: true,
    requireBase: false
  });
  $locationProvider.hashPrefix('#');
  $urlRouterProvider.otherwise('/');
})

.constant('appConst', {
  appTitle: '20SQ'
})

.run(function($rootScope, appConst) {
  $rootScope.pageTitle = $rootScope.appTitle = appConst.appTitle;

  $rootScope.$on('$stateChangeSuccess', function(e, toState) {
    var title = toState.data && toState.data.title;
    $rootScope.pageTitle = appConst.appTitle + (title ? ' - ' + title : '');
  });
});
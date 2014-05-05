(function() {
  var app;

  app = angular.module('SQS', ["ngResource", "ngAnimate"]);

  app.run([
    '$rootScope', function($rootScope) {
      return window.onYouTubeIframeAPIReady = function(id) {
        console.log("[YT Progress] YT Ready");
        $rootScope.$broadcast("youtubeReady", true);
        return $rootScope.youtubeReady = true;
      };
    }
  ]);

  app.constant('RootURL', '/');

}).call(this);

app = angular.module('SQS',["ngResource", "ngAnimate"])

app.run(['$rootScope',($rootScope)->
  ##Broadcast to video directives 
  window.onYouTubeIframeAPIReady = (id)->
    console.log "[YT Progress] YT Ready"
    $rootScope.$broadcast("youtubeReady",true)
    $rootScope.youtubeReady = true
])

app.constant('RootURL','/')
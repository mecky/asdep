/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
'use strict';

/**
 * All the content from index.html is wrapped in a div controlled by RouteCtrl.
 * When a route changes, the "context" variable is assigned the first string between "/" (ex: admin, tenant, etc)
 * All components will access this property from $rootScope. It can be used to determine what to display (ex: sidebar)
 */
asdep.controller("RouteCtrl", function($scope, $rootScope, $location, $cookies, $cookieStore, Auth) {
    var sessionId = $cookies.sessionId;
    if (sessionId) {
        Auth.getSessionInfo.get({id: sessionId},
            function onSuccess(data) {
                $rootScope.authorized = true;
                $rootScope.accountInfo = data.account;
            },
            function onError() {
                $rootScope.authorized = false;
                $cookieStore.remove("sessionId");
            }
        )
    }

    $scope.$on("$routeChangeSuccess", function() {
        var ctx = $location.path().split("/");
        if (ctx[1]) {
            $rootScope.context = ctx[1];
        } else {
            $rootScope.context = 'none';
        }
    })
});
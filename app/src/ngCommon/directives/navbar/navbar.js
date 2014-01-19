/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
asdep.directive("navbar", function(Auth, $cookieStore, $rootScope, Notification) {
    return {
        templateUrl: "src/ngCommon/directives/navbar/navbar.html",
        link: function(scope) {
            scope.logout = function() {
                Auth.logout()
                    .success(function() {
                        console.log("logout successful")
                        $cookieStore.remove("sessionId");
                        $rootScope.authorized = false;
                        delete $rootScope.accountInfo;
                        Notification.success("La revedere!");
                    })
                    .error(function() {
                        console.error("Problem with logout");
                    })
            }
        }
    }
})
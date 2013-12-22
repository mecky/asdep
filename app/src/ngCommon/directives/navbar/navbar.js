asdep.directive("navbar", function(Auth, $cookies, $rootScope) {
    return {
        templateUrl: "src/ngCommon/directives/navbar/navbar.html",
        link: function(scope) {
            scope.logout = function() {
                Auth.logout()
                    .success(function() {
                        console.log("logout successful")
                        $cookies.sessionId = "";
                        $rootScope.authorized = false;
                    })
                    .error(function() {
                        console.error("Problem with logout");
                    })
            }
        }
    }
})
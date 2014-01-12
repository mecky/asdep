/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
asdep.directive("loginModal", function(Auth, $rootScope, $cookies, Notification) {
    return {
        templateUrl: "src/commonModules/account/login/loginModal.html",
        link: function(scope) {
            scope.user = {};
            scope.account = {};

            scope.login = function() {
                Auth.login(scope.user)
                    .success(function(data) {
                        console.log(data);

                        $cookies.sessionId = data.sessionId;
                        $rootScope.accountInfo = data.account;
                        $rootScope.authorized = true;
                        $("#loginModal").modal("hide");
                        Notification.success("Bine ai venit, " + $rootScope.accountInfo.name + "!");
                        scope.message = undefined;
                    })
                    .error(function(message) {
                        console.log("Not able to login!");
                        scope.message = message;
                    });
            }

            scope.createAccount = function() {
                Auth.createUser(scope.account)
                    .success(function(data) {
                        console.log(data)
                        $("#loginModal").modal("hide");
                    })
                    .error(function() {
                        console.log("Not able to login!");
                    })
            }
        }
    }
});
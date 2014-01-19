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
                        $cookies.sessionId = data.sessionId;
                        $rootScope.accountInfo = data;
                        $rootScope.authorized = true;
                        $("#loginModal").modal("hide");
                        Notification.success("Bine ai venit, " + $rootScope.accountInfo.name + "!");
                        scope.message = undefined;
                    })
                    .error(function(message) {
                        scope.message = message;
                    });
            }

            scope.createAccount = function() {
                delete scope.account.agree;
                delete scope.account.confirmPassword;

                console.log(scope.account);
                Auth.createUser(scope.account)
                    .success(function() {
                        $("#loginModal").modal("hide");
                        Notification.success("Contul a fost creat cu succes")
                        scope.message = undefined;
                    })
                    .error(function(message) {
                        scope.message = message;
                    })
            }
        }
    }
});
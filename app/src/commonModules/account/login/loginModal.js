
asdep.directive("loginModal", function(Auth) {
    return {
        templateUrl: "src/commonModules/account/login/loginModal.html",
        link: function(scope) {
            scope.user = {};
            scope.account = {};

            scope.login = function() {
                Auth.login(scope.user)
                    .success(function(data) {
                        console.log(data)
                        $("#loginModal").modal("hide");
                    })
                    .error(function() {
                        console.log("Not able to login!");
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
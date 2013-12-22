
asdep.directive("loginModal", function() {
    return {
        templateUrl: "src/commonModules/account/login/loginModal.html",
        link: function(scope) {
            scope.login = function() {
                console.log("Login");
            }
            scope.createAccount = function() {
                console.log("Create account");
            }
        }
    }
})

asdep.directive("loginModal", function() {
    return {
        templateUrl: "src/commonModules/account/login/loginModal.html",
        link: function(scope) {
            scope.user = {};
            scope.account = {};

            scope.login = function() {
                console.log(scope.user);
                $("#loginModal").modal("hide");
            }
            scope.createAccount = function() {
                console.log(scope.account);
                $("#loginModal").modal("hide");
            }
        }
    }
})
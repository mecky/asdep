
asdep.directive("sidemenu", function($location) {
    return {
        templateUrl: "src/ngCommon/directives/sidemenu/sidemenu.html",
        link: function(scope) {
            scope.menu = {
                tenant: "src/ngCommon/directives/sidemenu/tenant.html",
                admin: "src/ngCommon/directives/sidemenu/admin.html"
            }

            scope.atPage = function(page) {
                return $location.path() == page;
            }
        }
    }
});
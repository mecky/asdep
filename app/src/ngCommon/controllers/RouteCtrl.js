/**
 * All the content from index.html is wrapped in a div controlled by RouteCtrl.
 * When a route changes, the "context" variable is assigned the first string between "/" (ex: admin, tenant, etc)
 * All components will inherit this property in $scope. It can be used to determine what to display (ex: sidebar)
 */
asdep.controller("RouteCtrl", function($scope, $location) {
    $scope.$on("$routeChangeSuccess", function() {
        var ctx = $location.path().split("/");
        if (ctx[1]) {
            $scope.context = ctx[1];
        } else {
            $scope.context = 'none';
        }
    })
})
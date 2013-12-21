
asdep.controller("tenantMetersCtrl", function($scope, $routeParams) {
    $scope.tab = $routeParams.tab;
    $scope.template = {
        insert: "src/tenant/meters/insertReading.html",
        history: "src/tenant/meters/history.html"
    }
    $('#metersTab a[data-target="' + $scope.tab + '"]').tab('show');
})
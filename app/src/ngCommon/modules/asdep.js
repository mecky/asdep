
var asdep = angular.module("asdep", []);

asdep.config(function($routeProvider) {
    $routeProvider
        .when("/",              {templateUrl: "src/commonModules/home.html",   controller: function($rootScope) {$rootScope.role="none"}})
        .when("/tenant",        {templateUrl: "src/tenant/news/newsList.html", controller: "newsCtrl"})
        .when("/tenant/news",   {templateUrl: "src/tenant/news/newsList.html", controller: "newsCtrl"})
        .when("/tenant/meters", {templateUrl: "src/tenant/meters/meters.html", controller: "tenantMetersCtrl"})
        .when("/admin",         {templateUrl: "src/admin/info/info.html",      controller: "adminInfoCtrl"})
        .when("/admin/info",    {templateUrl: "src/admin/info/info.html",      controller: "adminInfoCtrl"})
        .when("/admin/config",  {templateUrl: "src/admin/config/config.html",  controller: "adminConfigCtrl"})
})
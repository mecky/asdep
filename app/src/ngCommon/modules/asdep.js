'use strict';

var asdep = angular.module("asdep", []);

asdep.config(function($routeProvider) {
    $routeProvider
        .when("/",              {templateUrl: "src/commonModules/home.html"})
        .when("/tenant",        {redirectTo: "/tenant/news"})
        .when("/tenant/news",   {templateUrl: "src/tenant/news/newsList.html", controller: "newsCtrl"})
        .when("/tenant/meters", {templateUrl: "src/tenant/meters/meters.html", controller: "tenantMetersCtrl"})
        .when("/admin",         {redirectTo: "/admin/info"})
        .when("/admin/info",    {templateUrl: "src/admin/info/info.html",      controller: "adminInfoCtrl"})
        .when("/admin/config",  {templateUrl: "src/admin/config/config.html",  controller: "adminConfigCtrl"})
});

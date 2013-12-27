/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
'use strict';

var asdep = angular.module("asdep", ["ngCookies", "ngResource"]);

asdep.config(function($routeProvider) {
    $routeProvider
        .when("/",                  {templateUrl:"/src/commonModules/home.html"})
        .when("/tenant",            {redirectTo: "/tenant/news"})
        .when("/tenant/news",       {templateUrl:"/src/tenant/news/newsList.html", controller: "newsCtrl"})
        .when("/tenant/meters",     {redirectTo: "/tenant/meters/insert"})
        .when("/tenant/meters/:tab",{templateUrl:"/src/tenant/meters/meters.html", controller: "tenantMetersCtrl"})
        .when("/admin",             {redirectTo: "/admin/info"})
        .when("/admin/info",        {templateUrl:"/src/admin/info/info.html",      controller: "adminInfoCtrl"})
        .when("/admin/config",      {templateUrl:"/src/admin/config/config.html",  controller: "adminConfigCtrl"})

    toastr.options.closeButton = true;
    toastr.options.timeOut = 1500;
    toastr.options.fadeOut = 100;
    toastr.options.fadeIn = 100;
});

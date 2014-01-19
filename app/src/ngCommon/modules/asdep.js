/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
'use strict';

var asdep = angular.module("asdep", ["ngCookies", "ngResource"]);

asdep.config(function($routeProvider) {
    $routeProvider
    .when("/",                              {templateUrl:"/src/commonModules/home.html"})
    .when("/tenant",                        {redirectTo: "/tenant/news"})
    .when("/tenant/news",                   {templateUrl:"/src/tenant/news/newsList.html",      controller: "TenantNewsCtrl"})
    .when("/tenant/meters",                 {redirectTo: "/tenant/meters/insert"})
    .when("/tenant/meters/:tab",            {templateUrl:"/src/tenant/meters/meters.html",      controller: "TenantMetersCtrl"})
    .when("/admin",                         {templateUrl:"/src/admin/associationSelect.html",   controller: "AssociationSelectCtrl"})
    .when("/admin/:associationId/info",     {templateUrl:"/src/admin/info/info.html",           controller: "AdminInfoCtrl"})
    .when("/admin/:associationId/config",   {templateUrl:"/src/admin/config/config.html",       controller: "AdminConfigCtrl"})

    toastr.options.closeButton = true;
    toastr.options.timeOut = 1500;
    toastr.options.fadeOut = 100;
    toastr.options.fadeIn = 100;
});

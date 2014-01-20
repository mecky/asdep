/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
'use strict';

asdep.directive("sidemenu", function($location) {
    return {
        templateUrl: "src/ngCommon/directives/sidemenu/sidemenu.html",
        link: function(scope) {
            scope.menu = {
                tenant: "src/ngCommon/directives/sidemenu/tenant.html",
                admin: "src/ngCommon/directives/sidemenu/admin.html"
            }

            /**
             * Current page starts with ... (not matching exacly because of tabs)
             */
            scope.atPage = function(page) {
                return $location.path().substring(0, page.length) == page;
            }
        }
    }
});
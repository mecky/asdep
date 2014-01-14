/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
'use strict';
asdep.factory("Auth", function($http, $resource) {
    return {
        login: function(user) {
            return $http.post("/api/auth/login", user);
        },
        logout: function() {
            return $http.post("/api/auth/logout");
        },
        createUser: function(user) {
            return $http.put("/api/auth/user/", user);
        },
        getSessionInfo: $resource("/api/auth/:id")
    }
})
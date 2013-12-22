
asdep.factory("Auth", function($http) {
    return {
        login: function(user) {
            return $http.post("/api/auth/login", user);
        },
        logout: function() {
            return $http.post("/api/auth/logout");
        },
        createUser: function(user) {
            return $http.put("/api/auth/user/", user);
        }
    }
})
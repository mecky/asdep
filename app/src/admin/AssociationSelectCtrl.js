/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved.
 */
'use strict';

asdep.controller("AssociationSelectCtrl", function($scope, $rootScope, AssociationInfo) {
    AssociationInfo.query({},
        function onSuccess(data) {
            $scope.associations = data;
        }
    );
})
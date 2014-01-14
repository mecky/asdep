/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
'use strict';

asdep.controller("AdminInfoCtrl", function($scope, AssociationInfo) {
    AssociationInfo.get({id: "1"},
        function onSuccess(data) {
            console.log(data);
            $scope.associations = data;
        }
    )
});
/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
'use strict';

asdep.controller("AdminInfoCtrl", function($scope, AssociationInfo) {
    AssociationInfo.get({id: "1"},
        function onSuccess(data) {
            $scope.associations = data;
        }
    );

    $scope.deleteAssociation = function(index) {
        confirm("Stergeti associatia \"" + $scope.associations[index].name + "\"?");
    }
});
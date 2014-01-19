/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
'use strict';

asdep.controller("AdminInfoCtrl", function($scope, $routeParams, AssociationInfo) {
    var associationId = $routeParams.associationId;

    AssociationInfo.get({id: associationId},
        function onSuccess(data) {
            $scope.association = data;
        }
    );

    $scope.deleteAssociation = function(index) {
        confirm("Stergeti associatia \"" + $scope.associations[index].name + "\"?");
    }
});
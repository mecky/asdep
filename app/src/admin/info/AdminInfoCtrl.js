/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
'use strict';

asdep.controller("AdminInfoCtrl", function($scope, $routeParams, AssociationInfo, Notification) {
    var associationId = $routeParams.associationId;

    AssociationInfo.get({id: associationId},
        function onSuccess(data) {
            $scope.association = data;
        }
    );

    $scope.deleteAssociation = function(index) {
        var asName = $scope.association.name;
        if (confirm("Stergeti associatia \"" + asName + "\"?")) {
            Notification.success(asName + " a fost stearsa.")
        }
    }
});
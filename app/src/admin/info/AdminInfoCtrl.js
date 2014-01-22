/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
'use strict';

asdep.controller("AdminInfoCtrl", function($scope, $routeParams, Association, Notification, Model) {
    var idAssociation = $routeParams.idAssociation;
    $scope.edit = false;

    Association.get({idAssociation: idAssociation},
        function onSuccess(data) {$scope.association = data;},
        function onError() { Notification.error("Asociatia cu ID-ul " + idAssociation + " nu a putut fi preluata de pe server!");}
    );

    var associationBackup = null;

    $scope.update = function() {
        associationBackup = Model.clone($scope.association);
        $("#associationForm input").removeAttr("readonly");
        $scope.edit = true;
    }

    $scope.save = function() {
        $("#associationForm input").attr("readonly", "");

        var diffObject = Model.diff(associationBackup, $scope.association, idAssociation);
        if (diffObject) {
            Association.save(diffObject,
                function onSuccess() {
                    Notification.success("Associatia a fost modificata cu succes!");
                },
                function onError() {
                    Notification.error("Modificarea nu a putut fi efectuata.")
                }
            );
            $scope.edit = false;
        }
    }
});
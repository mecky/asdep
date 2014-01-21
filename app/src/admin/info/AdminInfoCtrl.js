/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
'use strict';

asdep.controller("AdminInfoCtrl", function($scope, $routeParams, Association, Notification) {
    $scope.edit = false;
    $scope.association = Association.get({idAssociation: $routeParams.idAssociation});

    $scope.update = function() {
        $("#associationForm input").removeAttr("readonly");
        $scope.edit = true;
    }

    $scope.save = function() {
        $("#associationForm input").attr("readonly", "");
        $scope.association.$save(
            function onSuccess() {
                Notification.success("Associatia a fost modificata cu succes!");
            },
            function onError() {
                Notification.error("Modificarea nu a putut fi efectuata.")
            }
        );
        $scope.edit = false;
    }
});
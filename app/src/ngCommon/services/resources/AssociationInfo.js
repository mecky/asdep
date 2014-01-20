/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
'use strict';

asdep.factory("AssociationInfo", function($resource) {
    return $resource("/api/association/:id");
})

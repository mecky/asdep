/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
asdep.factory("Notification", function() {
    return {
        success: function(message) {
            toastr.success(message);
        },
        error: function(message) {
            toastr.error(message);
        }
    }
})
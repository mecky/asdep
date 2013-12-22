
asdep.factory("Notification", function() {
    return {
        success: function(message) {
            toastr.success(message);
        }
    }
})
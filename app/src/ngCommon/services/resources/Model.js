/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
'use strict'

/**
 * Used for model utility functions.
 */
asdep.factory("Model", function() {
    return {
        /**
         * Return the difference between two entities. (the fields of model2)
         * @param model1    - base
         * @param model2    - new instance
         * @param id        - the new model must preserve an ID
         */
        diff: function(model1, model2, id) {
            var diff = {
                key: id,
                updatedFields: {}
            };

            for (var key in model1) {
                if (model1[key] != model2[key]) {
                    diff.updatedFields[key] = model2[key];
                }
            }
            return diff;
        },
        /**
         * Return a new instance of the object, identical to the argument given.
         * @param model
         */
        clone: function(model) {
            var clone = new Object();

            for (var key in model) {
                clone[key] = model[key];
            }
            return clone;
        }
    }
})

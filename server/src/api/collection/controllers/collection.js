'use strict';

/**
 * A set of functions called "actions" for `collection`
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::collection.collection");


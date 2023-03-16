'use strict';

/**
 * A set of functions called "actions" for `work`
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::work.work");
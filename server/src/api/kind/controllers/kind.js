'use strict';

/**
 * A set of functions called "actions" for `kind`
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::kind.kind");


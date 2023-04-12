'use strict';

/**
 * A set of functions called "actions" for `author`
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::author.author");

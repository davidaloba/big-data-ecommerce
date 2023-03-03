'use strict';

/**
 * A set of functions called "actions" for `tag`
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::tag.tag");

'use strict';

/**
 * A set of functions called "actions" for `blog`
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::blog.blog");
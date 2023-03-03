'use strict';

/**
 * A set of functions called "actions" for `shop`
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::shop.shop");

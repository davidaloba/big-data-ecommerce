'use strict';

/**
 * A set of functions called "actions" for `product`
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::product.product");

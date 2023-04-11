'use strict';

/**
 * A set of functions called "actions" for `topic`
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::topic.topic");


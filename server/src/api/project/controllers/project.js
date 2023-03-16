'use strict';

/**
 * A set of functions called "actions" for `project`
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::project.project");

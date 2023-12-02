"use strict";

/**
 * A set of functions called "actions" for `folio`
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::folio.folio");

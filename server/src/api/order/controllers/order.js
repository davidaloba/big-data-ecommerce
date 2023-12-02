"use strict";

/**
 * A set of functions called "actions" for `order`
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::order.order", ({ strapi }) => ({
  async find(ctx) {
    const user = ctx.state.user;
    if (!user) {
      return ctx.badRequest(null, [
        { messages: [{ id: "No authorization header was found" }] },
      ]);
    }

    const data = await strapi.entityService.findMany("api::order.order", {
      filters: {
        user: { email: user.email },
        ...ctx.request.query.filters,
      },
      sort: { createdAt: "desc" },
      populate: ["cart", "billing", "shipping"],
      populate: {
        cart: { populate: "*" },
        billing: { populate: "*" },
        shipping: { populate: "*" },
      },
    });

    const sanitizedData = await this.sanitizeOutput(data, ctx);

    if (!sanitizedData) {
      return ctx.notFound();
    }

    ctx.send(sanitizedData);
  },
}));

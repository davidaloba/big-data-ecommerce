// src/extensions/users-permissions/strapi-server.js
// this route is only allowed for authenticated users

module.exports = (plugin) => {
  /*******************************  CUSTOM CONTROLERS  ********************************/
  plugin.controllers.user.updateMe = async (ctx) => {
    if (!ctx.state.user || !ctx.state.user.id) {
      return (ctx.response.status = 401);
    }

    await strapi
      .query("plugin::users-permissions.user")
      .update({
        where: { id: ctx.state.user.id },
        data: ctx.request.body,
      })
      .then((res) => {
        ctx.response.status = 200;
      });

    ctx.send({ message: "profile updated successfully" });
  };

  plugin.controllers.user.updateWishlist = async (ctx) => {
    if (!ctx.state.user || !ctx.state.user.id) {
      return (ctx.response.status = 401);
    }

    const data = await strapi
      .query("plugin::users-permissions.user")
      .update({
        where: { id: ctx.state.user.id },
        data: ctx.request.body.data,
      })
      .then((res) => {
        ctx.response.status = 200;
      });

    ctx.send(data);
  };
  /*******************************  CUSTOM ROUTES  ********************************/

  plugin.routes["content-api"].routes.push({
    method: "POST",
    path: "/users/me",
    handler: "user.updateMe",
    config: {
      prefix: "",
      policies: [],
    },
  });

  plugin.routes["content-api"].routes.push({
    method: "PUT",
    path: "/users/me/wishlist",
    handler: "user.updateWishlist",
    config: {
      prefix: "",
      policies: [],
    },
  });

  return plugin;
};

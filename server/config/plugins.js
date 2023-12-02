module.exports = ({ env }) => ({
  scheduler: {
    enabled: true,
    config: {
      model: "scheduler",
      contentTypes: {
        "api::folio.folio": {},
      },
    },
  },
  "cookie-manager": {
    enabled: true,
    config: {
      localization: true,
    },
  },
  "generate-data": {
    enabled: true,
  },
  "strapi-plugin-populate-deep": {
    config: {
      defaultDepth: 7, // Default is 5
    },
  },
});

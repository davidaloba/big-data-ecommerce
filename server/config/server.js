// const cronTasks = require('./cron-tasks');
const cronTasks = require('@webbio/strapi-plugin-scheduler/cron-task');

module.exports = ({ env }) => ({
  url: env("PUBLIC_URL", env('PUBLIC_URL')),
  host: env('HOST', env('HOST')),
  port: env.int('PORT', env('PORT')),
  app: {
    keys: env.array('APP_KEYS', ['testKey1', 'testKey2']),
  },
  cron: {
    enabled: true,
    tasks: cronTasks,
  },
});

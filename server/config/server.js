// const cronTasks = require('./cron-tasks');
const cronTasks = require('@webbio/strapi-plugin-scheduler/cron-task');

module.exports = ({ env }) => ({
  url: env("PUBLIC_URL", env('DATABASE_HOST')),
  host: env('HOST', env('DATABASE_HOST')),
  port: env.int('PORT', env('DATABASE_HOST')),
  app: {
    keys: env.array('APP_KEYS', ['testKey1', 'testKey2']),
  },
  cron: {
    enabled: true,
    tasks: cronTasks,
  },
});

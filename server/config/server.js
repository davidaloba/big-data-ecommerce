// const cronTasks = require('./cron-tasks');
const cronTasks = require('@webbio/strapi-plugin-scheduler/cron-task');

module.exports = ({ env }) => ({
  url: env("PUBLIC_URL", "http://localhost:1337"),
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  app: {
    keys: env.array('APP_KEYS', ['testKey1', 'testKey2']),
  },
  cron: {
    enabled: true,
    tasks: cronTasks,
  },
});

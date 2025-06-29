// logger.js
const pino = require('pino');

// Create a Pino logger instance
const logger = pino({
  level: process.env.LOG_LEVEL || 'info',
  prettyPrint: process.env.NODE_ENV !== 'production'
});

module.exports = logger;

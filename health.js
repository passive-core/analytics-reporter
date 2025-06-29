// load env vars
require('dotenv').config();

// imports
const express = require('express');
const path = require('path');

// setup
const app = express();
const PORT = process.env.PORT || 8080;

// serve React build
app.use(express.static(path.join(process.cwd(), 'build')));

// health check
app.get('/healthz', (_req, res) => res.sendStatus(200));

// all other routes → index.html
app.get('/*', (_req, res) => {
  res.sendFile(path.join(process.cwd(), 'build', 'index.html'));
});

// start server
app.listen(PORT, () => {
  console.log(`🚀 Listening on port ${PORT}`);
});

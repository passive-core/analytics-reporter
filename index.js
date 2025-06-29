// index.js
const express = require('express');
const path = require('path');
const logger = require('./logger');
const health = require('./health');

const app = express();
const PORT = process.env.PORT || 8080;

// Mount health endpoint
app.use('/health', health);

// Serve React static files
app.use(express.static(path.join(__dirname, 'build')));

// All other routes → index.html
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'build', 'index.html'));
});

app.listen(PORT, () => {
  logger.info(`Server listening on port ${PORT}`);
});


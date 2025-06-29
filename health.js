import './dotenv-config';        // if you have a small file that does `import 'dotenv/config'`
import { logger } from './logger';
import express from "express";
import path from "path";

const app = express();
const PORT = process.env.PORT || 8080;

// Serve the static React build
app.use(express.static(path.join(process.cwd(), "build")));
// attach a child logger to each request
app.use((req, res, next) => {
  req.log = logger.child({ reqId: req.headers['x-request-id'] || Date.now() });
  req.log.info({ path: req.path }, 'incoming request');
  next();
});

// Health check endpoint
app.get("/healthz", (_req, res) => {
  res.sendStatus(200);
});

// All other routes → index.html
app.get("/*", (_req, res) => {
  res.sendFile(path.join(process.cwd(), "build", "index.html"));
});

app.listen(PORT, () => {
  console.log(`🚀 Listening on port ${PORT}`);
});

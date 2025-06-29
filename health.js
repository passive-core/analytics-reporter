import express from "express";
import path from "path";

const app = express();
const PORT = process.env.PORT || 8080;

// Serve the static React build
app.use(express.static(path.join(process.cwd(), "build")));

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

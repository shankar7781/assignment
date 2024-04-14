const app = require("./app");
const dotenv = require("dotenv");
const connectDatabase = require("./db/Database.js");

//handling uncaught exceptions
process.on("uncaughtException", (err) => {
  console.log(`ERROR: ${err.message}`);
  console.log("Shutting down due to uncaught exception");
  process.exit(1);
});
// Load env vars
dotenv.config({ path: "server/config/.env" });
//connnecting database
connectDatabase();
//create server

const server = app.listen(process.env.PORT, () => {
  console.log(`Server is running on port ${process.env.PORT}`);
});

//unhandled promise rejections
process.on("unhandledRejection", (err) => {
  console.log(`Shutting down server for: ${err.message}`);
  console.log("Shutting down server due to unhandled promise rejection");
  server.close(() => {
    process.exit(1);
  });
});

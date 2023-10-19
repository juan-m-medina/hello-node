import express from "express";
import homeRoutes from "./routes/home.routes";

const app = express();

app.use("/", homeRoutes);

app.listen(3000, () => {
  console.log('Server is running on port 3000');
})


import "./App.css";
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Outlet,
} from "react-router-dom";

import Home from "./routes/Home";
import Test from "./routes/Test";
function App() {
  return (
    <Router>
      <Routes>
        <Route index element={<Home />} />
        <Route path="/test" element={<Test />} />
      </Routes>
    </Router>
  );
}

export default App;

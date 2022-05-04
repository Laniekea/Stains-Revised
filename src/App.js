import { Routes, Route } from 'react-router-dom';
import { NavHorizontal, NavVertical, Footer, Table } from './components';
import './App.scss';

function App() {
  return (
    <div className="App">
      <NavHorizontal />
      <div className="base-layout">
        <NavVertical />
        <Routes>
          <Route exact path="/" element={<h2>Landing Page</h2>} />
          <Route exact path="/techstacks" element={<Table />} />
        </Routes>
      </div>
      <Footer />
    </div>
  );
}

export default App;

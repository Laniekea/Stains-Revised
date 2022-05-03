import './App.scss';
import { NavHorizontal, NavVertical, Footer } from './components';

function App() {
  return (
    <div className="App">
      <NavHorizontal />
      <div className="base-layout">
        <NavVertical />
        <h2>This is content</h2>
      </div>
      <Footer />
    </div>
  );
}

export default App;

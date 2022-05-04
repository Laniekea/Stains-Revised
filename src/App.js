import { NavHorizontal, NavVertical, Footer, Table } from './components';
import './App.scss';

function App() {
  return (
    <div className="App">
      <NavHorizontal />
      <div className="base-layout">
        <NavVertical />
        {/* <h2></h2> */}
        <Table />
      </div>
      <Footer />
    </div>
  );
}

export default App;

import React from 'react';
import './navHorizontal.scss';

function NavHorizontal() {
  const text = 'Stains';

  return (
    <div className="nav-horizontal">
      <div className="nav-horizontal-container">
        <a href="/">{text}</a>
        <p>Profile</p>
      </div>
    </div>
  );
}

export default NavHorizontal;

import React from 'react';
import './navVertical.scss';

function NavVertical() {
  const items = [
    'Users',
    'Applications',
    'Audit Log',
    'Permission',
    'Tech Stacks',
    'Employment Types',
    'Roles',
  ];

  return (
    <div className="nav-vertical">
      <div className="nav-vertical-container">
        {items.map((item) => (
          <p>{item}</p>
        ))}
      </div>
    </div>
  );
}

export default NavVertical;

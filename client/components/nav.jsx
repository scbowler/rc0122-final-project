import React from 'react';

function Nav() {
  return (
    <ul className="nav py-3 bg-primary">
      <li className="nav-item">
        <a className="nav-link text-white" href="#">View Entries</a>
      </li>
      <li className="nav-item">
        <a className="nav-link text-white" href="#new-entry">New Entry</a>
      </li>
    </ul>
  );
}

export default Nav;

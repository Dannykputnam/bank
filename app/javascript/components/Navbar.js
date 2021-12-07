import React from 'react';

const Navbar = () => {
  return (
    <nav>
      <ul>
        <li>
          <a href="/users/sign_out"
          data-method="delete">Sign out</a>
        </li>
      </ul>
    </nav>
  )
}

export default Navbar;
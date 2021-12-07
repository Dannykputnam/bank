import React from 'react';
import Navbar from './Navbar';

const Accounts = ({ user, accounts }) => {
  const { first_name, last_name } = user
  let full_name = first_name + ' ' + last_name
  return (
    <>
      <Navbar />
      <h1>All of {`${full_name}'s`} Accounts</h1>
      <a href="/accounts/new">New Account</a>
      {
        accounts.map( (account) => (
          <h4>{account.name} - ${account.balance}</h4>
        ))
      }
    </>
  )
}

export default Accounts;
import React from 'react';

const AccountNew = ({ account }) => {
  const { name, balance } = account
  const defaultName = name ? name : "";
  const defaultBalance = balance ? balance : 0.0;
  return (
    <>
      <h1>Add Account</h1>
      <form action="/accounts" method="post">
        <input
          placeholder="Name"
          type="text"
          defaultValue={defaultName}
          name="account[name]"
        />
        <input
          placeholder="Balance"
          type="number"
          step="0.01"
          defaultValue={defaultBalance}
          name="account[balance]"
        />
        <button type="submit">Add</button>
      </form>
    </>
  )
}

export default AccountNew;
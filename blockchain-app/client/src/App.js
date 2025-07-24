import React, { useEffect, useState } from 'react';
import { getWeb3, getCrud } from './utils.js';
import './App.css';

function App() {
  const [web3, setWeb3] = useState(undefined);
  const [accounts, setAccounts] = useState(undefined);
  const [crud, setCrud] = useState(undefined);
  const [isLoading, setIsLoading] = useState(true);
  const [activeTab, setActiveTab] = useState('create');
  const [notifications, setNotifications] = useState([]);

  useEffect(() => {
    const init = async () => {
      try {
        const web3 = await getWeb3();
        const accounts = await web3.eth.getAccounts();
        const crud = await getCrud(web3);

        setWeb3(web3);
        setAccounts(accounts);
        setCrud(crud);
      } catch (error) {
        addNotification('error', 'Failed to initialize Web3 and contract');
      } finally {
        setIsLoading(false);
      }
    };
    init();
  }, []);

  const addNotification = (type, message) => {
    const id = Date.now();
    const newNotification = { id, type, message };
    setNotifications(prev => [...prev, newNotification]);
    
    setTimeout(() => {
      setNotifications(prev => prev.filter(n => n.id !== id));
    }, 5000);
  };

  const createUser = async (e) => {
    e.preventDefault();
    const name = e.target.elements[0].value;

    try {
      await crud.methods.create(name).send({ from: accounts[0], gas: 200000 });
      addNotification('success', `User "${name}" created successfully`);
      e.target.reset();
    } catch (err) {
      addNotification('error', `Failed to create user "${name}"`);
    }
  };

  const readUser = async (e) => {
    e.preventDefault();
    const id = e.target.elements[0].value;

    try {
      const result = await crud.methods.read(id).call();
      if (result[0] === '0') {
        addNotification('warning', `User with ID ${id} not found`);
      } else {
        addNotification('info', `User found: ID ${result[0]} - Name: ${result[1]}`);
      }
    } catch (err) {
      addNotification('error', `Failed to read user with ID ${id}`);
    }
  };

  const updateUser = async (e) => {
    e.preventDefault();
    const id = e.target.elements[0].value;
    const name = e.target.elements[1].value;

    try {
      await crud.methods.update(id, name).send({ from: accounts[0] });
      addNotification('success', `Updated user ${id} to "${name}"`);
      e.target.reset();
    } catch (err) {
      addNotification('error', `Failed to update user ${id}`);
    }
  };

  const deleteUser = async (e) => {
    e.preventDefault();
    const id = e.target.elements[0].value;

    try {
      await crud.methods.destroy(id).send({ from: accounts[0] });
      addNotification('success', `Deleted user ${id}`);
      e.target.reset();
    } catch (err) {
      addNotification('error', `Failed to delete user ${id}`);
    }
  };

  if (isLoading) {
    return (
      <div className="loading-container">
        <div className="spinner"></div>
        <p>Loading Web3, accounts, and contract...</p>
      </div>
    );
  }

  return (
    <div className="app-container">
      <div className="app-card">
        <header>
          <h1>CRUD DApp</h1>
          <p className="wallet-address">Connected: {accounts[0]}</p>
        </header>

        <div className="tabs">
          <button 
            className={activeTab === 'create' ? 'active' : ''} 
            onClick={() => setActiveTab('create')}
          >
            Create
          </button>
          <button 
            className={activeTab === 'read' ? 'active' : ''} 
            onClick={() => setActiveTab('read')}
          >
            Read
          </button>
          <button 
            className={activeTab === 'update' ? 'active' : ''} 
            onClick={() => setActiveTab('update')}
          >
            Update
          </button>
          <button 
            className={activeTab === 'delete' ? 'active' : ''} 
            onClick={() => setActiveTab('delete')}
          >
            Delete
          </button>
        </div>

        <div className="tab-content">
          {activeTab === 'create' && (
            <form onSubmit={createUser} className="form">
              <h2>Create New User</h2>
              <div className="form-group">
                <label>Name</label>
                <input type="text" required placeholder="Enter user name" />
              </div>
              <button type="submit" className="btn-primary">Create User</button>
            </form>
          )}

          {activeTab === 'read' && (
            <form onSubmit={readUser} className="form">
              <h2>Find User</h2>
              <div className="form-group">
                <label>User ID</label>
                <input type="number" required placeholder="Enter user ID" />
              </div>
              <button type="submit" className="btn-primary">Find User</button>
            </form>
          )}

          {activeTab === 'update' && (
            <form onSubmit={updateUser} className="form">
              <h2>Update User</h2>
              <div className="form-group">
                <label>User ID</label>
                <input type="number" required placeholder="Enter user ID" />
              </div>
              <div className="form-group">
                <label>New Name</label>
                <input type="text" required placeholder="Enter new name" />
              </div>
              <button type="submit" className="btn-primary">Update User</button>
            </form>
          )}

          {activeTab === 'delete' && (
            <form onSubmit={deleteUser} className="form">
              <h2>Delete User</h2>
              <div className="form-group">
                <label>User ID</label>
                <input type="number" required placeholder="Enter user ID" />
              </div>
              <button type="submit" className="btn-danger">Delete User</button>
            </form>
          )}
        </div>

        <div className="notifications">
          {notifications.map((notification) => (
            <div key={notification.id} className={`notification ${notification.type}`}>
              {notification.message}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

export default App;
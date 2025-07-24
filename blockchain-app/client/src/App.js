import React, { useEffect, useState } from 'react';
import { getWeb3, getCrud } from './utils.js';
function App() {

const [web3, setWeb3] = useState(undefined);
const [accounts, setAccounts] = useState(undefined);
const [crud, setCrud ] = useState(undefined);

const [messageCreateUser, setMessageCreateUser] = useState(undefined);
const [messageReadUser, setMessageReadUser] = useState(undefined);
const [messageUpdateUser, setMessageUpdateUser] = useState(undefined);
const [messageDeleteUser, setMessageDeleteUser] = useState(undefined);

useEffect(() =>{
   const init = async() =>{
    const web3 =await getWeb3();
    const accounts = await web3.eth.getAccounts();
    const crud = await getCrud(web3);

    setWeb3(web3);
    setAccounts(accounts);
    setCrud(crud);
   };
   init();
}, []);

async function resetMessages(){
   setMessageCreateUser('');
   setMessageReadUser('');
   setMessageUpdateUser('');
   setMessageDeleteUser('');
}

async function createUser(e) {
   e.preventDefault();
   resetMessages();

   const name = e.target.elements[0].value;
   //crud.methods.create(name).send({from: accounts[0]})
   crud.methods.create(name).send({ from: accounts[0], gas: 200000 })
   .then(result => {
    const message = `New user "${name}" successfully created`;
    setMessageCreateUser(message);
    console.log("Success"); //delete this line in the end
   })
   .catch(_e => {
    const message = `Ooops... there was an error while trying to create a new user with name "${name}"`;
    console.log(_e);
    setMessageCreateUser(message);
   });
}


async function readUser(e) {
   e.preventDefault();
   resetMessages();

   const id = e.target.elements[0].value;
   crud.methods.read(id).call()
   .then(result =>{
    const message = `Id: ${result[0]} Name: ${result[1]}`;
    setMessageReadUser(message);
    console.log("Success"); //delete this line in the end
   })
   .catch(_e=>{
    const message = `Ooops... there was an error while trying to read user with id ${id}`;
    setMessageReadUser(message);
   })
}

async function updateUser(e){
   e.preventDefault();
   resetMessages();

   const id = e.target.elements[0].value;
   const name = e.target.elements[1].value;
   crud.methods.update(id, name).send({from: accounts[0]})
   .then(result => {
    const message = `Changed name of user ${id} to ${name}`;
    setMessageUpdateUser(message);
    console.log("Success"); //delete this line in the end
   })
   .catch(_e => {
    const message = `Ooops... there was an error while trying to update name of user ${id} to ${name}`;
    setMessageUpdateUser(message);
   });
}

async function deleteUser(e){
   e.preventDefault();
   resetMessages();

   const id = e.target.elements[0].value;
   crud.methods.destroy(id).send({from: accounts[0]})
   .then(result =>{
    const message = `Deleted user ${id}`;
    setMessageDeleteUser(message);
   })
   .catch(_e=>{
    const message = `Ooops... there was an error while trying to delete user ${id}`;
    setMessageDeleteUser(message);
   })
}

if (!web3) {
   return <div>Loading...</div>;
}

return (


    <div class="container">
    Hello!!
    <div class="row">
       <div class="col-sm-12">

        <h1>Crud Dapp</h1>
        <form id="create" onSubmit={e => createUser(e)}>
           <h2>Create user</h2>
           <div class="form-group">
            <label for="name">Name</label>
            <input id="name" type="text" class="form-control"></input>
           </div>
           <button type="submit" class="btn btn-primary">Submit</button>
           <p id="create-result">{messageCreateUser}</p>
        </form>

        <hr/>
        <form id="read" onSubmit={e => readUser(e)}>
           <h2>Read user</h2>
           <div class="form-group">
            <label for="read-id">Id</label>
            <input id="read-id" type="number" class="form-control"></input>
           </div>
           <button type="submit" class="btn btn-primary">Submit</button>
           <p id="read-result">{messageReadUser}</p>
        </form>

        <hr/>

        <form id="edit" onSubmit={e=> updateUser(e)}>
           <h2>Edit user</h2>
           <div class="form-group">
            <label for="edit-id">Id</label>
            <input id="edit-id" type="number" class="form-control"></input>
            <label for="edit-name">Name</label>
            <input id="edit-name" type="text" class="form-control"></input>
           </div>
           <button type="submit" class="btn btn-primary">Submit</button>
           <p id="edit-result">{messageUpdateUser}</p>
        </form>

        <hr/>

        <form id="delete" onSubmit = {e=> deleteUser(e)}>
           <h2>Delete user</h2>
           <div class="form-group">
            <label for="delete-id">Id</label>
            <input id="delete-id" type="number" class="form-control"></input>
           </div>
           <button type="submit" class="btn btn-primary">Submit</button>
           <p id="delete-result">{messageDeleteUser}</p>
        </form>

       </div>
    </div>
   </div>

);
}

export default App;
import Web3 from 'web3';
import Crud from './contracts/Crud.json';

const getWeb3 = () => {
   return new Web3('http://localhost:9545'); // fixed quote
};

const getCrud = async (web3) => {
   const networkId = await web3.eth.net.getId();
   const deployedNetwork = Crud.networks[networkId];

   if (!deployedNetwork) {
       throw new Error("Contract not deployed on the current network");
   }

   return new web3.eth.Contract(
       Crud.abi,
       deployedNetwork.address
   );
};

export { getWeb3, getCrud };

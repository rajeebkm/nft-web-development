# nft-web-development

<p align="center">
  <a href="https://github.com/rajeebkm/nft-web-development" target="_blank">
    <img src="/public/demofronted.png" width="620">
  </a>
</p>

Please run ```npm install ``` on the terminal to download the appropriate packages already defined to the ```package.json``` file. 
Make sure you are in the source file. 

**Please ensure you have downloaded the following additionally **

1. Ganache
2. Truffle (global installation)
3. Metamask.io (hooked up on the browser)

**To run the development server on a local host scripts:** ```npm run start```

For truffle tests and console please consult the official Truffle documentaion for updates.


Compile contracts
-----------------
```
>> truffle compile

```

Deploy contracts
----------------
```
>> truffle migrate --reset --compile-none (if compiled already)
>> truffle migrate --reset
```

Truffle Console
----------------
```
>> truffle(development)> kryptoBirdz = await KryptoBirdz.deployed()
undefined
>> truffle(development)> kryptoBirdz.name()
'KryptoBirdz'
>> truffle(development)> kryptoBirdz.symbol()
'KBIRDZ'
>> truffle(development)> kryptoBirdz.mint('https...1')
>> truffle(development)> kryptoBirdz.mint('https...2')
>> truffle(development)> kryptoBirdz.mint('https...3')
>> truffle(development)> kryptoBirdz.address
'0x7a1670435835f8813527f96110cB04cb315Aec8a'
>> truffle(development)> kryptoBirdz.totalSupply()      
BN { negative: 0, words: [ 3, <1 empty item> ], length: 1, red: null }
>> truffle(development)> kryptoBirdz.balanceOf('0x3B1a5D9A6e26C0BDDB08De29c508B904dCBe692d')
BN { negative: 0, words: [ 3, <1 empty item> ], length: 1, red: null }
>> truffle(development)> kryptoBirdz.kryptoBirdz(0)
'https...1'
>> truffle(development)> kryptoBirdz.kryptoBirdz(1)
'https...2'
>> truffle(development)> kryptoBirdz.kryptoBirdz(2)
'https...3'
>> truffle(development)> kryptoBirdz.tokenByIndex(0)
BN { negative: 0, words: [ 0, <1 empty item> ], length: 1, red: null }
>> truffle(development)> kryptoBirdz.tokenByIndex(1)
BN { negative: 0, words: [ 1, <1 empty item> ], length: 1, red: null }
>> truffle(development)> kryptoBirdz.tokenByIndex(2)
BN { negative: 0, words: [ 2, <1 empty item> ], length: 1, red: null }
>> truffle(development)> accounts
[
  '0x3B1a5D9A6e26C0BDDB08De29c508B904dCBe692d',
  '0xD284Af3B2e7F5786804D584Df3613681971fBA15',
  '0x385CfDCE62536c7457D533d8795597e6F613Aa15',
  '0xa5cA78CB73597d0259B28cb3b27423073675F2cB',
  '0xC665F8516314aDAa402045c0c9C6ECe82Ad76302',
  '0x317EC5d040d436B11001F86254814d7C68f3c3EE',
  '0x68b2CC1455CCe5E8A33f8D9e4bD854E5aE06BF4C',
  '0xdc607573c6dc6447b43Db050D3c408Cda4eE1aaB',
  '0x9fDf72Ae43f0Be1B844aef38A81986BAb2788304',
  '0x21C847E74836278f87800d54BdB7F3339699D64B'
]
>> truffle(development)> kryptoBirdz.transferFrom('0x3B1a5D9A6e26C0BDDB08De29c508B904dCBe692d','0xD284Af3B2e7F5786804D584Df3613681971fBA15',0)
{
  tx: '0x28b5ad97ef8ca15809f4d2a4eaf2905a31fdb0cc2c8859c86ab30f393f4771bc',
  receipt: {
    transactionHash: '0x28b5ad97ef8ca15809f4d2a4eaf2905a31fdb0cc2c8859c86ab30f393f4771bc',
    transactionIndex: 0,
    blockNumber: 32,
    blockHash: '0xd9e82b68132b1bba62f4bccb722183be38c6110f8d90da7ec09f701c8d3dd573',
    from: '0x3b1a5d9a6e26c0bddb08de29c508b904dcbe692d',
    to: '0x7a1670435835f8813527f96110cb04cb315aec8a',
    cumulativeGasUsed: 58012,
    gasUsed: 58012,
    contractAddress: null,
    logs: [ [Object] ],
    logsBloom: '0x00000000000000008000000000000000000000000000000000000000000010000000000000000800000000000000000000000000000000000000000000008000000000000000000000000008000000000000000000008000000000000400000000000000020000000000000000000800000000000000000000000010000800000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000002000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000000',
    status: true,
    effectiveGasPrice: '0x95f3b3be',
    type: '0x2',
    rawLogs: [ [Object] ]
  },
  logs: [
    {
      address: '0x7a1670435835f8813527f96110cB04cb315Aec8a',
      blockHash: '0xd9e82b68132b1bba62f4bccb722183be38c6110f8d90da7ec09f701c8d3dd573',
      blockNumber: 32,
      logIndex: 0,
      removed: false,
      transactionHash: '0x28b5ad97ef8ca15809f4d2a4eaf2905a31fdb0cc2c8859c86ab30f393f4771bc',
      transactionIndex: 0,
      id: 'log_be532bbf',
      event: 'Transfer',
      args: [Result]
    }
  ]
}

>> truffle(development)> kryptoBirdz.balanceOf('0x3B1a5D9A6e26C0BDDB08De29c508B904dCBe692d')
BN { negative: 0, words: [ 2, <1 empty item> ], length: 1, red: null }
>> truffle(development)> kryptoBirdz.balanceOf('0xD284Af3B2e7F5786804D584Df3613681971fBA15')
BN { negative: 0, words: [ 1, <1 empty item> ], length: 1, red: null }
>> truffle(development)> kryptoBirdz.totalSupply()
BN { negative: 0, words: [ 3, <1 empty item> ], length: 1, red: null }

```

ERC165 & NFT Contract Interface Support
----------------------------------------

The ERC165 Standard is just a way of checking if your contract's data match the data of any given interface.

Every ERC-721 compliant contract must implement the ERC721 and ERC165 interfaces

IERC165.sol
-----------

```
//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


interface IERC165 {
    /// @notice Query if a contract implements an interface
    /// @param interfaceID The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    ///  uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    ///  `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

```

Weather App
-----------

Fronted
-------

React:
------

Website: ```https://reactjs.org/```

Article: ```https://www.sitepoint.com/create-react-app/```
Create React App
----------------
npx create-react-app my-app
cd my-app
npm start

React Hooks
-----------
```useState
useEffect
```


API call (grab the JSON data of weather): ``` https://openweathermap.org/```


API key & Axios promise Library
--------------------------------
```axios``` is promise based HTTP client for browser and node.js
axios is a library which will allow us to make requests the backend with promises.

Download and Install axios: ```npm i axios```

Use ```import axios from 'axios';``` in App.js file

App.js file (weather-application)
---------------------------------

```
import { useEffect, useState } from 'react';
import axios from 'axios';
import './App.css';

// Weather Application
// we want to grab data from a public weather database
// API (Application Programming Interface) call to get JSON weather data
// STATE! Plain JavaScript object that holds the current state of information
// dynamic data (like city information etc.)
// 2 ways to handle state in react 1. constructor and class based components 2. Functional and Hooks
// In our app, we will be using Hooks to handle our state


// useEffect hook tells our component App to do something after rendering
// useState hook initialize the state and sets the state 
function App() {

  const [allData, setAllData] = useState({
    city: '',
    country: '',
    temperature: ''
  })

  useEffect(() => {
    // we add what we want to happen after rendering
    // fetch the database information the API call of weather (grab JSON data)
    fetchData()
  }, [])

  const fetchData = async(city) => {
    const APIKEY = '38a48e17d58179816499f2b98ac0a1af';
    const result = await axios.get(`https://api.openweathermap.org/data/2.5/weather?q=${'atlanta'}&appid=${APIKEY}`);
    
    await setAllData({
      city: result,
      country: result.data.sys.country,
      temperature: result
    })
  }

  return(
    <div className="App">
      {console.log('testing 123', allData.country)}
     
      
    </div>)
}

export default App;
```

Try & Catch Error Handling
--------------------------
```
const fetchData = async(city) => {
    try {
      const APIKEY = '38a48e17d58179816499f2b98ac0a1af';
      const result = await axios.get(`https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${APIKEY}`);

      await setAllData({
        city: result,
        country: result.data.sys.country,
        temperature: result
      })
  } catch(error) {
    console.log("API is not loaded correctly or loaded for the very first time");
  }
}
```


Styling weather-application
---------------------------
CSS Gradient: ``` https://cssgradient.io/ ```




Fronted NFT Marketplace
------------------------

web3.js
-------
Get accounts: const accounts = await window.web3.eth.getAccounts();


bootstarp
----------
Link: https://hackerthemes.com/

mdbootstrap
-----------
Link: https://mdbootstrap.com/

imgdb uploaded images links (https://imgbb.com/upload)
---------------------------
"https://i.ibb.co/R3M4y7W/k1.png"
"https://i.ibb.co/q1Tfmyr/k2.png" 
"https://i.ibb.co/VBh0NfZ/k3.png" 
"https://i.ibb.co/71SVfy0/k4.png" 
"https://i.ibb.co/80pxK73/k5.png" 
"https://i.ibb.co/cCtXdG0/k6.png" 
"https://i.ibb.co/Hd7RGFq/k7.png" 
"https://i.ibb.co/N797F1t/k8.png" 
"https://i.ibb.co/HgTddwp/k9.png" 
"https://i.ibb.co/pXPf1yR/k10.png"
"https://i.ibb.co/Vvctm3R/k11.png"
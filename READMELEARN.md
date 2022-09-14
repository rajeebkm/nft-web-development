# nft-marketplace-starter-kit
Please run npm install on the terminal to download the appropriate packages already defined to the package.json file. 
Make sure you are in the source file. 

**Please ensure you have downloaded the following additionally **

1. Ganache
2. Truffle (global installation)
3. Metamask.io (hooked up on the browser)

**To run the development server on a local host scripts:** npm run start

For truffle tests and console please consult the official Truffle documentaion for updates.


Compile contracts
-----------------
>> truffle compile

Deploy contracts
----------------
>> truffle migrate --reset --compile-none (if compiled already)
>> truffle migrate --reset

Truffle Console
----------------
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



ERC165 & NFT Contract Interface Support
----------------------------------------

The ERC165 Standard is just a way of checking if your contract's data match the data of any given interface.

Every ERC-721 compliant contract must implement the ERC721 and ERC165 interfaces
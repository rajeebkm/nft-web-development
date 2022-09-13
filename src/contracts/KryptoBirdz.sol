//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import './ERC721Connector.sol';

contract KryptoBirdz is ERC721Connector {

    // array to store nfts
    string[] public kryptoBirdz;

    mapping(string => bool) _kryptoBirdzExists;

    constructor() ERC721Connector("KryptoBirdz", "KBIRDZ") {

    }

    function mint(string memory _kryptoBirdz) public {
        require(!_kryptoBirdzExists[_kryptoBirdz], "ERROR! kryptoBird already exists");
        // uint256 _id = kryptoBirdz.push(_kryptoBirdz); // this is deprecated 
        kryptoBirdz.push(_kryptoBirdz);
        uint256 _id = kryptoBirdz.length - 1;
        // (.push no longer returns the length but a reference to an added element)
        _mint(msg.sender, _id);
        _kryptoBirdzExists[_kryptoBirdz] = true;
    }

    

}
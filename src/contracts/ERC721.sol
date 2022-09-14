//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC165.sol";

contract ERC721 is ERC165 {

    // mapping in solidity creates a hash table of key pair values
    // mapping from token id to the owner
    mapping(uint256 => address) private _tokenOwner;
    // mapping from owner to number of owned tokens
    mapping(address => uint256) private _ownedTokensCount;
    // mapping from tokenId to approve addresses
    mapping(uint256 => address) private _tokenApprovals;

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /// @notice Count all NFTs assigned to an owner
    /// @dev NFTs assigned to the zero address are considered invalid, and this
    ///  function throws for queries about the zero address.
    /// @param _owner An address for whom to query the balance
    /// @return The number of NFTs owned by `_owner`, possibly zero
    function balanceOf(address _owner) public view returns (uint256){
        require(_owner != address(0), "ERROR! owner query for non-existance token");
        return _ownedTokensCount[_owner];
    }

    /// @notice Find the owner of an NFT
    /// @dev NFTs assigned to zero address are considered invalid, and queries
    ///  about them do throw.
    /// @param _tokenId The identifier for an NFT
    /// @return The address of the owner of the NFT
    function ownerOf(uint256 _tokenId) public view returns (address){
        address owner = _tokenOwner[_tokenId];
        require(owner != address(0), "ERROR! owner query for non-existance token");
        return owner;

        
    }
    
    function _exists(uint256 tokenId) internal view returns(bool){
        // setting the address of nft owner to check the mapping of the address from the tokenOwner at the tokenId.
        address owner = _tokenOwner[tokenId];
        // return truthiness the address is not zero
        return owner != address(0);
    }

    function _mint(address to, uint256 tokenId) internal virtual{
        // requires that the address is not zero
        require(to != address(0), "ERC721: minting to the zero address");
        // requires that the token does not already exist
        require(!_exists(tokenId), "ERC721: token already minted");
        // wwe are adding a new address with a tokenId for minting
        _tokenOwner[tokenId] = to;
        // keeping track of each address that is minting and adding one to the count.
        _ownedTokensCount[to] += 1;
        // emit the Transfer event
        emit Transfer(address(0), to, tokenId);

    }

    /// @notice Transfer ownership of an NFT -- THE CALLER IS RESPONSIBLE
    ///  TO CONFIRM THAT `_to` IS CAPABLE OF RECEIVING NFTS OR ELSE
    ///  THEY MAY BE PERMANENTLY LOST
    /// @dev Throws unless `msg.sender` is the current owner, an authorized
    ///  operator, or the approved address for this NFT. Throws if `_from` is
    ///  not the current owner. Throws if `_to` is the zero address. Throws if
    ///  `_tokenId` is not a valid NFT.
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    function _transferFrom(address _from, address _to, uint256 _tokenId) internal {
        // require (safe functionality)
        // require the address transferring the token actually owns the token 
        require(_from == ownerOf(_tokenId), "Trying to transfer a token the address doesn't own");
        // require that the address receiving a token is not a zero address
        require(_to != address(0), "ERROR! ERC721 Transfer to zero address");
        // add the tokenId to the address receiving the token
        _tokenOwner[_tokenId] = _to;
        // update the balance of address from
        _ownedTokensCount[_from] -= 1;
        // update the balance of address to
        _ownedTokensCount[_to] += 1;

        emit Transfer(_from, _to, _tokenId);

    }

    function transferFrom(address _from, address _to, uint256 _tokenId) public {
        require(isApprovedOrOwner(msg.sender, _tokenId));
        _transferFrom(_from, _to, _tokenId);
    }

    // require that the person approving is the owner
    // require that we can't approve sending tokens of owner to the owner (current caller)
    // we are approving an address to a tokenId, update the map of approval addresses
    // emit event Approval
    function approve(address _to, uint256 _tokenId) public {
        address owner = _tokenOwner[_tokenId];
        require(msg.sender == owner, "Current caller isn't the owner of the token");
        require(_to != owner, "ERROR! Approval to current owner");
        _tokenApprovals[_tokenId] = _to;
        emit Approval(owner, _to, _tokenId);

    }

    function isApprovedOrOwner(address spender, uint256 _tokenId) internal view returns(bool){
        require(_exists(_tokenId), "token doesn't exist");
        address owner = ownerOf(_tokenId);
        return (spender == owner || getApproved(_tokenId) == spender);

    }

    function getApproved(uint256 _tokenId) public view returns(address){
        return _tokenApprovals[_tokenId];
    }




}
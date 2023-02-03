// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract HttpsMynftComKedarTokens is ERC721, ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    uint256 public mintRate = 0.01 ether;
    uint public MAX_SUPPLY = 10000;

    constructor() ERC721("https://mynft.com/kedar/tokens/", "KMTK") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://mynft.com/kedar/tokens/";
    }

    // function safeMint(address to) public onlyOwner { // any owner can mint NFT
    // function safeMint(address to) public { // now anyone can mint NFT
    function safeMint(address to) public payable { // now anyone can mint NFT
        require(msg.value >= mintRate, "Not enought ether sent");
        require(totalSupply() < MAX_SUPPLY, "Can't mint more than 10000 NFTs");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    // creating functionality to allow users withdraw
    function withdraw() public onlyOwner{
        require(address(this).balance > 0, "Balance is 0!");
        payable(owner()).transfer(address(this).balance); // address(this) returns address of this smart contract
    }
}

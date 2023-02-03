# NFT-store-ERC721-web3.0

NFT store for web3.0. Used openzeppelin ERC721

## NFT Address -

0x98cA1117af4321F67799817ECf1f6F34C6D06Dd4

for running server type -

```
python -m SimpleHTTPSever
or
simply open live share http server
```

Check by writing in console => await contract.methods.name().call() -> 'https://mynft.com/kedar/tokens/'

## Features

1. User can <b>MINT NFTs</b>. (add your wallet address & click on \_smartMin. )
2. User can transfer NFTs from his account to another (person's) account. (use safeTransferFrom functionality, in "from" add your wallet address & in "to" add other wallet address & add token id (starting from 0, so 1st minted nft is 0). Click on transact) (Note - updated owner's address can be seen on the downside of transact button, terminal values are not updated)
3. User can get tokenURL by entering token token id (it is endpoint used to store metadata like name, discription, </b>IMAGE IS ALSO PUTTED HERE</b>, attributes, so other sw can look for metadata. It is like adding token id + 1 added to baseUrl)
4. Metadata standards - https://docs.opensea.io/docs/metadata-standards
5. eip-721 (ethereum erc721) standards - https://eips.ethereum.org/EIPS/eip-721

## Developer's Guide -

1. Token number starts from 0, 1, 2, .....
2. When we create a function payable, its button becomes red in color. That means to mint any token, you require some amount of ethers in "value" below the environment and account in remix IDE. eg. 10 finney or 0.01 ethers. You can see conversions here https://www.alchemy.com/gwei-calculator#:~:text=1%20ETH-,What%20is%20Gwei%3F,1%2C000%2C000%2C000%20gwei%20in%20one%20ether.
3. Withdraw functionality (only allowed to owner of that NFT) - creating functionality to allow users withdraw - helps onwer to get back his ethers(obviously gas fees will be subtracted), by giving away his NFT
4. Upper limit is set to allow only certain no. of NFTs to be minted - say 1000 NFTs only
5. Metadata standards - https://docs.opensea.io/docs/metadata-standards
6. eip-721 (ethereum erc721) standards - https://eips.ethereum.org/EIPS/eip-721
7. Contract Wizard by openzepplin - https://wizard.openzeppelin.com/#erc721
8. uriChangebleSmartContractsBytecode.json contains bytecode of a new smart contract which was created to store the traits(metadata) of NFTs. This new smart contract was similar to above contract, just two difference - one that it did not had "enumerable" property from Contract Wizard, but had "uriStorage" property along with mintable+autoIncrement property and second that in safeMint function here we not only have account vfalue but also uri value of the NFT token. This contracts needs to be deployed. We deploy it using deploy.html .
   We need to go down to bottom to uriChangebleSmartContractsBytecode.json and copy "object" key and paste it in new bytecode field in html input (add 0x in front to make it hexadecimal). Also copy ABI from new smart contract and paste it in html file's ABI input field. Confirm the transaction. Then deploy this new smart contract. You can use deply.html for that or in remix IDE, just connect it's account to the metamask and deploy the new smart contract.
   After deploying this new smart contract, copy address of this new smart contract, paste it in index.html 's ADDRESS which is address of smart contract. Also, change ABI to abi of new smart contract.
   Then create an endpoint (you can use https://www.npoint.io/ for that) which contains metadata of the NFT. Metadata schema is given in https://eips.ethereum.org/EIPS/eip-721 below "This is the “ERC721 Metadata JSON Schema” referenced above.". It contains name, description and image. I have given it on https://api.npoint.io/bfdcdd95afa0adb55894
   Minted NFTs

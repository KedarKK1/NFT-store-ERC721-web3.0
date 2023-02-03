# NFT-store-ERC721-web3.0

NFT store for web3.0. Used openzeppelin ERC721

## Features

1. User can <b>MINT NFTs</b>. (add your wallet address & click on \_smartMin. )
2. User can transfer NFTs from his account to another (person's) account. (use safeTransferFrom functionality, in "from" add your wallet address & in "to" add other wallet address & add token id (starting from 0, so 1st minted nft is 0). Click on transact) (Note - updated owner's address can be seen on the downside of transact button, terminal values are not updated)
3. User can get tokenURL by entering token token id (it is endpoint used to store metadata like name, discription, </b>IMAGE IS ALSO PUTTED HERE</b>, attributes, so other sw can look for metadata. It is like adding token id + 1 added to baseUrl)
4.

## Developer's Guide -

1. Token number starts from 0, 1, 2, .....
2. When we create a function payable, its button becomes red in color. That means to mint any token, you require some amount of ethers in "value" below the environment and account in remix IDE. eg. 10 finney or 0.01 ethers. You can see conversions here https://www.alchemy.com/gwei-calculator#:~:text=1%20ETH-,What%20is%20Gwei%3F,1%2C000%2C000%2C000%20gwei%20in%20one%20ether.
3. Withdraw functionality (only allowed to owner of that NFT) - creating functionality to allow users withdraw - helps onwer to get back his ethers(obviously gas fees will be subtracted), by giving away his NFT
4. Upper limit is set to allow only certain no. of NFTs to be minted - say 1000 NFTs only

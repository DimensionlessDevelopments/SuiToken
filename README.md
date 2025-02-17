#Set Up Environment

Note: We assume that you have already installed the Sui and Rust in your system. Anything in quotation marks "" is a command needed to be used.

Check your version
Open your terminal. Let’s check your Sui installation version.

Paste or type in "sui --version"
Note: If you face errors while installing Sui please make sure to follow all the steps on the sui.io website to Deploy Your First Sui Contract.

Create your Sui folder
The first step is to initialize a workspace environment. This will contain the basic files for running any Move file. You can create the workspace using the following command; I have named mine Developments:

sui move new Developments
Navigate to the sources/ directory. Create a new Move file. I am naming it dimension.move. You can name the Move file with whatever coin name you want it to be. 

Before we proceed we need to have enough tokens for the gas fees of what we will deploy:
- Check your wallet
- You can view the current active address using the following command:

sui client active-address
If you do not have an active address, follow the steps given below:

Run the following command to create your Sui account:

"sui client new-address ed25519"
-It will generate the output 

Important: Save the recovery phrase, it is important to have it to import your wallet.
Replace [YOUR_ADDRESS] in the command below with the address you received after running the last command and run it.

Run "sui client switch --address [YOUR_ADDRESS]"
Head over to the Sui Devnet faucet discord channel and paste “!faucet [YOUR_ADDRESS]” to receive 10 SUI tokens.

Deploy Your First Token on Sui:

Deploy your contract
Step 1:
- Firstly, we must go into our metaschool directory since it contains our contracts.

"cd developments"
Step 2:
- Now, let’s build our move file using the following command. This will create a new build folder and a Move.toml file.

"sui move build"
Step 3:
- You now need to set up a dev environment in Sui to deploy on the Sui testnet using the following commands:

"sui client new-env --alias devnet --rpc https://fullnode.devnet.sui.io:443"
"sui client switch --env devnet"
Step 4:
- Now is the time to publicize your contract. To do so, copy the absolute path of dimension.move by right-clicking on it and then selecting the copy path option on VS code. Once you have your path, you can now use the following command to publish by replacing [YOUR_PATH] with the path you just copied:

Note: If you are using IDE other than VS code please try finding the exact complete path for Dimension.move file.

"sui client publish --gas-budget 100000000 [YOUR_PATH]"
Step 5:
- Now that you have published the contract, you will get a long output. Scroll and copy the transaction digest. You can use this transaction digest to search for your transaction using Sui Explorer using the following link:

https://suiexplorer.com/?network=devnet


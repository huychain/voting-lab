# Voting

- [x] Step 0: Install Node, Ganache, and Visual Studio Code
- [x] Step 1: Build the Contract!
- [x] Step 2: Build and Deploy the Contract
- [x] Step 3: Add in voting logic
- [x] Step 4: Create a frontend
- [ ] Bonus 1: Dynamic Candidates
- [ ] Bonus 2: Vote with Your Wallet

------------------------------

#### start Ganache server

```
ganache-cli
```

or on specific port

```
ganache-cli -p 7545
```

#### setup environment for project

```
npm install solc
npm install web3@0.20.2
```

#### build
open terminal, type `node` to get to REPL, then

```javascript
Web3 = require('web3')
web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545")) // Check for the right port number

code = fs.readFileSync('Voting.sol').toString();
solc = require('solc');
compiledCode = solc.compile(code);

VotingContract = web3.eth.contract(JSON.parse(compiledCode.contracts[':Voting'].interface))

byteCode = compiledCode.contracts[':Voting'].bytecode
```

#### deploy
(latest contract version)

```javascript
deployedContract = VotingContract.new(
    ['Bitcoin', 'Litecoin', 'Dogecoin'],
    {
        data: byteCode, 
        from: web3.eth.accounts[0],
        gas: 1000000
    })
contractInstance = VotingContract.at(deployedContract.address)
```

#### notes on config index.js

replace `<interface>`, `<address>`

```javascript
...
abi = JSON.parse('<interface>')
...
contractInstance = VotingContract.at('<address>');
...
```

with latest retrieved from command

```javascript
compiledCode.contracts[':Voting'].interface

contractInstance.address
```

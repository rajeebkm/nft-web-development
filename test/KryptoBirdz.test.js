const chai = require("chai");
const { assert, expect, should } = chai;
const KryptoBirdz = artifacts.require("../KryptoBirdz");


// check for chai
require("chai").use(require("chai-as-promised")).should()

contract("KryptoBirdz", (accounts) => {

    let contract;

    //before tells our test to run this before anything else
    before(async() => {
        contract = await KryptoBirdz.deployed();
    })

   
      
    // testing container - describe
    describe("deployment", async() => {

        // test samples with writing - it
        it("deploys successfully", async() => {
            // contract = await KryptoBirdz.deployed();
            const address = contract.address;
            assert.notEqual(address, '');
            assert.notEqual(address, null);
            assert.notEqual(address, undefined);
            assert.notEqual(address, 0x0);
        });

        it("has a name", async() => {
            // contract = await KryptoBirdz.deployed();
            const name = await contract.name();
            assert.equal(name, "KryptoBirdz");
        });

        it("has a symbol", async() => {
            // contract = await KryptoBirdz.deployed();
            const symbol = await contract.symbol();
            assert.equal(symbol, "KBIRDZ");        
        });

    });

    describe("minting", async() => {
        it("creates a new token", async() => {
            const result = await contract.mint("https...1");
            const balance = await contract.balanceOf(accounts[0]);
            const totalSupply = await contract.totalSupply();
            // Success
            assert.equal(balance, 1);
            assert.equal(totalSupply, 1);
            const event = await result.logs[0].args;
            assert.equal(event._from, "0x0000000000000000000000000000000000000000", "_from is the contract zero address");
            assert.equal(event._to, accounts[0], "_to is the msg.sender");

            //Failure
            await contract.mint("https...1").should.be.rejected;
        });
    });

    describe("indexing", async() => {
        it("lists KryptoBirdz", async() => {
            // Mint three new tokens
            await contract.mint("https...2");
            await contract.mint("https...3");
            await contract.mint("https...4");
            const totalSupply = await contract.totalSupply();

             // loop through lists and grab KBird fro lists
            let result = [];
            let KryptoBird;
            for (let i = 1; i <= totalSupply; i++){
                KryptoBird = await contract.kryptoBirdz(i - 1 );
                result.push(KryptoBird);
            }
            // assert that our new array result is equal to expected result
            let expected = ['https...1', 'https...2', 'https...3', 'https...4'];
            assert.equal(result.join(","), expected.join(","));
        });

       
    });

})


import React, { Component } from 'react';
import Web3 from 'web3';
import detectEthereumProvider from '@metamask/detect-provider';
import KryptoBirdz from '../abis/KryptoBirdz.json';
import {MDBCard, MDBCardBody, MDBCardTitle, MDBCardText, MDBCardImage, MDBBtn} from 'mdb-react-ui-kit';
import './App.css';


class App extends Component {
    // lifecycle method
    async componentDidMount() {
        await this.loadWeb3();
        await this.loadBlockchainData();
    }
    // first up is to detect ethereum provider
    async loadWeb3() {
        const provider = await detectEthereumProvider();

        // modern browsers
        // if there is a provider, then lets log that's working and access the window from the doc
        // to set Web3 to the provider
        if(provider) {
            console.log('Ethereum wallet is connected');
            window.web3 = new Web3(provider);
        } else {
            // no ethereum provider
            console.log('No ethereum wallet connected, Please install MetaMask!');
        }

    }

    async loadBlockchainData() {
        const web3 = window.web3;
        const accounts = await web3.eth.getAccounts();
        this.setState({ account: accounts[0]})

        // create a constant js variable networkId which is set to blockchain network id.
        const networkId = await web3.eth.net.getId();
        const networkData = KryptoBirdz.networks[networkId];
        if(networkData) {
            // 1. create a variable abi set to the KryptoBird abi
            const abi = KryptoBirdz.abi;
            // 2. craete a variable address set to the networkData address
            const address = networkData.address;
            // 3. create a variable contract which grabs a new instance of web3 eth Contract
            const contract = await web3.eth.Contract(abi, address);
            // 4. log in the console the contract successfully
            this.setState({contract});
            // console.log(this.state.contract);

            // call the totalSupply of our KryptoBirdz
            // grab the totalSupply on the fronted and log the results
            const totalSupply = await contract.methods.totalSupply().call();
            this.setState({totalSupply});
            // console.log('Total Supply: ', totalSupply.toNumber());

            // setup an array to keep track of tokens
            // load KryptoBirdz
            for (let i = 1; i <= totalSupply; i++){
                const KryptoBird = await contract.methods.kryptoBirdz(i - 1 ).call();
                // how should we handle the state on the fronted?
                this.setState({
                    kryptoBirdz: [...this.state.kryptoBirdz, KryptoBird] // spread operator for merge and update
                })
            }
            // console.log(this.state.kryptoBirdz);

        } else {
            console.log('Smart contract is not deployed');
        }       
    }

    // with minting we are sending information and we need to specify the account
    mint = (kryptoBird) => {
        this.state.contract.methods.mint(kryptoBird).send({from: this.state.account}).once('receipt', (receipt) => {
            this.setState({
                kryptoBirdz: [...this.state.kryptoBirdz, kryptoBird]
            })
        })
    }

    // handle state with the help of constructor
    constructor(props) {
        // props argument helps us to pass state from one component to another
        super(props); // it allows the entire component to access the props of the parent class with (this._)
        // initialize state
        this.state = {
            account: '',
            contract: null,
            totalSupply: 0,
            kryptoBirdz: []
        }
    }

    render() {
        return(
            
            <div className='container-filled'>
                <nav className='navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow'>
                    <div className='navbar-brand col-sm-3 col-md-3 mr-0' style={{color: 'pink'}}>
                        KryptoBirdz NFTs (Non Fungible Tokens)
                    </div>
                    <ul className='navbar-nav px-3'>
                        <li className='nav-item text-nowrap d-none d-sm-none d-sm-block'>
                            <small className='text-white'>
                                Wallet Connected: {this.state.account}
                            </small>
                        </li>

                    </ul>
                </nav>
                <div className='container-fluid mt-1'>
                    <div className='row'>
                        <main role='main' className='col-lg-12 d-flex text-center'>
                            <div className='content mr-auto ml-auto' style={{opacity:'0.8'}}>
                                <h1 style={{color: 'brown'}}>KryptoBirdz NFT Marketplace</h1>

                                <form onSubmit={(event) => {
                                    event.preventDefault();
                                    const kryptoBird = this.kryptoBirds.value;
                                    this.mint(kryptoBird);
                                }}>
                                <input 
                                    type = 'text'
                                    placeholder = 'Add a file location'
                                    className ='form-control mb-1' 
                                    ref = {(input) => {
                                         this.kryptoBirds = input
                                    }}
                                />
                                <input 
                                    style = {{ margin: '6px'}}
                                    type = 'submit'
                                    className = 'btn btn-primary btn-black'
                                    value = 'MINT'
                                />
                                </form>
                            </div>
                        </main>
                        <hr></hr>
                        <div className='row textCenter' style={{marginLeft: '40px',position: 'center'}}>
                            {this.state.kryptoBirdz.map((kryptoBird, key) => {
                                return( 
                                    <div>
                                        <div>
                                            <MDBCard className='token img' style={{maxWidth: '22rem'}}>
                                                <MDBCardImage src={kryptoBird} position='top' height='250rem' style={{marginRight: '4px'}}/>
                                                <MDBCardBody>
                                                    <MDBCardTitle>KryproBirdz NFT</MDBCardTitle>
                                                    <MDBCardText style={{position: 'center'}}>The KryptoBirdz are 20 uniquely generated KBirdz from the cyberpunk cloud galaxy Mystopia! There is only one of each bird and each bird can be own by a single person on the Ethereum blockchain.</MDBCardText>
                                                    <MDBBtn href={kryptoBird}>Download</MDBBtn>
                                                </MDBCardBody>
                                            </MDBCard>
                                        </div>
                                    </div>
                                )})} 
                        </div>
                    </div>
                </div>
            </div>
        )
        
    }
}

export default App;
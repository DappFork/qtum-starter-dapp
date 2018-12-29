# QTUM starter dApp

<p align="center">		
  <img src="logo.png">		
</p>

This project was generated with [vue-cli](https://github.com/vuejs/vue-cli) version 3.2.1

An Vue [QTUM](https://github.com/qtumproject) starter dApp.

# Demo
![](demo.gif)

# Project setup
For a full and complete guide I would like to refer to [Developer's Guide to QTUM](https://github.com/qtumproject/qtumbook)
## Install Docker & Node
**https://www.docker.com/get-started**

**https://nodejs.org/en/**

## Download the latest qtumportal image
    docker pull hayeah/qtumportal:latest

## Deploy a Smart Contract
Start qtumd in regtest mode:
```
docker run -it --rm \
  --name myapp \
  -v `pwd`:/dapp \
  -p 9899:9899 \
  -p 9888:9888 \
  hayeah/qtumportal
```
Enter into the container:
```
docker exec -it myapp sh
```
Generate some initial balance:
```
qcli generate 600
```
Use the Solar Smart Contract tool to deploy a contract ( I used the one in the /contracts folder)

    solar deploy MyContract.sol
    
```
🚀  All contracts confirmed
   deployed MyContract.sol =>
      a778c05f1d0f70f1133f4bbf78c1a9a7bf84aed3 (<= Different for you!!)
```
Solar created a `solar.development.json` file for you.
Use `solar status` to check your deployed contracts.
```
✅  MyContract.sol
        txid: 457a5afe15686c0bd596635aeb78d4ff7d2bf6a75df66c7251e89ce4d9c8f6d3
     address: 3db297ee4c225b45219d2a7aa68afea7f4e68832
   confirmed: true
       owner: qdgznat81MfTHZUrQrLZDZteAx212X4Wjj
```
## Install dependencies
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Run your tests
```
npm run test
```

### Lints and fixes files
```
npm run lint
```

### Run your end-to-end tests
```
npm run test:e2e
```

### Run your unit tests
```
npm run test:unit
```

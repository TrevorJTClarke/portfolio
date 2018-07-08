# Decentralized Portfolio

Decentralized portfolio based on ERC721 & EIP998

###### NOTE:
This project is a submission for the Consensys Academy 2018.
All code represented is aimed to be a clear proof of concept.

Documentation contract architecture:
- [Design Pattern Decisions](/docs/design_pattern_decisions.md)
- [Avoiding Common Attacks](/docs/avoiding_common_attacks.md)

## Getting Started

Clone the repo and run `npm i` then `truffle test`.
You should see a number of tests passing.
The repo development is mainly in `/contracts`, `/src` and `/test`.

#### To run local development website:
`npm run dev`
Open the server link printed in cli.

#### Helpful Commands
- `npm run build` - Builds compiled client deployable package
- `npm test` - Runs all tests
- `truffle compile` - Test contracts are compiling and have no errors
- `truffle migrate` - Compile and deploy contracts to local blockchain

# test-contracts

Cannon contracts intended for manual and automated testing.

The published packaged can be seen/interacted with here: [usecannon.com/packages/test-contracts](https://usecannon.com/packages/test-contracts)

## Deployment

1. Dry build the package to check everything is correct:
  ```sh
  cannon build . --chain-id 11155111 --dry-run --impersonate 0xca111279D6aeEc39849ed5CD2bA3045381643422
  ```
2. Deploy package:
  ```sh
  cannon build . --chain-id 11155111
  ```
3. Publish:
  ```sh
  cannon publish test-contracts:X.X.X@types-tester --chain-id 11155111
  ```
4. Verify on Etherscan:
  ```sh
  cannon verify test-contracts:X.X.X@types-tester --chain-id 11155111 --api-key NB....
  ```

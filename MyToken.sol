// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title MyToken
 * @dev Implementation of a basic ERC20 Token with Minting and Burning capabilities.
 */
contract MyToken is ERC20, ERC20Burnable, Ownable {
    constructor(address initialOwner) 
        ERC20("MyToken", "MTK") 
        Ownable(initialOwner) 
    {}

    /**
     * @dev Function to mint new tokens. Restricted to the contract owner.
     * @param to The address that will receive the minted tokens.
     * @param amount The amount of tokens to mint.
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}

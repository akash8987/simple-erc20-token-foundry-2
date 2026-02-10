// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./MyToken.sol";

contract MyTokenTest is Test {
    MyToken public token;
    address public owner = address(1);
    address public user = address(2);

    function setUp() public {
        vm.prank(owner);
        token = new MyToken(owner);
    }

    function testInitialSupplyIsZero() public {
        assertEq(token.totalSupply(), 0);
    }

    function testMinting() public {
        vm.prank(owner);
        token.mint(user, 1000e18);
        assertEq(token.balanceOf(user), 1000e18);
    }

    function testFailMintingByNonOwner() public {
        vm.prank(user);
        token.mint(user, 1000e18);
    }
}

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library SafeMath {
    // build functions to perform safe math operations

    function add(uint256 x, uint256 y) internal pure returns(uint256) {
        uint256 r = x + y;
        require(r >= x, "SafeMath: addition overflow");
        return r;
    }

    function sub(uint256 x, uint256 y) internal pure returns(uint256) {
        require(y <= x, "SafeMath: substraction overflow");
        uint256 r = x - y;
        return r;
    }

    function mul(uint256 x, uint256 y) internal pure returns(uint256) {
        // gas optimizaion
        if (x ==0) {
            return 0;
        }
        uint256 r = x * y;
        require(r / x == y, "SafeMath: multiplication overflow");
        return r;
    }

    function div(uint256 x, uint256 y) internal pure returns(uint256) {
        require(y > 0, "SafeMath: division overflow, division by zero");
        uint256 r = x / y;
        return r;
    }

    function mod(uint256 x, uint256 y) internal pure returns(uint256) {
        require(y != 0, "SafeMath: modulo by zero");
        uint256 r = x % y;
        return r;
    }

    
    
}
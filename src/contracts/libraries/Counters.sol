// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import './SafeMath.sol';


/*
 * @dev Provides counters that can only be incremented, decremented or reset. This can be used e.g. to track the number
 * of elements in a mapping, issuing ERC721 ids, or counting request ids.
 * Include with `using Counters for Counters.Counter;`
 * Since it's not possible to overflow a 256 bit integer (in decimal: 115,​792,​089,​237,​316,​195,​423,​570,​985,​008,​687,​907,​853,​269,​984,​665,​640,​564,​039,​457,​584,​007,​913,​129,​639,​935 or, .1579 x 10^77) with increment of one, `increment` can skip the SafeMath overflow check, thereby saving the gas
 */


 /* 

 In previous versions of Solidity (prior Solidity 0.8.x) an integer would automatically roll-over to a lower or higher number. If you would decrement 0 by 1 (0-1) on an unsigned integer, the result would not be -1, or an error, the result would simple be: MAX(uint). So, SafeMath library shuld be used to check under/overflows.

 In Solidity 0.8, the compiler will automatically take care of checking for overflows and underflows. 

 Reference: https://ethereum-blockchain-developer.com/010-solidity-basics/03-integer-overflow-underflow/
 */

 library Counters {
    using SafeMath for uint256;


    // build your own variable type with the keyword 'struct'
    // is a mechanism to keep track of our values of arithmetic changes to our code
    struct Counter {
        // keeping track of current value
        uint256 _value;
        
    }

    // we wan to find the current value of a count
    function current(Counter storage counter) internal view returns(uint256) {
        return counter._value;
    }

    function increment(Counter storage counter) internal {
        counter._value += 1;
    }

    function decrement(Counter storage counter) internal {
        counter._value = counter._value.sub(1);
    }

    function reset(Counter storage counter) internal {
        counter._value = 0;
    }

 }

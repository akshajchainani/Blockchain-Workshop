// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Functions {
    int public result;

    function getResult() public view returns (int) {
        return result;
    }

    // This updates the stored result (transaction)
    function calculateResult(int number) public {
        result = square(number) + 1;
    }

    // This returns the result without modifying state
    function calculateResultView(int number) public pure returns (int) {
        return number * number + 1;
    }

    // This is also a view-only square function
    function square(int number) public pure returns (int) {
        return number * number;
    }
}

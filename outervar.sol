// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VariableScoping {
    // Global (state) variable
    uint public globalVar = 100;

    function variableScoping() public view returns (uint, uint, uint) {
        uint sameBar = 10; // Local variable
        uint innerVar;

        {
            uint sameBar = 5; // Another local variable with the same name
            innerVar = sameBar; // Accessible only within these curly braces
        }

        // 'sameBar' here refers to the outer variable
        uint outerBlockVar = sameBar;

        return (globalVar, innerVar, outerBlockVar);
    }
}

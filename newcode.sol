// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExternalContract {
    function externalFunction(uint256 value) external pure returns (string memory) {
        require(value != 0, "Value cannot be zero");
        return "Success";
    }
}

contract TryCatchExample {
    event SuccessEvent(string message);
    event ErrorEvent(string reason);
    event FallbackErrorEvent();

    ExternalContract externalContract;

    constructor(address _externalContractAddress) {
        externalContract = ExternalContract(_externalContractAddress);
    }

    function callExternalFunction(uint256 value) public {
        try externalContract.externalFunction(value) returns (string memory result) {
            emit SuccessEvent(result);
        } catch Error(string memory reason) {
            // Handle error that comes with a reason string
            emit ErrorEvent(reason);
        } catch {
            // Handle any other error (fallback)
            emit FallbackErrorEvent();
        }
    }
}
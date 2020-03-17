pragma solidity >=0.4.19 < 0.7.0;


/** verification helper */
contract MythXVerificationUtils {
    address public constant _MYTHX_CREATOR   = 0xafFEaFFEAFfeAfFEAffeaFfEAfFEaffeafFeAFfE;  //account wiht big ether balance
    address public constant _MYTHX_ATTACKER  = 0xDeaDbeefdEAdbeefdEadbEEFdeadbeEFdEaDbeeF;  //represents the attacker in generic bug checks
    address public constant _MYTHX_ACCOUNT_0 = 0xAaaaAaAAaaaAAaAAaAaaaaAAAAAaAaaaAaAaaAA0;  //user account with big Ether balance (origin for seed input)
    address public constant _MYTHX_ACCOUNT_1 = 0xAaAAAaaAAAAAAaaAAAaaaaAaAaAAAAaAAaAaAaA1;  //user account with 0 Ether balance
    address public constant _MYTHX_ACCOUNT_2 = 0xAaAaaAAAaAaaAaAaAaaAAaAaAAAAAaAAAaaAaAa2;  //user account with big Ether balance
    address public constant _MYTHX_ACCOUNT_3 = 0xaaaaAaAaaAAaAaaaaAaAAAAAaAAAaAaaaAAaAaa3;  //contract that just returns normally (with big Ether balance)
    address public constant _MYTHX_ACCOUNT_4 = 0xAaaaAaaAaAAaaaAaaAAaaAaaAaAaAaAAAAAaaaa4;  //contract that fails by reverting (with big Ether balance)
    address public constant _MYTHX_ACCOUNT_5 = 0xAAaaaaAaaAaaaAAAAAaAAaAAaaaaaAaAAAaAaaA5;  //contract that fails by jumping to destination 0 (with big Ether balance)

    event AssertionFailed(string message);

    uint private callDepth = 0;

    modifier _mythx_wrapped_function () {
        _mythx_startCall();
        if (_mythx_isOuterCall()) _mythx_ContractInvariant_snapshot();
        _;
        if (_mythx_isOuterCall()) _mythx_ContractInvariant_check();
        _mythx_endCall();
    }

    function _mythx_init() internal {
        //override
        revert("override this method!");
    }

    function _mythx_ContractInvariant_snapshot() internal {
        //override
        revert("override this method!");
    }

    function _mythx_ContractInvariant_check() internal {
        //override
        // perform checks
        revert("override this method!");
    }

    function _mythx_startCall() internal {
        (callDepth++);  //mythx-silence-overflow
    }

    function _mythx_endCall() internal {
        (callDepth--);  //mythx-silence-underflow
    }

    function _mythx_isOuterCall() internal view returns (bool) {
        return (callDepth == 1);
    }

    function _mythx_equals(string memory a, string memory b) internal pure returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))) );
    }
}

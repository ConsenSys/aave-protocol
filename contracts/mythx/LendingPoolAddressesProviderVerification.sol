pragma solidity ^0.5.0;

import "./MythXVerificationUtils.sol";
import "../configuration/LendingPoolAddressesProvider.sol";

/**
* @title LendingPoolAddressesProvider verification contract
**/

contract LendingPoolAddressesProviderVerification is LendingPoolAddressesProvider, MythXVerificationUtils {

    address private ___mythx_var_prevs_LendingPool;
    address private ___mythx_var_prevs_LendingPoolCore;

    /* Ownership */
    
    address private ___mythx_var_prevs_owner;

    constructor() public {
        _mythx_init();
    }

    function _mythx_init() internal {
        // @TODO save constants here
    }
 
    /**
        this is executed at the beginning of every function to snapshot state variables
     */
    function _mythx_ContractInvariant_snapshot() internal {
        /* Ownership */

        ___mythx_var_prevs_LendingPool = getAddress("LENDING_POOL");
        ___mythx_var_prevs_LendingPoolCore = getAddress("LENDING_POOL_CORE");

        ___mythx_var_prevs_owner = owner();
    }

    function _mythx_ContractInvariant_check() internal {
        // Standard ownable properties

        if (owner() != ___mythx_var_prevs_owner && msg.sender != ___mythx_var_prevs_owner) {
            emit AssertionFailed('Owner address was modified but sender is not the owner');
        }

        if (___mythx_var_prevs_LendingPool != getAddress("LENDING_POOL")) {
            emit AssertionFailed('LendingPool address was modified but sender is not the owner');
        }

        if (___mythx_var_prevs_LendingPoolCore != getAddress("LENDING_POOL_CORE")) {
            emit AssertionFailed('LendingPoolCore address was modified but sender is not the owner');
        }

    }

}

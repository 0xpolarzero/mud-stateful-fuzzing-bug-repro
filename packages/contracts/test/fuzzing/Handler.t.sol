// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import { Test } from "forge-std/Test.sol";

import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { IWorld } from "codegen/world/IWorld.sol";
import { Counter } from "codegen/index.sol";

contract Handler is Test {
  /* -------------------------------------------------------------------------- */
  /*                                   STORAGE                                  */
  /* -------------------------------------------------------------------------- */
  /// @dev World contract
  IWorld internal world;

  /// @dev Mirrored counter value
  uint256 private _mirrorCounter;

  /* -------------------------------------------------------------------------- */
  /*                                  FUNCTIONS                                 */
  /* -------------------------------------------------------------------------- */

  constructor(address _world) {
    world = IWorld(_world);
    StoreSwitch.setStoreAddress(_world);
  }

  /// @dev Increment the counter
  function handler_updateWorld(uint256) public {
    world.app__increment();
    _mirrorCounter++;
  }

  /// @dev Get the mirrored counter value
  function getCounterMirror() public view returns (uint256) {
    return _mirrorCounter;
  }

  /// @dev Get the counter value
  function getCounter() public view returns (uint256) {
    return Counter.get();
  }
}

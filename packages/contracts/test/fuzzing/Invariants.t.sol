// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import { MudTest } from "@latticexyz/world/test/MudTest.t.sol";
import { Handler } from "./Handler.t.sol";

contract Invariants is MudTest {
  Handler handler;

  function setUp() public virtual override {
    super.setUp();
    handler = new Handler(worldAddress);
    targetContract(address(handler));
  }

  function invariant_counterEqualsMirror() public view {
    assert(handler.getCounter() == handler.getCounterMirror());
  }
}

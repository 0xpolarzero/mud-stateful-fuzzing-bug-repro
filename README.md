# mud-stateful-fuzzing-bug-repro

See [Invariants.t.sol](./packages/contracts/test/fuzzing/Invariants.t.sol) and [Handler.t.sol](./packages/contracts/test/fuzzing/Handler.t.sol) for the code that reproduces the bug.

It should only call public functions inside the handler contract, but seems to randomly attempt direct calls to functions inside systems, which should not happen during such a testing campaign, and which will obviously fail.

Weirdly, under some specific conditions, this doesn't happen at all.

![image](https://github.com/user-attachments/assets/28b51eec-9003-4890-9acf-80205001a45d)

See the last 3 calls in the screenshot:

1. `handler_incrementCounter` is called successfully;
2. `handler_incrementCounter` is called successfully;
3. a direct call with `calldata=0xd09de08a` (which is the selector for `increment()`) is made, which reverts.

The first two calls are expected (through the handler), but the third one is absolutely not.

# Project 3A: Wasm GC and Garbage Collection

In this project, you will implement a garbage collector backed by the Wasm 
[GC](https://github.com/webassembly/gc/) proposal extension.

You are free to implement any form of collector, but you must be able handle cyclic
references (i.e, reference counting is not valid).

## Starter Code

You will likely benefit from extending your first project, which should already have a fully working interpreter.
[wasmparser](https://docs.rs/wasmparser/latest/wasmparser/) on Rust already supports GC opcode 
parsing, which is an option you may consider.
If you are not using Rust, we provide starter code for basic wasm parsing (same as Project 1), 
  to which you will need to add support for additional types and opcodes.

## Binary Specification

Your build scripts must generate a `wasm-vm` symlink/binary in the root directory of the repo.
You may modify the build scripts in the repo as long you can build the binary with a `make`
and clean it with a `make clean`.

Your binary must take one option: the `-a` argument from earler to pass parameters to `main`.

## Submission and Grading

Submit your code to Canvas (URL to the private repo) and add the TA (Github ID: arjunr2) 
as a collaborator to the repo. Include any notes about the branch that contains the code
as a comment in the Canvas submission.

For some initial tests for GC extensions, we recommend looking at the Wasm [spec tests](https://github.com/WebAssembly/gc/tree/main/test/core/gc).
We have provided a copy of these tests [here](tests/wasttests).
You can convert/modify some of the wast tests to wasm by hand, as appropriate, based on supported opcodes in this project.

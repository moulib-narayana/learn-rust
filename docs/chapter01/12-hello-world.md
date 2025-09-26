# Hello World

## Running a rust file
```bash
rustc main.rs
```

## Key concepts

1. Rust files always end with the .rs extension
2. Use underscores to separate words in filenames.

| ✅ **Valid**                | ❌ **Invalid**             |
|-------------------------|-------------------------|
| `hello_world.rs`        | `helloworld.rs`         |
| `my_first_program.rs`   | `HelloWorld.rs`         |
|                         | `my first program.rs`   |

3. **rustc**: The Rust compiler.  
    a. It compiles Rust code into a binary executable file (a machine code program you can run directly).  
    
    b. No matter your OS, you should see `Hello, world!` in the terminal.

2. main function is the entry point for a executable rust program.

3. To generate an assembly file:
```bash
rustc --emit asm main.rs
```

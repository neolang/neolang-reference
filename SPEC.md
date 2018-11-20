# Introduction

Neolang is meant to contain most current features of C11, except the preprocessor, and expand upon the features, providing much needed functionality for managing large codebases. Hopefully this combined functionality will give it the ability to replace C++ or C in nearly every circumstance.

## Goals

- Easier to read
- No performance deficiet compared to C
- Easier to implement different types
- Easier to understand what's going on

## Steps to accomplish goals

Assume everything in the language is borrowed from C that is not specified here.

### Borrowed from C++

- Template variables
- Raising and declaring errors but more strict

### Borrowed from golang

- Namespaces and package syntax, but without full url or gopath
- Exporting of functions and types
- Interfaces
- Composition model of inheritance
- Promoted fields in structs
- Anonymous fields in structs

### New additions

- New dynamic pointer conventions
- `char` is unsigned by default and is called `byte`
- All type casting must be explicit

## Syntax

### Package import syntax

Every folder is a package. The search paths for packages is defined in the config variable `search_paths`. Where this config variable is set depends on the compiler and operating system. The current directory being compiled from, however, is always in the search path.

Every folder or package must contain only the following characters:

`[a-zA-Z0-9_]`

Use `import [package name]` and neolang will try to find a folder with that name in the search path. Periods are used to denote different packages inside of packages:

`import std.io`

Use `import [package name] as [alias name]` to provide a shorthand for a long package name:

`import std.io as io`

### Public and Private methods or variables

Neolang uses the same semantics that golang uses when it comes to public and private variables or functions on a package level, with the first letter being upper case making any variable or method public. Everything else is unnaccessable outside of the package.

### Variable and struct naming conventions

Typically in neolang, all private methods are camel case with the first letter lower case, all public methods are camel case with first letter upper case, all private variables are lower case snake case, and all public variables are snake case with the first letter capitalized. Here is an example:

```
struct Database {
    std::strings::string * Values;
    std::io::file * file_pointer;
    std::date Date_created;
}
```

### Accessing functions from a package

Everything in a package is in a namespace that is that package's name or alias name. So to access the method `Print` from `std.io`, you would use this syntax:

`std::io::Print("hello, world!");`

### Dynamic pointers

Dynamic pointers to data must be declared using the keyword `dynamic`. For example:

`dynamic int * n = new type(*n);`

Because of this `malloc` and `free` have been moved to built in keywords

### Creating new memory

Due to the fact that some implementations of the standard library require the `new` function to accept a byte length, it does. The syntax for doing so looks like this:

`dynamic int * numbers = (int *)new 3;`

After zeroing out the newly created data, it will look like this in memory:

`[0,0,0]`

### Deleting memory

To delete `dynamic` variables, or to free them, you use the `free` keyword. Note that there are no constructors or destructors.

`free numbers;`

### Template variables

Template variables are declared with the following syntax:

`template [template type name]`

For example:

```
template T<>;
byte len(T to_find_len) {
    return (char *)(&to_find_len+1) - (char *)(&to_find_len);
}
```

### Structs

The struct syntax is similar to golang's struct syntax but without the type declaration. Here is an example:

```
struct Apple {
    int Seeds;
    float Diameter;
    float stem_length;
}
```

### Interfaces

The interface syntax is similar to golang's interface syntax, but with standard type declarations and no type declaration. Here is an example:

```
interface Addable {
    void AddOne(int);
    void AddThree(int);
}
```

### Errors

Errors are defined as a struct that adheres to the interface defined in `std.errors`. The interface looks like this:

All functions that can raise an error must explicitly say that they can raise certain error types.
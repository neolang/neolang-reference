# Introduction

Neolang is meant to contain all current features of C11, except the preprocessor, and expand upon the features, providing much needed functionality for managing large codebases

## Goals

- Easier to read
- No performance deficiet compared to C

## Steps to accomplish goals

### Borrowed from C++

- Template variables
- Raising and declaring errors but more strict

### Borrowed form golang

- Namespaces and package syntax, but without full url or gopath
- Exporting of functions and types

### New additions

- Officially declared dynamic variables

## Syntax

### Accessing functions from a package

Everything in a package is in a namespace that is that package's name or alias name. So to access the method `print` from `std.io`, you would use this syntax

`io::print("hello, world!");`

### Package import syntax

The search path is defined in the config variable `search_path`. The config json file path depends on the compiler and platform.

Use `import [package name]` and neolang will try to find a folder with that name in the search path. Periods are used to denote different packages inside of packages

`import std.io`

Use `import [package name] as [alias name]` to provide a shorthand for a long packae nae

`import std.io as io`
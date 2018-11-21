# Features

- Integer data type
- Byte data type
- Functions that support recursion
- Print function
- Extern keyword
- func keyword for defining functions

## Lexical grammar definition

    letter:
        [a-zA-Z]

    digit:
        [0-9]

    nonzero-digit:
        [1-9]

    operator:
        [+-*/%]

    any-symbol:
        .*

    token:
        keyword
        identifier
        constant

    keyword: one of
        func, extern, int, byte

    identifier:
        identifier-nondigit
        identifier identifier-nondigit
        identifier digit

    identifier-nondigit:
        letter or _

    constant:
        integer-constant

    integer-constant:
        nonzero-digit
        nonzero-digit digit

    comment:
        comment-symbol any-symbol

    comment-symbol:
        //

## Built in keywords

Built in keywords include the following:

    byte
    int
    func
    extern
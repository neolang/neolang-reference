import std.io as io

int fib(int x) {
    if(x < 3) {
        return 1;
    } else {
        return fib(x-1)+fib(x-2);
    }
}

int main() {
    int x = 10;
    io::Printf("fib(%d) = %d\n", x, fib(x));
    return 1;
}
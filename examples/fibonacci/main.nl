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
    io::printf("fib(%i) = %i\n", x fib(x));
    return 1;
}
import std.io as io;

template T: int, float;
T AddFive(T in_number) {
    return in_number + (T)5;
}

int main() {
    float my_numb = 3.0;
    my_numb = AddFive<>(my_numb);
    return 1;
}
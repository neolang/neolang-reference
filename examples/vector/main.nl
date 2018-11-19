import std.mem as mem;

template T<>;
struct Vector {
    T * Items;
    uint length;
}

void Vector::AddItem(Vector * self, T newItem) {
    if(self->length == 0) {
        self->Items = new 
    }
}
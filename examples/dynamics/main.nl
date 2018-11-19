import std.strings as strings;
import std.io as io;
import std.mem as mem;

struct animal {
    strings::string sound;
};

void animal::MakeSound(animal *self) {
    io.Println(self->sound);
}

struct lion {
    animal;
    int Zebras_eaten;
};

bool lion::IsAlpha(lion *self){
    return (self->Zebras_eaten > 100);
} 

int main() {    
    dynamic lion *temp_lion = new type(*temp_lion);
    mem::zero(temp_lion, mem::len(temp_lion));
    *temp_lion = lion{animal{"roar from dynamic memory"}, 15};

    if(temp_lion->IsAlpha()) {
        temp_lion->MakeSound();
    }

    free temp_lion; 
    
    return 1;
}
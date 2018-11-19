import std.strings as strings;
import std.io as io;
import std.mem as mem;

struct animal {
    strings::string sound;
};

void animal::MakeSound(animal *self) {
    io.Println(self->sound);
}

struct dog {
    animal;
    int Furcount;
};

struct lion {
    animal;
    int Zebras_eaten;
};

bool lion::IsAlpha(lion *self){
    return (self->Zebras_eaten > 100);
} 

int main() {
    dog fido = dog{animal{"bark"}, 1000};
    lion simba = lion{animal{"roar"}, 15};
    
    if(simba.IsAlpha()) {
        fido.MakeSound(); 
    }  

    simba.Zebras_eaten = 200;

    if(simba.IsAlpha()) {
        fido.MakeSound()
    } 
    
    return 1;
}
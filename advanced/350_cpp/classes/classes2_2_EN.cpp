void hack_oop_encapsulation(class box * o)
{
    o->width=1; // that code can't be compiled: 
                // "error C2248: 'box::width' : cannot access private member declared in class 'box'"
};

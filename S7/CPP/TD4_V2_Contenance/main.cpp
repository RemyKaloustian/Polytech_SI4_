#include <iostream>

#include "node.h"

int main()
{
    //Si dans main, alors on peut se permettre de mettre un objet statiquement car il est dans le main, est donc available dan stout le programme
    Node root(0);
    Node tmp(1);
    root.set_left_child(&tmp);
    tmp.set_value(2);
    root.set_right_child(&tmp);  




    std::cout<<root;
    std::cout<<*root.get_left_child();
}//main()
#pragma once

#include <iostream>

//template <typename T>

class Node;

class Node
{
public:
    Node(int new_value, Node* new_left= nullptr,Node* new_right = nullptr );
    Node(const Node& copy);

    ~Node();

//T est const car on ne le modifie pas
    void set_value(const int );
    //le getter est const car il ne modifie pas de données
    int get_value()const ;

    //On retourne des pointeurs car ils peuvent être nullptr
    Node* get_left_child();
    Node* get_right_child();

    //On passe un pointeur car il peut être nullptr
    void set_left_child( Node*);
    void set_right_child( Node*);

    void remove_all_children();

    friend std::ostream& operator << (std::ostream&, const Node &);


private:
    int value;

    Node* left_child;
    Node* right_child ;     
};



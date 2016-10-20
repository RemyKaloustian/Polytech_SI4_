
#include "node.h"
#include <iostream>

using std::cout;

Node::Node(int new_value, Node* new_left, Node* new_right):value(new_value)
{
    //Il faut mettre les attributs à nullptr dans le cas au il sont pris par défaut et donc pas passés au constructeur
    cout << "In constructor \n";
    cout << "value = " << new_value << "\n";
    if (new_left != nullptr)
    {
        cout << "Left child not null\n";
        left_child = new Node(*new_left);
    }
    //Il faut set  les attributs à nullptr si jamais pas passés en paramètre
    else
    {
        //REALLLLLLLLLY IMPORTANTTTTTTTTTT
        left_child = nullptr;
    }
    if (new_right != nullptr)
    {
        cout << "Right child not null\n";
        right_child = new Node(*new_right);

    }
    else
    {
        //REALLLLLLLLLY IMPORTANTTTTTTTTTT
        right_child = nullptr;
    }
}

Node::Node(const Node& copy)
{
    cout << "In copy constructor\n";
    value = copy.value;

    if (copy.left_child != nullptr)
        left_child = new Node(*copy.left_child);
    //Même chose que dans le constructeur principal
    else
    {
        left_child = nullptr;
    }
    if (copy.right_child != nullptr)
        right_child =new Node (*copy.right_child);
    else
    {
        right_child = nullptr;
    }
}


Node::~Node()
{
    remove_all_children();
}

void Node::set_value(const int new_value )
{
    value = new_value;
}

int Node::get_value() const
{
    return value;
}

void Node::set_right_child( Node* new_right)
{
    //On doit attribuer la velur avec le new et le constructeur de copie, sinon, on assignera une valeur tempraire à right_child OU on pointera sur le même objet pointé par new_right
    right_child =new Node(* new_right);
}

void Node::set_left_child( Node* new_left)
{
    cout << "In set_left_child\n";
        left_child = new Node(*new_left);
}

Node* Node::get_left_child()
{
    return left_child;
}

Node* Node::get_right_child()
{
    return right_child;
}

void Node::remove_all_children()
{
    if(right_child != nullptr)
        delete right_child;
    if(left_child != nullptr)
        delete left_child;
}


 std::ostream& operator << (std::ostream & os,const Node& node)
{
    os<<"The value of the node is "<<node.value<<"\n";

    return os;
}
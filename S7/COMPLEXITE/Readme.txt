README for Visual Turing 1.0
============================
Copyright (c) Cristian Cheran 1997.

ABOUT THE "README.TXT" FILE
===========================
This file provides essential information on installing and using
Visual Turing 1.0.


The sections are as follows:

* What is Visual Turing ?

* What you Need

* Installing Visual Turing 1.0 

* Building and Using Turing machines
        - Using the Samples
        - Creating new machines

* Documentation

* Contact Points



WHAT IS VISUAL TURING ?
========================

Visual Turing is a tool you can use to develop Turing machines.
A Turing machine is a mathematical "toy" consisting of an
infinite length tape  with a left boundary on which may be written
symbols. The symbols are the blank "#" and user defined -
in Visual Turing they can be letters. This tape has a head which
can move, read symbols and write symbols at one moment.
The way it performs all the operations is determined by a graph -
the "program" of the machine. The language of the machine consists
from some simple instructions like : L- for moving the head to the left,
R- for moving the head to the right, the "symbols"- for writing the
symbols on the tape and the "variables"- for writing the variables.
These instructions are the nodes in the graph. The arrows determine
on which way goes the execution by their condition - a logical expresion,
which, if it is true, determines the execution path.

Visual Turing fully implements this language. With it, you can develop 
the Turing programs visually, designing the graph with some clicks.
The editor has multiple levels of undo and it is easy to use because
of the context menus available for every logical object : instruction,
arrow, tape position etc. and the properties dialogs. You can also edit
the tape and save multiple configurations. The execution features a
rich set of commands: Play - for running, Pause - for pausing the execution,
Stop - for stopping the execution, Step In - for stepping in during
the execution, Step Out - for stepping out of the machine or stepping
over them and Step Back - for the reverse execution. You can watch the
value of the variables during the execution and annotate the machines.
The programs can be saved and retrieved to/from files.


WHAT YOU NEED
=============

* Win32 PC

* 4MB RAM

* Windows 95 or Windows NT >=3.51


INSTALLING VISUAL TURING 1.0 
============================

This package contains the first version of the Visual Turing.
Run "setup.exe" from the installation package and follow the
instructions.

To uninstall Visual Turing use the Add/Remove Programs control panel.


BUILDING AND USING TURING MACHINES
==================================
With Visual Turing you can fully develop any Turing machine.

Using the Samples
-----------------

Launch Visual Turing 1.0 from the Start | Programs menu;

Choose File | Open..
Open the examples from the Samples folder and run them.
Choose Run | Play and the machines will begin to work.

Every example has annotations on the Main machine where explains
what does it there.

Creating new machines
---------------------

Launch Visual Turing 1.0 from the Start | Programs menu;

Choose File | New

You can now develop a Turing machine. Explore the program and
you'll find out that you can add/remove machines, symbols, variables,
you can edit the program graphs, run and debug them and save on disk.


DOCUMENTATION
=============

Because Visual Turing has a HTML-ed documentation you need a browser
to read it - e.g. Netscape or Internet Explorer. It is automatically
launched when you choose the Help/Contents menu option. This 
documentation contains a short introduction to Turing machines and 
information about how to develop Turing machines with Visual Turing.

It is important to read about those machines from a computer science 
book - I have read "Elements of the Theory of Computation" by H.R. Lewis 
and C.H. Papadimitriou from Prentice Hall.


CONTACT POINTS
==============

The official home page of Visual Turing is

http://apolo.cs.pub.ro/~cheran/vturing/

You can contact the author by
EMail: cheran@apolo.cs.pub.ro

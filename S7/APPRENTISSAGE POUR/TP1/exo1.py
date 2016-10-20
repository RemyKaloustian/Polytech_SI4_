# -*- coding: utf-8 -*-
"""
Éditeur de Spyder

Ceci est un script temporaire.
"""

#the very first program

#This program creates two matrices, multiply them and prints Ax-b

import numpy as np #importing math tools, renaming numpy as np
from scipy import linalg #linear algebra, fourrier
A = np.array([[1 , 2 ] , [3,4]]) # A is a 2*2 matrix
b= np.array([[5], [6]])#b is a 2*1 vector
x = np.linalg.solve(A,b) #solve a linear matrix equation( Ax=b, x = A^-1*b)
r = A.dot(x)-b#A matrixly multiplied by x, -b
print(r)#returns 0


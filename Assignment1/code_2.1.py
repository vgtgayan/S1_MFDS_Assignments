import numpy as np

# Q2) Implementing Gauss Seidel and Gauss Jacobi Methods

# (i) Write a function to check whether a given square matrix is diagonally
# dominant or not. If not, the function should indicate if the matrix can
# be made diagonally dominant by interchanging the rows? Code to be
# written and submitted.
def is_diag_dom(A):
    #traverse rows
    for row in A:
        #traverse each column value in row
        for col in row:
            print(col)




if __name__ == "__main__":
    A=np.array([[1,2,3],[4,5,6],[7,8,9]])
    is_diag_dom(A)


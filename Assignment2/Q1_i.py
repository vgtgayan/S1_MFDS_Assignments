import numpy as np

def generate_random_matrix(m,n):
    if m > n:
        rand_gen = np.random.default_rng()
        return np.round_(rand_gen.uniform(low=0, high=10, size=(m,n)),4)
    else:
        print("Error: No: of rows are lesser than no: of columns")
        print(f"Given values: rows = {m}, columns = {n}")
        raise ValueError


def frobenius_norm(matrix):
    m,n = matrix.shape
    square_sum = 0
    for i in range(m):
        for j in range(n):
            square_sum += matrix[i][j]**2

    return round(np.sqrt(square_sum),4)


def main_Q1_i():
    try:
        print("Condition: No: of rows should be greater than no: of columns")
        m = int(input("Enter no: of rows:"))
        n = int(input("Enter no: of columns:"))

        # Generate random matrix
        rand_matrix = generate_random_matrix(m,n)
        print(f"Dimensions of the generated matrix: {rand_matrix.shape}")

        # Calculate frobenius norm
        f_norm = frobenius_norm(rand_matrix)
        print("Frobenius norm: ", f_norm)
    except ValueError:
        print("Invalid Input !!!")


main_Q1_i()


'''
Input: 
    Enter no: of rows: 4
    Enter no: of columns: 3

Output:
    Condition: No: of rows should be greater than no: of columns
    Dimensions of the generated matrix: (4, 3)
    Frobenius norm:  18.7508



Invalid Input: 
    Enter no: of rows: 2
    Enter no: of columns: 3

Output:
    Condition: No: of rows should be greater than no: of columns
    Error: No: of rows are lesser than no: of columns
    Given values: rows = 2, columns = 3
    Invalid Input !!!
'''
% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

row(1..4).
column(1..4).
value(1..4).

sudoku(X,Y,N) :- initial(X,Y,N). % Defining all given values

{ sudoku(X,Y,N) : value(N) } = 1 :- row(X), column(Y).  % Assign 1 value per cell if within 1..4
:- row(X), sudoku(X,A,N), sudoku(X,B,N), A != B.        % Exclude duplicate values in rows
:- column(Y), sudoku(A,Y,N), sudoku(B,Y,N), A != B.     % Exclude duplicate values in columns

#show sudoku/3.

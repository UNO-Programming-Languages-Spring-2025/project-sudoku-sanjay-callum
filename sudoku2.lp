% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

row(1..9).
column(1..9).
value(1..9).
subgrid(1..9).

% Assign subgrid G to each cell matching given formula
% Adjusted the numbers for the 9x9 sudokus. 
subgrid(X,Y,G) :- row(X), column(Y), subgrid(G), G = (1+(((X-1)/3)*3+(Y-1)/3)).


sudoku(X,Y,N) :- initial(X,Y,N). % Defining all given values

{ sudoku(X,Y,N) : value(N) } = 1 :- row(X), column(Y).  % Assign 1 value per cell if within 1..4
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.            % Exclude duplicate values in rows
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.            % Exclude duplicate values in columns
:- sudoku(X1,Y1,N), sudoku(X2,Y2,N), X1 != X2, Y1 != Y2, subgrid(X1,Y1,G), subgrid(X2,Y2,G).
% Exclude Duplicate values from subgrids.

#show sudoku/3.

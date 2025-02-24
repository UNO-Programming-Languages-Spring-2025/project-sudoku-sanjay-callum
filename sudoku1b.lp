% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

row(1..4).
column(1..4).
value(1..4).
subgrid(1..4).

% Assign subgrid G to each cell matching given formula
subgrid(X,Y,G) :- row(X), column(Y), subgrid(G), G = (1+(((X-1)/2)*2+(Y-1)/2)).

sudoku(X,Y,N) :- initial(X,Y,N). % Defining all given values

{ sudoku(X,Y,N) : value(N) } = 1 :- row(X), column(Y).  % Assign 1 value per cell if within 1..4
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.            % Exclude duplicate values in rows
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.            % Exclude duplicate values in columns

#show subgrid/3.
#show sudoku/3.

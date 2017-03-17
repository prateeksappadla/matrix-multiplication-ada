package MatrixMult is
	SIZE: integer:= 10;
	type matrix is array(1 .. SIZE, 1 .. SIZE) of integer;
	procedure MatMult(A: in matrix; B: in matrix; C: out matrix); 
end MatrixMult;
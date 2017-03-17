with Text_Io;  -- always need these two lines for printing
use Text_Io;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

-- import Matrix Multiplication package
with MatrixMult;   
use MatrixMult;

procedure AssignmentMain is

-- Task for printing out a matrix
task type PrintMatrix is
	entry print(inputMatrix: matrix);
end PrintMatrix;

task body PrintMatrix is
	begin
	accept print(inputMatrix:in matrix) do
		for i in 1..SIZE loop
			for j in 1..SIZE loop
				Put(inputMatrix(i,j));
				Put(" ");
			end loop;
			New_line;
		end loop;
	end print;
end PrintMatrix;

-- Task for reading a matrix
task type Reader is
	entry read(inputMatrix: out matrix);
end Reader;

task body Reader is
	inp: integer;
	begin
	accept read(inputMatrix: out matrix) do
		for i in 1..SIZE loop
			for j in 1..SIZE loop
				Ada.Integer_Text_IO.Get(inp);
				inputMatrix(i,j) := inp; 
			end loop;
		end loop;		
	end read;
end Reader;

	
A: matrix;
B: matrix;
C: matrix;
Reader1: Reader;
Reader2: Reader;
-- PrintTask: PrintMatrix;
-- PrintTask2: PrintMatrix;
PrintTask3: PrintMatrix;


begin

	Reader1.read(A);
	Reader2.read(B);
	MatMult(A,B,C);

	-- PrintTask.print(A);
	-- PrintTask2.print(B);
	PrintTask3.print(C);

end AssignmentMain;


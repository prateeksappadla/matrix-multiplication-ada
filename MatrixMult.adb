with Text_Io;  -- always need these two lines for printing
use Text_Io;

package body MatrixMult is

	procedure MatMult(A: in matrix; B: in matrix; C: out matrix ) is     

		task type mult is 
			entry product(rownum: integer; colnum: integer );
		end mult;

		task body mult is
		row: integer ;
		column: integer;
		value: integer := 0;
		prod : integer;
				
		begin
			accept product(rownum: integer; colnum: integer) do
				row := rownum;
				column := colnum;	
			end product;

			for i in 1..SIZE loop
				prod := A(row,i) * B(i,column);
				value := value + prod;	
			end loop;
			C(row,column) := value;

		end mult;	
		
		multTasks : array(1 .. SIZE*SIZE) of mult; 	

		begin
			for i in 1..SIZE loop
				for j in 1..SIZE loop
					multTasks((i-1) * SIZE + j).product(i, j);
				end loop;
			end loop;	

		end Matmult;

end MatrixMult;
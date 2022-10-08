`timescale 1us/1ns
module tb_ALU_16bit ();

reg   [15:0]         tb_A;
reg   [15:0]         tb_B;
reg                  tb_CLK;
reg   [3:0]          tb_ALU_FUN;
wire                 tb_Arith_Flag;
wire                 tb_Logic_Flag;
wire                 tb_CMP_Flag;
wire                 tb_Shift_Flag;
wire  [15:0]         tb_ALU_OUT;
  

always #5 tb_CLK = !tb_CLK ;
 
 
 ALU_16bit DUT
(
.A (tb_A),
.B (tb_B),
.CLK (tb_CLK),
.ALU_FUN (tb_ALU_FUN),
.Arith_Flag (tb_Arith_Flag),
.Logic_Flag (tb_Logic_Flag),
.CMP_Flag (tb_CMP_Flag),
.Shift_Flag (tb_Shift_Flag),
.ALU_OUT (tb_ALU_OUT)
            
);




initial
  begin 
  
   $dumpfile ("ALU_16bit.vcd");
   $dumpvars;
   
   
   tb_A = 16'b0001;
   tb_B = 16'b0001;
   tb_CLK = 1'b0;
   tb_ALU_FUN =4'b0;


$display("Test Case 1: Addition");
       #3
	   tb_ALU_FUN = 4'b0000;
	   tb_A = 16'b0011;
	   tb_B = 16'b1101;
	   #7
		if(tb_ALU_OUT != 16'b10000 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
	 
$display("Test Case 2: Subtraction");
       #3
	   tb_ALU_FUN = 4'b0001;
	   tb_A = 16'b0011;
	   tb_B = 16'b0010;
	   #7
		if(tb_ALU_OUT != 16'b0001 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
		 
$display("Test Case 3: Multiplication");
       #3
	   tb_ALU_FUN = 4'b0010;
	   tb_A = 16'b0010;
	   tb_B = 16'b0001;
	   #7
		if(tb_ALU_OUT != 16'b0010)
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 

$display("Test Case 4: Division");
       #3
	   tb_ALU_FUN = 4'b0011;
	   tb_A = 16'b0110;
	   tb_B = 16'b0010;
	   #7
		if(tb_ALU_OUT != 16'b0011)
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
		 
		 
$display("Test Case 5: AND");
       #3
	   tb_ALU_FUN = 4'b0100;
	   tb_A = 16'b0011;
	   tb_B = 16'b1101;
	   #7
		if(tb_ALU_OUT != 16'b0001 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
		 
		 
$display("Test Case 6: OR");
       #3
	   tb_ALU_FUN = 4'b0101;
	   tb_A = 16'b0011;
	   tb_B = 16'b1101;
	   #7
		if(tb_ALU_OUT != 16'b1111 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
		 

$display("Test Case 7: NAND");
       #3
	   tb_ALU_FUN = 4'b0110;
	   tb_A = 16'b0011;
	   tb_B = 16'b1101;
	   #7
		if(tb_ALU_OUT != 16'hfffe)
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 		 
		
		
$display("Test Case 8: NOR");
       #3
	   tb_ALU_FUN = 4'b0111;
	   tb_A = 16'b0011;
	   tb_B = 16'b1101;
	   #7
		if(tb_ALU_OUT != 16'hfff0 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 		 		 		 
		 
$display("Test Case 9: XOR");
       #3
	   tb_ALU_FUN = 4'b1000;
	   tb_A = 16'b0011;
	   tb_B = 16'b1101;
	   #7
		if(tb_ALU_OUT != 16'b1110 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
		
$display("Test Case 10: XNOR");
       #3
	   tb_ALU_FUN = 4'b1001;
	   tb_A = 16'b0011;
	   tb_B = 16'b1101;
	   #7
		if(tb_ALU_OUT != 16'hfff1 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
		 
		 
$display("Test Case 11: Equal");
       #3
	   tb_ALU_FUN = 4'b1010;
	   tb_A = 16'b0011;
	   tb_B = 16'b0011;
	   #7
		if(tb_ALU_OUT != 16'b0001 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
		 
$display("Test Case 12: Greater Than");
       #3
	   tb_ALU_FUN = 4'b1011;
	   tb_A = 16'b0111;
	   tb_B = 16'b0001;
	   #7
		if(tb_ALU_OUT != 16'b0010 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 		 
		 	

			
$display("Test Case 13: Smaller Than");
       #3
	   tb_ALU_FUN = 4'b1100; 
	   tb_A = 16'b0011;
	   tb_B = 16'b0100;
	   #7
		if(tb_ALU_OUT != 16'b0011 )
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 	

			
$display("Test Case 14: Shift Right");
       #3
	   tb_ALU_FUN = 4'b1101;
	   tb_A = 16'b0011;
	   tb_B = 16'b0001;   
	   #7
		if(tb_ALU_OUT != 16'b0001)
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
	
	
					 
$display("Test Case 15: Shift Left");
       #3
	   tb_ALU_FUN = 4'b1110;
	   tb_A = 16'b0011;
	   tb_B = 16'b0001;
	   #7
		if(tb_ALU_OUT != 16'b0110)
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
		 
		 
$display("Test Case 16: Default");
       #3
	   tb_ALU_FUN = 4'b1111;
	   tb_A = 16'b0011;
	   tb_B = 16'b0001;
	   #7
		if(tb_ALU_OUT != 16'b0000)
		 $display ("Test Case Failed");
		else 
		 $display ("Test Case Passed");
		 
	#10				 
   
   $finish;
   
   end
   
 
 
 endmodule  
   
   


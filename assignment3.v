module ALU_16bit (

input         [15:0]               A,
input         [15:0]               B,
input                              CLK,
input         [3:0]                ALU_FUN,
output    reg [15:0]               ALU_OUT,
output    reg                      Arith_Flag,
output    reg                      Logic_Flag,
output    reg                      CMP_Flag,
output    reg                      Shift_Flag           

);

wire High; 
wire LOW;
reg [15:0]   ALU_OUT_R;

 


always @(*)               
 begin 
 
  case (ALU_FUN)
	  
		  //Arithamtic Operations:
		  
		   4'b0000 :                                      //Addition
		   begin 
		   ALU_OUT_R = A + B;
		   Arith_Flag = High;
		   Logic_Flag = LOW;
		   Shift_Flag = LOW;
		   CMP_Flag = LOW;
		   end
		   
		   4'b0001 :                                     //Subtraction
		   begin 
		   ALU_OUT_R = A - B;
		   Arith_Flag = High;
		   Logic_Flag = LOW;
		   Shift_Flag = LOW;
		   CMP_Flag = LOW;
		   end
		   
		   4'b0010 :                                     //Multiplication 
		   begin
		   ALU_OUT_R = A * B ;
		   Arith_Flag = High;
		   Logic_Flag = LOW;
		   Shift_Flag = LOW;
		   CMP_Flag = LOW;
		   end
		   
		   4'b0011 :                                    //Division
		   begin
		   ALU_OUT_R = A / B ;
	       Arith_Flag = High;
		   Logic_Flag = LOW;
		   Shift_Flag = LOW;
		   CMP_Flag = LOW;
		   end
		   
		   
		  
		   
		   
		   //Logic Operations:
		   
		   4'b0100 :                                      //AND
		   begin
		   ALU_OUT_R = A & B;
		   Arith_Flag = LOW;
		   Logic_Flag = High;
		   Shift_Flag = LOW;
		   CMP_Flag = LOW;
		   end
		   
		   4'b0101 :                                      //OR
		   begin
		   ALU_OUT_R = A | B;
		   Arith_Flag = LOW;
		   Logic_Flag = High;
		   Shift_Flag = LOW;
		   CMP_Flag = LOW;
		   end
		   
		   4'b0110 :                                      //NAND
		   begin
		   ALU_OUT_R = ~(A & B);
		   Arith_Flag = LOW;
		   Logic_Flag = High;
		   Shift_Flag = LOW;
		   CMP_Flag = LOW;
		   end
		   
		   4'b0111 :                                       //NOR
		   begin
		   ALU_OUT_R = ~(A | B);
		   Arith_Flag = LOW;
		   Logic_Flag = High;
		   Shift_Flag = LOW;
		   CMP_Flag = LOW;
		   end
		   
		   4'b1000 :                                       //XOR
		   begin
		   ALU_OUT_R = A ^ B;
		   Arith_Flag = LOW;
		   Logic_Flag = High;
		   Shift_Flag = LOW;
		   CMP_Flag = LOW;
		   end
		   
		   4'b1001 :                                       //XNOR
		   begin
		   ALU_OUT_R = ~(A ^ B);
		   Arith_Flag = LOW;
		   Logic_Flag = High;
		   Shift_Flag = LOW;
		   CMP_Flag = LOW;
		   end
		   
		   
		   

		   
		   //Compare Operations:
		   
		   4'b1010 : 
		   begin 
		    if (A == B)                                     //Equal
			 ALU_OUT_R = 16'b0001;
			 Arith_Flag = LOW;
		     Logic_Flag = LOW;
		     Shift_Flag = LOW;
		     CMP_Flag = High;
			end
			
		   4'b1011 :                                       //Greater than
		   begin 
		    if ( A > B)
		     ALU_OUT_R = 16'b0010;
			 Arith_Flag = LOW;
		     Logic_Flag = LOW;
		     Shift_Flag = LOW;
		     CMP_Flag = High;
			end
			
		   4'b1100 :                                      //Smaller than
		   begin
		    if (A < B)
			 ALU_OUT_R = 16'b0011;
			 Arith_Flag = LOW;
		     Logic_Flag = LOW;
		     Shift_Flag = LOW;
		     CMP_Flag = High;
			end
			 
			 
			 
			 
		   
		   //Shift Operations:
		   
		   4'b1101 :                                       //Shift right
		   begin 
		   ALU_OUT_R = A >> 16'b0001;
		   Arith_Flag = LOW;
		   Logic_Flag = LOW;
		   Shift_Flag = High;
		   CMP_Flag = LOW;
		   end
		   
		   4'b1110 :                                       //Shift left
		   begin
		   ALU_OUT_R = A << 16'b0001;
		   Arith_Flag = LOW;
		   Logic_Flag = LOW;
		   Shift_Flag = High;
		   CMP_Flag = LOW;
		   end
		   
		   
		   
		   
		   
		   //Default:
		   
		   default : ALU_OUT_R = 16'b0;
	   
	   
	   
  endcase 
		
end 	


always @ (posedge CLK)                 
 begin 
  ALU_OUT <= ALU_OUT_R;
 end


assign High = 1'b1;
assign LOW = 1'b0;



endmodule   
	   
	   

	
	
	 
	  
	  
	  
	 
	   
   

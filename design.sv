module ALU_4bit(
  input [3:0] A,
  input [3:0] B,
  input [3:0] ALU_Sel,
  input clk , reset,
  output reg [3:0] ALU_Out,
  output reg CarryOut
);

always @(posedge clk or posedge reset) begin
    if(reset) begin
      ALU_Out  <= 8'd0;
      CarryOut <= 1'd0;
    end
    else begin
      ALU_Out <= ALU_Result;
      CarryOut <= tmp[8];
    end
  end
always @ (A, B, ALU_Sel)begin
  case (ALU_Sel)
    4'b0000: {CarryOut ,ALU_Out} = A + B; // Addition
    4'b0001: {CarryOut ,ALU_Out} = A - B; // Subtraction
    4'b0010: {CarryOut ,ALU_Out} = A * B; // AND operation
    4'b0011: {CarryOut ,ALU_Out} = A / B; // OR operation
    default: {CarryOut ,ALU_Out} = 4'b0000; // Default to zero for unsupported operation
  endcase

end

endmodule

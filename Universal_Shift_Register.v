`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2023 09:33:13
// Design Name: 
// Module Name: Universal_Shift_Register
// Name - Kaushal Kumar Kumawat
// Roll No. - 21PHC1R15
//////////////////////////////////////////////////////////////////////////////////


module Universal_Shift_Register(p_out,p_in,s,msb_in,lsb_in,clk,clear);
input msb_in,lsb_in,clk,clear;
input [3:0] p_in;
input [1:0] s;
output reg [3:0] p_out;

always @(posedge clk or negedge clear)
begin
    if(clear == 1)
        p_out <= 4'b0000;
    else
        case(s)
            2'b00: p_out <= p_out;  // No change
            2'b01: p_out <= {msb_in,p_out[3:1]};    // Shift right
            2'b10: p_out <= {p_out[2:0],lsb_in};    // Shift left
            2'b11: p_out <= p_in;   // Parallel load
        endcase
end
endmodule

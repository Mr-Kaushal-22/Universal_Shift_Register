`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2023 09:54:07
// Design Name: 
// Module Name: Universal_Shift_register_tb
// Name - Kaushal Kumar Kumawat
// Roll No. - 21PHC1R15
//////////////////////////////////////////////////////////////////////////////////


module Universal_Shift_register_tb();
reg msb_in,lsb_in,clk,clear;
reg [3:0] p_in;
reg [1:0] s;
wire [3:0] p_out;

Universal_Shift_Register UR_1(p_out,p_in,s,msb_in,lsb_in,clk,clear);

initial
fork
    p_in = 4'b1010;
    s = 2'b00;
    msb_in = 1;
    lsb_in = 0;
    clk = 0;
    clear = 1;
    #10 clear = 0;
    #50 s = 2'b01;
    #100 s = 2'b10;
    #150 s = 2'b11;
join

always
    #5 clk = ~clk;
    
initial #200 $stop;
endmodule

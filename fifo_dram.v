`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:13:17 11/27/2019 
// Design Name: 
// Module Name:    fifo_dram 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fifo_dram( din, rst, len, dout, ce, clk, inv);
    parameter WIDTH_IN=64;
    parameter WIDTH=272;
    parameter BIT_LEN=9;
        
    output [271:0] dout;
    input [63:0] din;
    input rst;
    input [3:0] len;
    input clk;
    input ce;
    input inv;

    wire [271:0] dout;
    wire [63:0] din;
    wire rst;
    wire [3:0] len;
    wire clk;
    wire ce;
    wire inv;
    
    
    reg [271:0] data=0;
    
    always@(posedge clk, posedge rst) begin
        if (rst)
            data=0;
        else begin
            if(~inv) begin
                case(len)
                    4: begin
                        data[15:0] = din[15:0];
                        data = {data[15:0],data[271:16]};
                        end
                    3: begin
                        data[31:0] = din[31:0];
                        data = {data[31:0],data[271:32]};
                        end
                    2:begin
                        data[47:0] = din[47:0];
                        data = {data[47:0], data[271:48]};
                        end
                    1: begin
                        data[64:0] = din[64:0];
                        data = {data[64:0], data[271:64]};
                        end
                    default: begin
                        data=data;
                        end
                endcase
            end
            else begin
                case(len)
                    4: begin
                        data[15:0] = din[63:48];
                        data = {data[15:0],data[271:16]};
                        end
                    3: begin
                        data[31:0] = din[63:32];
                        data = {data[31:0],data[271:32]};
                        end
                    2:begin
                        data[47:0] = din[63:16];
                        data = {data[47:0], data[271:48]};
                        end
                    1: begin
                       	data[64:0] = din[64:0];
                        data = {data[64:0], data[271:64]};
                        end
                    default: begin
                        data=data;
                        end
                endcase
            end
            
        end
    end
    assign dout = data;

endmodule

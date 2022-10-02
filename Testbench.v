`timescale 1ns / 1ps

// Исходная последовательность: 8200434
// 11111010010000011110010


module Testbench ();

reg clk;
reg invert_clk;
initial clk = 0;
initial invert_clk = 0;  
always #10 clk = ~clk;  // каждые 10ns менять clk на противоположное значение
always #5 invert_clk = ~invert_clk; 
reg enable;
reg decode_enable;
reg reset;
initial enable = 0;
initial reset = 0;
reg [22:0] data = 23'b11111010010000011110010;
wire [45:0] coded_data;
wire [1:0] decode_buffer;
wire decoded_value;
wire [22:0] result;


Source dut (clk, invert_clk, data, enable, reset, sign, value, prev_value, coded_data);
Decoder dec (coded_data, decode_enable, invert_clk, decode_buffer, decoded_value, result);
// reg sign = dut.sign;
// reg value = dut.value;
// reg prev_value= dut.value;
// integer i = dut.i;

initial begin  
    coding_start();  
    decoding_start();
    $stop;         
  end

task coding_start;
begin
    #40;
    enable = 1;
    #230;
    enable = 0;
    if (coded_data == 46'b1010101010011001011001010101011010101001011001)
        $display("CODING TEST PASSED");
    else
        $display("CODING TEST FAILED");  
end
endtask


task decoding_start;
begin
    #40;
    decode_enable = 1;
    #240;
    $display("Decoding ended");
    if (result == 8200434)
        $display("DECODING TEST PASSED");
    else
        $display("DECODING TEST FAILED");
        $display("%b", result);
end
endtask
endmodule

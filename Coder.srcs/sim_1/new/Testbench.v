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

reg [22:0] data = 23'b11111010010000011110010;


Source dut (clk, invert_clk, data, sign, value, prev_value);

// reg sign = dut.sign;
// reg value = dut.value;
// reg prev_value= dut.value;
// integer i = dut.i;

initial begin  
    $display("%d,%d,%d,%d,%d,%d", data[0], data[1], data[2], data[3], data[4], data[5]);
    decoding_start();  
    $stop;         
  end

task decoding_start;
begin
    #10;
    $display ("Simulation runned");
    #220;
end
endtask

endmodule

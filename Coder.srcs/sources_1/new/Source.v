module Source(clk, invert_clk, data, sign, value, prev_value);
    parameter BUFFER_SIZE = 23;
    integer i = 0;
    input clk;
    input invert_clk;
    input [BUFFER_SIZE-1:0] data;
    output reg sign;
    output reg value;
    output reg prev_value;
initial begin
    sign = 1;
    value = data[BUFFER_SIZE-1];
    prev_value = data[BUFFER_SIZE-1];
end

always @(clk or invert_clk)
begin
if (invert_clk) begin
    sign = ~sign;
end else begin
    value = data[22-i];
    if (value == prev_value) sign = ~sign;
    $display("value: %d", value);
    prev_value = value;
    i = i + 1;   
end
end


endmodule
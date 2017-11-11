// no timescale needed

module ifchain(
input wire clk,
input wire rstn,
output reg result
);




reg [3:0] counter;

  always @(posedge clk, posedge rstn) begin
    if((rstn == 1'b0)) begin
      counter <= {4{1'b0}};
      result <= 1'b0;
    end else begin
      // Divide by 2 by default
      if((enable == 1'b1)) begin
        if((counter == 0)) begin
          counter <= CLK_DIV_VAL;
          result <= 1'b1;
        end
        else begin
          counter <= counter - 1;
          result <= 1'b0;
        end
        // counter
      end
      // enable
    end
  end


endmodule

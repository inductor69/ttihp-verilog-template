module fifo_formal;
  reg clock;
  wire reset = 1'b0;
  (* anyseq *) reg push;
  (* anyseq *) reg pop;
  (* anyseq *) reg [7:0] push_data;
  wire full, empty;
  wire [7:0] data;
  wire [3:0] level;

  protocore_byte_fifo dut (
    .clock(clock), .reset(reset), .push(push), .push_data(push_data),
    .pop(pop), .full(full), .empty(empty), .data(data), .level(level)
  );

  reg past_valid = 0;
  initial assume(level == 0);
  always @(posedge clock) begin
    past_valid <= 1;

    if (past_valid) begin
      assert(level <= 8);
      assert(empty == (level == 0));
      assert(full == (level == 8));

      case ({$past(push && !full), $past(pop && !empty)})
        2'b10: assert(level == $past(level) + 1'b1);
        2'b01: assert(level == $past(level) - 1'b1);
        default: assert(level == $past(level));
      endcase

      cover(level == 8);
      cover(push && pop && !empty && !full);
    end
  end
endmodule

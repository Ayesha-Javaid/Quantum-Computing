// Auto-Generated top module for the syn-det generator 
// Modified: Parametrized fingerprint generation for scalability testing
// Uses gen_number_8 (most expensive fingerprint) replicated NUM_FP times

module fp_top #(
  parameter NUM_FP = 18  // Change this value for each synthesis run
) (
  input bit clk,
  input bit rst,
  input bit valid, 
  input bit [16-1:0] tcp_dport,
  input bit [32-1:0] ip_dst,
  input bit [32-1:0] tcp_seq,
  input bit [32-1:0] tcp_ack,
  input bit [16-1:0] tcp_sport,
  input bit [16-1:0] tcp_window,
  input bit [16-1:0] ip_id,
  output logic [16-1:0] fp_num [0:NUM_FP-1],
  output logic fp_det
);

  logic fp_detected [0:NUM_FP-1];
  
  // Generate multiple instances of gen_number_8 (most expensive fingerprint)
  genvar i;
  generate
    for(i = 0; i < NUM_FP; i = i + 1) begin : fp_gen
      (* keep = "true" *) 
      gen_number_8 inst_gen_number_8 (
        .clk(clk),
        .valid(valid),
        .tcp_dport(tcp_dport),
        .tcp_sport(tcp_sport),
        .tcp_window(tcp_window),
        .tcp_seq(tcp_seq),
        .tcp_ack(tcp_ack),
        .ip_id(ip_id),
        .fp_detected(fp_detected[i])
      );
    end
  endgenerate

  // Counter for each fingerprint detection
  genvar j;
  generate
    for(j = 0; j < NUM_FP; j = j + 1) begin : counter_gen
      always@(posedge clk) begin
        if(rst == 0)
          fp_num[j] <= 16'b0;
        else if(fp_detected[j] == 1'b1) begin
          fp_num[j] <= fp_num[j] + 16'b1; 
        end
      end
    end
  endgenerate

  // OR reduction for fp_det signal
  always@(posedge clk) begin
    fp_det <= 1'b0;
    for(int k = 0; k < NUM_FP; k = k + 1) begin
      fp_det <= fp_det || fp_detected[k];
    end
  end

endmodule

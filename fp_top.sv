// Auto-Generated top module for the syn-det generator 
// Modified: Parametrized fingerprint generation for scalability testing
// Uses gen_number_8 (most expensive fingerprint) replicated NUM_FP times

module fp_top #(
  parameter NUM_FP = 18  // Change this value: 18, 40, 100, 200, 400, 800, 1200, 1600, 2000
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
  output logic [16-1:0] fp_num0,
  output logic [16-1:0] fp_num1,
  output logic [16-1:0] fp_num2,
  output logic [16-1:0] fp_num3,
  output logic [16-1:0] fp_num4,
  output logic [16-1:0] fp_num5,
  output logic [16-1:0] fp_num6,
  output logic [16-1:0] fp_num7,
  output logic [16-1:0] fp_num8,
  output logic [16-1:0] fp_num9,
  output logic [16-1:0] fp_num10,
  output logic [16-1:0] fp_num11,
  output logic [16-1:0] fp_num12,
  output logic [16-1:0] fp_num13,
  output logic [16-1:0] fp_num14,
  output logic [16-1:0] fp_num15,
  output logic [16-1:0] fp_num16,
  output logic [16-1:0] fp_num17,
  output logic fp_det
);

  logic fp_detected [0:NUM_FP-1];
  
  // Generate multiple instances of gen_number_8
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

  // Counters for each fingerprint
  always@(posedge clk) begin
    if(rst == 0) begin
      fp_num0 <= 16'b0;
      fp_num1 <= 16'b0;
      fp_num2 <= 16'b0;
      fp_num3 <= 16'b0;
      fp_num4 <= 16'b0;
      fp_num5 <= 16'b0;
      fp_num6 <= 16'b0;
      fp_num7 <= 16'b0;
      fp_num8 <= 16'b0;
      fp_num9 <= 16'b0;
      fp_num10 <= 16'b0;
      fp_num11 <= 16'b0;
      fp_num12 <= 16'b0;
      fp_num13 <= 16'b0;
      fp_num14 <= 16'b0;
      fp_num15 <= 16'b0;
      fp_num16 <= 16'b0;
      fp_num17 <= 16'b0;
    end
    else begin
      if(NUM_FP > 0 && fp_detected[0]) fp_num0 <= fp_num0 + 1;
      if(NUM_FP > 1 && fp_detected[1]) fp_num1 <= fp_num1 + 1;
      if(NUM_FP > 2 && fp_detected[2]) fp_num2 <= fp_num2 + 1;
      if(NUM_FP > 3 && fp_detected[3]) fp_num3 <= fp_num3 + 1;
      if(NUM_FP > 4 && fp_detected[4]) fp_num4 <= fp_num4 + 1;
      if(NUM_FP > 5 && fp_detected[5]) fp_num5 <= fp_num5 + 1;
      if(NUM_FP > 6 && fp_detected[6]) fp_num6 <= fp_num6 + 1;
      if(NUM_FP > 7 && fp_detected[7]) fp_num7 <= fp_num7 + 1;
      if(NUM_FP > 8 && fp_detected[8]) fp_num8 <= fp_num8 + 1;
      if(NUM_FP > 9 && fp_detected[9]) fp_num9 <= fp_num9 + 1;
      if(NUM_FP > 10 && fp_detected[10]) fp_num10 <= fp_num10 + 1;
      if(NUM_FP > 11 && fp_detected[11]) fp_num11 <= fp_num11 + 1;
      if(NUM_FP > 12 && fp_detected[12]) fp_num12 <= fp_num12 + 1;
      if(NUM_FP > 13 && fp_detected[13]) fp_num13 <= fp_num13 + 1;
      if(NUM_FP > 14 && fp_detected[14]) fp_num14 <= fp_num14 + 1;
      if(NUM_FP > 15 && fp_detected[15]) fp_num15 <= fp_num15 + 1;
      if(NUM_FP > 16 && fp_detected[16]) fp_num16 <= fp_num16 + 1;
      if(NUM_FP > 17 && fp_detected[17]) fp_num17 <= fp_num17 + 1;
    end
  end

  // OR reduction for fp_det signal
  always@(posedge clk) begin
    fp_det <= 1'b0;
    for(int k = 0; k < NUM_FP; k = k + 1) begin
      fp_det <= fp_det || fp_detected[k];
    end
  end

endmodule

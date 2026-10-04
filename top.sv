`timescale 1ns/1ps

module top #(
  parameter NUM_FP = 18  // Must match fp_top parameter
) (
    // gmii/mii rx channel
    input  logic        rx_dv,
    input  logic [63:0] rxd,
    input  logic [7:0]  rxc,
    input  logic        rx_clk,

    // gmii/mii control signals
    input  logic        crs,
    input  logic        col,

    // gmii/mii tx channel
    input  logic        tx_clk,
    output logic        tx_er,
    output logic        tx_en,
    output logic [63:0] txd,

    // mac control signals
    input  logic        clk,
    input  logic        rst_n,
    input  logic        link_active,

    // fp detector outputs (dynamic array based on NUM_FP)
    output logic [15:0] fp_num [0:NUM_FP-1],
    output logic        fp_det,

    output logic [15:0] ip_id,
    output logic [31:0] ip_dst,
    output logic [31:0] ip_src,
    output logic [15:0] tcp_sport,
    output logic [15:0] tcp_dport,
    output logic [31:0] tcp_ack,
    output logic [31:0] tcp_seq,
    output logic [15:0] tcp_window,
    output logic        valid,
    output logic [511:0] packet,

    output logic [15:0] packet_type,
    output logic [3:0]  version, 
    output logic [3:0]  ihl,
    output logic [7:0]  tcp_flags, 
    output logic [7:0]  protocol
);

    // Instantiate MAC
    mac inst_mac (
        .rx_dv       (rx_dv),
        .rxd         (rxd),
        .rxc         (rxc),
        .rx_clk      (rx_clk),
        .crs         (crs),
        .col         (col),
        .tx_clk      (tx_clk),
        .tx_er       (tx_er),
        .tx_en       (tx_en),
        .txd         (txd),
        .clk         (clk),
        .rst_n       (rst_n),
        .link_active (link_active),
        .ip_id       (ip_id),
        .ip_dst      (ip_dst),
        .ip_src      (ip_src),
        .tcp_src     (tcp_sport),
        .tcp_dst     (tcp_dport),
        .tcp_ack     (tcp_ack),
        .tcp_seq     (tcp_seq),
        .tcp_window  (tcp_window),
        .fields_valid(valid),
        .packet      (packet)
    );

    // Instantiate FP top module with parametrized NUM_FP
    fp_top #(.NUM_FP(NUM_FP)) inst_fp_top (
        .clk        (clk),
        .rst        (rst_n),
        .valid      (valid),
        .tcp_window (tcp_window),
        .tcp_seq    (tcp_seq),
        .ip_id      (ip_id),
        .tcp_sport  (tcp_sport),
        .tcp_ack    (tcp_ack),
        .tcp_dport  (tcp_dport),
        .ip_dst     (ip_dst),
        .fp_num     (fp_num),
        .fp_det     (fp_det)
    );

endmodule

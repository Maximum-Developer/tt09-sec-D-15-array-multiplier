`timescale 1ns / 1ps

module tt_um_section_d_group_fifteen_array_mult_structural(
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
    );
      assign uio_out = 0;
      assign uio_oe  = 0;
      wire _unused = &{ena, clk, rst_n, 1'b0};

    wire and01,and02,and03;
    wire and10,and11,and12,and13;
    wire and20,and21,and22,and23;
    wire and30,and31,and32,and33;

    wire i1,i2,i3;
    wire o1,o2,o3,o4;

    wire ii1,ii2,ii3;
    wire oo1,oo2,oo3,oo4;
    wire iii1,iii2,iii3;

    and(uo_out[0],ui_in[0],ui_in[4]);
    and(and01,ui_in[1],ui_in[4]);
    and(and02,ui_in[2],ui_in[4]);
    and(and03,ui_in[3],ui_in[4]);

    and(and10,ui_in[0],ui_in[5]);
    black_box inst1 (and01,and10,1'b0,uo_out[1],i1);
    and(and11,ui_in[1],ui_in[5]);
    black_box inst2 (and02,and11,i1,o1,i2);
    and(and12,ui_in[2],ui_in[5]);
    black_box inst3 (and03,and12,i2,o2,i3);
    and(and13,ui_in[3],ui_in[5]);
    black_box inst4 (1'b0,and13,i3,o3,o4);


    and(and20,ui_in[0],ui_in[6]);
    black_box inst5 (o1,and20,1'b0,uo_out[2],ii1);
    and(and21,ui_in[1],ui_in[6]);
    black_box inst6 (o2,and21,ii1,oo1,ii2);
    and(and22,ui_in[2],ui_in[6]);
    black_box inst7 (o3,and22,ii2,oo2,ii3);
    and(and23,ui_in[3],ui_in[6]);
    black_box inst8 (o4,and23,ii3,oo3,oo4);

    and(and30,ui_in[0],ui_in[7]);
    black_box inst9 (oo1,and30,1'b0,uo_out[3],iii1);
    and(and31,ui_in[1],ui_in[7]);
    black_box inst10 (oo2,and31,iii1,uo_out[4],iii2);
    and(and32,ui_in[2],ui_in[7]);
    black_box inst11 (oo3,and32,iii2,uo_out[5],iii3);
    and(and33,ui_in[3],ui_in[7]);
    black_box inst12 (oo4,and33,iii3,uo_out[6],uo_out[7]);

endmodule


module black_box(
    input a,
    input b,
    input c,
    output y,
    output z
    );
    
// Internal Signals
    wire int_sig1;
    wire int_sig2;
    wire int_sig3;
    wire int_sig4;
    wire int_sig5;
    wire int_sig6;
    wire int_sig7;
    wire int_sig8;
        
    assign int_sig1 = a & ~b;
    assign int_sig2 = ~a & b;
    assign int_sig3 = int_sig1 + int_sig2;
    assign int_sig4 = int_sig3 & ~c;
    assign int_sig5 = ~int_sig3 & c;
    assign y = int_sig4 + int_sig5; 
    assign int_sig6 = a & b;
    assign int_sig7 = b & c;
    assign int_sig8 = c & a;    
    assign z = int_sig6 | int_sig7 | int_sig8;
     
endmodule

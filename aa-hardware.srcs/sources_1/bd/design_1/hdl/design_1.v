//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
//Date        : Tue Jan 24 12:32:44 2017
//Host        : saturn running 64-bit Fedora release 26 (Rawhide)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=16,numReposBlks=16,numNonXlnxBlks=9,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=9,numPkgbdBlks=0,bdsource=USER,da_ps7_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    btn,
    clk,
    hdmi_clk_n,
    hdmi_clk_p,
    hdmi_d_n,
    hdmi_d_p,
    hdmi_out_en,
    led,
    sw,
    vga_b,
    vga_g,
    vga_hs,
    vga_r,
    vga_vs);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  input [3:0]btn;
  input clk;
  output [0:0]hdmi_clk_n;
  output [0:0]hdmi_clk_p;
  output [2:0]hdmi_d_n;
  output [2:0]hdmi_d_p;
  output [0:0]hdmi_out_en;
  output [3:0]led;
  input [3:0]sw;
  output [4:0]vga_b;
  output [5:0]vga_g;
  output vga_hs;
  output [4:0]vga_r;
  output vga_vs;

  wire Net1;
  wire [31:0]axi_protocol_converter_0_M_AXI_ARADDR;
  wire [2:0]axi_protocol_converter_0_M_AXI_ARPROT;
  wire axi_protocol_converter_0_M_AXI_ARREADY;
  wire axi_protocol_converter_0_M_AXI_ARVALID;
  wire [31:0]axi_protocol_converter_0_M_AXI_AWADDR;
  wire [2:0]axi_protocol_converter_0_M_AXI_AWPROT;
  wire axi_protocol_converter_0_M_AXI_AWREADY;
  wire axi_protocol_converter_0_M_AXI_AWVALID;
  wire axi_protocol_converter_0_M_AXI_BREADY;
  wire [1:0]axi_protocol_converter_0_M_AXI_BRESP;
  wire axi_protocol_converter_0_M_AXI_BVALID;
  wire [31:0]axi_protocol_converter_0_M_AXI_RDATA;
  wire axi_protocol_converter_0_M_AXI_RREADY;
  wire [1:0]axi_protocol_converter_0_M_AXI_RRESP;
  wire axi_protocol_converter_0_M_AXI_RVALID;
  wire [31:0]axi_protocol_converter_0_M_AXI_WDATA;
  wire axi_protocol_converter_0_M_AXI_WREADY;
  wire [3:0]axi_protocol_converter_0_M_AXI_WSTRB;
  wire axi_protocol_converter_0_M_AXI_WVALID;
  wire clk_1;
  wire clk_wiz_1_clk_out2;
  wire display_surface_0_burst_end;
  wire display_surface_0_burst_start;
  wire [63:0]display_surface_0_dout;
  wire [31:0]display_surface_0_fb_ARADDR;
  wire [1:0]display_surface_0_fb_ARBURST;
  wire [3:0]display_surface_0_fb_ARCACHE;
  wire [5:0]display_surface_0_fb_ARID;
  wire [3:0]display_surface_0_fb_ARLEN;
  wire [1:0]display_surface_0_fb_ARLOCK;
  wire [2:0]display_surface_0_fb_ARPROT;
  wire [3:0]display_surface_0_fb_ARQOS;
  wire display_surface_0_fb_ARREADY;
  wire [2:0]display_surface_0_fb_ARSIZE;
  wire display_surface_0_fb_ARVALID;
  wire [31:0]display_surface_0_fb_AWADDR;
  wire [1:0]display_surface_0_fb_AWBURST;
  wire [3:0]display_surface_0_fb_AWCACHE;
  wire [5:0]display_surface_0_fb_AWID;
  wire [3:0]display_surface_0_fb_AWLEN;
  wire [1:0]display_surface_0_fb_AWLOCK;
  wire [2:0]display_surface_0_fb_AWPROT;
  wire [3:0]display_surface_0_fb_AWQOS;
  wire display_surface_0_fb_AWREADY;
  wire [2:0]display_surface_0_fb_AWSIZE;
  wire display_surface_0_fb_AWVALID;
  wire [5:0]display_surface_0_fb_BID;
  wire display_surface_0_fb_BREADY;
  wire [1:0]display_surface_0_fb_BRESP;
  wire display_surface_0_fb_BVALID;
  wire [63:0]display_surface_0_fb_RDATA;
  wire [5:0]display_surface_0_fb_RID;
  wire display_surface_0_fb_RLAST;
  wire display_surface_0_fb_RREADY;
  wire [1:0]display_surface_0_fb_RRESP;
  wire display_surface_0_fb_RVALID;
  wire [63:0]display_surface_0_fb_WDATA;
  wire [5:0]display_surface_0_fb_WID;
  wire display_surface_0_fb_WLAST;
  wire display_surface_0_fb_WREADY;
  wire [7:0]display_surface_0_fb_WSTRB;
  wire display_surface_0_fb_WVALID;
  wire display_surface_0_frame_sync_ack;
  wire [8:0]display_surface_0_waddr;
  wire display_surface_0_wr_en;
  wire fb_fifo_1_burst_ready;
  wire [31:0]fb_fifo_1_dout;
  wire [3:0]fb_fifo_1_error;
  wire fb_fifo_1_rempty;
  wire fb_fifo_1_wfull;
  wire hdmi_fb_0_c0;
  wire hdmi_fb_0_c1;
  wire hdmi_fb_0_c2;
  wire hdmi_fb_0_c3;
  wire hdmi_fb_0_data_en;
  wire hdmi_fb_0_frame_sync;
  wire hdmi_fb_0_hdmi_enable;
  wire hdmi_fb_0_hsync;
  wire hdmi_fb_0_rd_en;
  wire [9:0]hdmi_fb_0_render_addr;
  wire [7:0]hdmi_fb_0_tmds_0;
  wire [7:0]hdmi_fb_0_tmds_1;
  wire [7:0]hdmi_fb_0_tmds_2;
  wire hdmi_fb_0_vsync;
  wire [0:0]proc_sys_reset_0_interconnect_aresetn;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  wire [0:0]proc_sys_reset_0_peripheral_reset;
  wire [14:0]processing_system7_0_DDR_ADDR;
  wire [2:0]processing_system7_0_DDR_BA;
  wire processing_system7_0_DDR_CAS_N;
  wire processing_system7_0_DDR_CKE;
  wire processing_system7_0_DDR_CK_N;
  wire processing_system7_0_DDR_CK_P;
  wire processing_system7_0_DDR_CS_N;
  wire [3:0]processing_system7_0_DDR_DM;
  wire [31:0]processing_system7_0_DDR_DQ;
  wire [3:0]processing_system7_0_DDR_DQS_N;
  wire [3:0]processing_system7_0_DDR_DQS_P;
  wire processing_system7_0_DDR_ODT;
  wire processing_system7_0_DDR_RAS_N;
  wire processing_system7_0_DDR_RESET_N;
  wire processing_system7_0_DDR_WE_N;
  wire processing_system7_0_FCLK_RESET0_N;
  wire processing_system7_0_FIXED_IO_DDR_VRN;
  wire processing_system7_0_FIXED_IO_DDR_VRP;
  wire [53:0]processing_system7_0_FIXED_IO_MIO;
  wire processing_system7_0_FIXED_IO_PS_CLK;
  wire processing_system7_0_FIXED_IO_PS_PORB;
  wire processing_system7_0_FIXED_IO_PS_SRSTB;
  wire [31:0]processing_system7_0_M_AXI_GP0_ARADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARBURST;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP0_ARID;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARLEN;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP0_ARPROT;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARQOS;
  wire processing_system7_0_M_AXI_GP0_ARREADY;
  wire [2:0]processing_system7_0_M_AXI_GP0_ARSIZE;
  wire processing_system7_0_M_AXI_GP0_ARVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_AWADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWBURST;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP0_AWID;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWLEN;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP0_AWPROT;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWQOS;
  wire processing_system7_0_M_AXI_GP0_AWREADY;
  wire [2:0]processing_system7_0_M_AXI_GP0_AWSIZE;
  wire processing_system7_0_M_AXI_GP0_AWVALID;
  wire [11:0]processing_system7_0_M_AXI_GP0_BID;
  wire processing_system7_0_M_AXI_GP0_BREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_BRESP;
  wire processing_system7_0_M_AXI_GP0_BVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_RDATA;
  wire [11:0]processing_system7_0_M_AXI_GP0_RID;
  wire processing_system7_0_M_AXI_GP0_RLAST;
  wire processing_system7_0_M_AXI_GP0_RREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_RRESP;
  wire processing_system7_0_M_AXI_GP0_RVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_WDATA;
  wire [11:0]processing_system7_0_M_AXI_GP0_WID;
  wire processing_system7_0_M_AXI_GP0_WLAST;
  wire processing_system7_0_M_AXI_GP0_WREADY;
  wire [3:0]processing_system7_0_M_AXI_GP0_WSTRB;
  wire processing_system7_0_M_AXI_GP0_WVALID;
  wire selectio_tmds_0_dout_n;
  wire selectio_tmds_0_dout_p;
  wire selectio_tmds_1_dout_n;
  wire selectio_tmds_1_dout_p;
  wire selectio_tmds_2_dout_n;
  wire selectio_tmds_2_dout_p;
  wire selectio_tmds_3_dout_n;
  wire selectio_tmds_3_dout_p;
  wire [9:0]tmds_encode_0_q_out0;
  wire [9:0]tmds_encode_0_q_out1;
  wire [9:0]tmds_encode_0_q_out2;
  wire [4:0]vga_dither_0_b_o;
  wire [5:0]vga_dither_0_g_o;
  wire vga_dither_0_hs_o;
  wire [4:0]vga_dither_0_r_o;
  wire vga_dither_0_vs_o;
  wire [2:0]xlconcat_0_dout;
  wire [2:0]xlconcat_1_dout;
  wire [9:0]xlconstant_0_dout;

  assign clk_1 = clk;
  assign hdmi_clk_n[0] = selectio_tmds_3_dout_n;
  assign hdmi_clk_p[0] = selectio_tmds_3_dout_p;
  assign hdmi_d_n[2:0] = xlconcat_1_dout;
  assign hdmi_d_p[2:0] = xlconcat_0_dout;
  assign hdmi_out_en[0] = hdmi_fb_0_hdmi_enable;
  assign led[3:0] = fb_fifo_1_error;
  assign vga_b[4:0] = vga_dither_0_b_o;
  assign vga_g[5:0] = vga_dither_0_g_o;
  assign vga_hs = vga_dither_0_hs_o;
  assign vga_r[4:0] = vga_dither_0_r_o;
  assign vga_vs = vga_dither_0_vs_o;
  design_1_axi_protocol_converter_0_0 axi_protocol_converter_0
       (.aclk(clk_wiz_1_clk_out2),
        .aresetn(proc_sys_reset_0_interconnect_aresetn),
        .m_axi_araddr(axi_protocol_converter_0_M_AXI_ARADDR),
        .m_axi_arprot(axi_protocol_converter_0_M_AXI_ARPROT),
        .m_axi_arready(axi_protocol_converter_0_M_AXI_ARREADY),
        .m_axi_arvalid(axi_protocol_converter_0_M_AXI_ARVALID),
        .m_axi_awaddr(axi_protocol_converter_0_M_AXI_AWADDR),
        .m_axi_awprot(axi_protocol_converter_0_M_AXI_AWPROT),
        .m_axi_awready(axi_protocol_converter_0_M_AXI_AWREADY),
        .m_axi_awvalid(axi_protocol_converter_0_M_AXI_AWVALID),
        .m_axi_bready(axi_protocol_converter_0_M_AXI_BREADY),
        .m_axi_bresp(axi_protocol_converter_0_M_AXI_BRESP),
        .m_axi_bvalid(axi_protocol_converter_0_M_AXI_BVALID),
        .m_axi_rdata(axi_protocol_converter_0_M_AXI_RDATA),
        .m_axi_rready(axi_protocol_converter_0_M_AXI_RREADY),
        .m_axi_rresp(axi_protocol_converter_0_M_AXI_RRESP),
        .m_axi_rvalid(axi_protocol_converter_0_M_AXI_RVALID),
        .m_axi_wdata(axi_protocol_converter_0_M_AXI_WDATA),
        .m_axi_wready(axi_protocol_converter_0_M_AXI_WREADY),
        .m_axi_wstrb(axi_protocol_converter_0_M_AXI_WSTRB),
        .m_axi_wvalid(axi_protocol_converter_0_M_AXI_WVALID),
        .s_axi_araddr(processing_system7_0_M_AXI_GP0_ARADDR),
        .s_axi_arburst(processing_system7_0_M_AXI_GP0_ARBURST),
        .s_axi_arcache(processing_system7_0_M_AXI_GP0_ARCACHE),
        .s_axi_arid(processing_system7_0_M_AXI_GP0_ARID),
        .s_axi_arlen(processing_system7_0_M_AXI_GP0_ARLEN),
        .s_axi_arlock(processing_system7_0_M_AXI_GP0_ARLOCK),
        .s_axi_arprot(processing_system7_0_M_AXI_GP0_ARPROT),
        .s_axi_arqos(processing_system7_0_M_AXI_GP0_ARQOS),
        .s_axi_arready(processing_system7_0_M_AXI_GP0_ARREADY),
        .s_axi_arsize(processing_system7_0_M_AXI_GP0_ARSIZE),
        .s_axi_arvalid(processing_system7_0_M_AXI_GP0_ARVALID),
        .s_axi_awaddr(processing_system7_0_M_AXI_GP0_AWADDR),
        .s_axi_awburst(processing_system7_0_M_AXI_GP0_AWBURST),
        .s_axi_awcache(processing_system7_0_M_AXI_GP0_AWCACHE),
        .s_axi_awid(processing_system7_0_M_AXI_GP0_AWID),
        .s_axi_awlen(processing_system7_0_M_AXI_GP0_AWLEN),
        .s_axi_awlock(processing_system7_0_M_AXI_GP0_AWLOCK),
        .s_axi_awprot(processing_system7_0_M_AXI_GP0_AWPROT),
        .s_axi_awqos(processing_system7_0_M_AXI_GP0_AWQOS),
        .s_axi_awready(processing_system7_0_M_AXI_GP0_AWREADY),
        .s_axi_awsize(processing_system7_0_M_AXI_GP0_AWSIZE),
        .s_axi_awvalid(processing_system7_0_M_AXI_GP0_AWVALID),
        .s_axi_bid(processing_system7_0_M_AXI_GP0_BID),
        .s_axi_bready(processing_system7_0_M_AXI_GP0_BREADY),
        .s_axi_bresp(processing_system7_0_M_AXI_GP0_BRESP),
        .s_axi_bvalid(processing_system7_0_M_AXI_GP0_BVALID),
        .s_axi_rdata(processing_system7_0_M_AXI_GP0_RDATA),
        .s_axi_rid(processing_system7_0_M_AXI_GP0_RID),
        .s_axi_rlast(processing_system7_0_M_AXI_GP0_RLAST),
        .s_axi_rready(processing_system7_0_M_AXI_GP0_RREADY),
        .s_axi_rresp(processing_system7_0_M_AXI_GP0_RRESP),
        .s_axi_rvalid(processing_system7_0_M_AXI_GP0_RVALID),
        .s_axi_wdata(processing_system7_0_M_AXI_GP0_WDATA),
        .s_axi_wid(processing_system7_0_M_AXI_GP0_WID),
        .s_axi_wlast(processing_system7_0_M_AXI_GP0_WLAST),
        .s_axi_wready(processing_system7_0_M_AXI_GP0_WREADY),
        .s_axi_wstrb(processing_system7_0_M_AXI_GP0_WSTRB),
        .s_axi_wvalid(processing_system7_0_M_AXI_GP0_WVALID));
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk_1),
        .clk_out1(Net1),
        .clk_out2(clk_wiz_1_clk_out2));
  design_1_display_surface_0_1 display_surface_0
       (.aclk(clk_wiz_1_clk_out2),
        .aresetn(proc_sys_reset_0_peripheral_aresetn),
        .burst_end(display_surface_0_burst_end),
        .burst_ready(fb_fifo_1_burst_ready),
        .burst_start(display_surface_0_burst_start),
        .cfg_araddr(axi_protocol_converter_0_M_AXI_ARADDR),
        .cfg_arprot(axi_protocol_converter_0_M_AXI_ARPROT),
        .cfg_arready(axi_protocol_converter_0_M_AXI_ARREADY),
        .cfg_arvalid(axi_protocol_converter_0_M_AXI_ARVALID),
        .cfg_awaddr(axi_protocol_converter_0_M_AXI_AWADDR),
        .cfg_awprot(axi_protocol_converter_0_M_AXI_AWPROT),
        .cfg_awready(axi_protocol_converter_0_M_AXI_AWREADY),
        .cfg_awvalid(axi_protocol_converter_0_M_AXI_AWVALID),
        .cfg_bready(axi_protocol_converter_0_M_AXI_BREADY),
        .cfg_bresp(axi_protocol_converter_0_M_AXI_BRESP),
        .cfg_bvalid(axi_protocol_converter_0_M_AXI_BVALID),
        .cfg_rdata(axi_protocol_converter_0_M_AXI_RDATA),
        .cfg_rready(axi_protocol_converter_0_M_AXI_RREADY),
        .cfg_rresp(axi_protocol_converter_0_M_AXI_RRESP),
        .cfg_rvalid(axi_protocol_converter_0_M_AXI_RVALID),
        .cfg_wdata(axi_protocol_converter_0_M_AXI_WDATA),
        .cfg_wready(axi_protocol_converter_0_M_AXI_WREADY),
        .cfg_wstrb(axi_protocol_converter_0_M_AXI_WSTRB),
        .cfg_wvalid(axi_protocol_converter_0_M_AXI_WVALID),
        .dout(display_surface_0_dout),
        .fb_araddr(display_surface_0_fb_ARADDR),
        .fb_arburst(display_surface_0_fb_ARBURST),
        .fb_arcache(display_surface_0_fb_ARCACHE),
        .fb_arid(display_surface_0_fb_ARID),
        .fb_arlen(display_surface_0_fb_ARLEN),
        .fb_arlock(display_surface_0_fb_ARLOCK),
        .fb_arprot(display_surface_0_fb_ARPROT),
        .fb_arqos(display_surface_0_fb_ARQOS),
        .fb_arready(display_surface_0_fb_ARREADY),
        .fb_arsize(display_surface_0_fb_ARSIZE),
        .fb_arvalid(display_surface_0_fb_ARVALID),
        .fb_awaddr(display_surface_0_fb_AWADDR),
        .fb_awburst(display_surface_0_fb_AWBURST),
        .fb_awcache(display_surface_0_fb_AWCACHE),
        .fb_awid(display_surface_0_fb_AWID),
        .fb_awlen(display_surface_0_fb_AWLEN),
        .fb_awlock(display_surface_0_fb_AWLOCK),
        .fb_awprot(display_surface_0_fb_AWPROT),
        .fb_awqos(display_surface_0_fb_AWQOS),
        .fb_awready(display_surface_0_fb_AWREADY),
        .fb_awsize(display_surface_0_fb_AWSIZE),
        .fb_awvalid(display_surface_0_fb_AWVALID),
        .fb_bid(display_surface_0_fb_BID),
        .fb_bready(display_surface_0_fb_BREADY),
        .fb_bresp(display_surface_0_fb_BRESP),
        .fb_bvalid(display_surface_0_fb_BVALID),
        .fb_rdata(display_surface_0_fb_RDATA),
        .fb_rid(display_surface_0_fb_RID),
        .fb_rlast(display_surface_0_fb_RLAST),
        .fb_rready(display_surface_0_fb_RREADY),
        .fb_rresp(display_surface_0_fb_RRESP),
        .fb_rvalid(display_surface_0_fb_RVALID),
        .fb_wdata(display_surface_0_fb_WDATA),
        .fb_wid(display_surface_0_fb_WID),
        .fb_wlast(display_surface_0_fb_WLAST),
        .fb_wready(display_surface_0_fb_WREADY),
        .fb_wstrb(display_surface_0_fb_WSTRB),
        .fb_wvalid(display_surface_0_fb_WVALID),
        .frame_sync(hdmi_fb_0_frame_sync),
        .frame_sync_ack(display_surface_0_frame_sync_ack),
        .rempty(fb_fifo_1_rempty),
        .waddr(display_surface_0_waddr),
        .wfull(fb_fifo_1_wfull),
        .wr_en(display_surface_0_wr_en));
  design_1_fb_fifo_1_0 fb_fifo_1
       (.burst_end(display_surface_0_burst_end),
        .burst_ready(fb_fifo_1_burst_ready),
        .burst_start(display_surface_0_burst_start),
        .din(display_surface_0_dout),
        .error(fb_fifo_1_error),
        .frame_sync(hdmi_fb_0_frame_sync),
        .frame_sync_ack(display_surface_0_frame_sync_ack),
        .raddr(hdmi_fb_0_render_addr),
        .rclk(clk_wiz_1_clk_out2),
        .rdata(fb_fifo_1_dout),
        .rempty(fb_fifo_1_rempty),
        .ren(hdmi_fb_0_rd_en),
        .reset(proc_sys_reset_0_peripheral_reset),
        .waddr(display_surface_0_waddr),
        .wclk(clk_wiz_1_clk_out2),
        .wen(display_surface_0_wr_en),
        .wfull(fb_fifo_1_wfull));
  design_1_hdmi_fb_0_0 hdmi_fb_0
       (.c0(hdmi_fb_0_c0),
        .c1(hdmi_fb_0_c1),
        .c2(hdmi_fb_0_c2),
        .c3(hdmi_fb_0_c3),
        .clk(clk_wiz_1_clk_out2),
        .data_en(hdmi_fb_0_data_en),
        .din(fb_fifo_1_dout),
        .frame_sync(hdmi_fb_0_frame_sync),
        .hdmi_enable(hdmi_fb_0_hdmi_enable),
        .hsync(hdmi_fb_0_hsync),
        .rd_en(hdmi_fb_0_rd_en),
        .render_addr(hdmi_fb_0_render_addr),
        .reset(proc_sys_reset_0_peripheral_reset),
        .tmds_0(hdmi_fb_0_tmds_0),
        .tmds_1(hdmi_fb_0_tmds_1),
        .tmds_2(hdmi_fb_0_tmds_2),
        .vsync(hdmi_fb_0_vsync));
  design_1_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .interconnect_aresetn(proc_sys_reset_0_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .peripheral_reset(proc_sys_reset_0_peripheral_reset),
        .slowest_sync_clk(clk_wiz_1_clk_out2));
  design_1_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_RESET0_N(processing_system7_0_FCLK_RESET0_N),
        .IRQ_F2P(1'b0),
        .MIO(FIXED_IO_mio[53:0]),
        .M_AXI_GP0_ACLK(clk_wiz_1_clk_out2),
        .M_AXI_GP0_ARADDR(processing_system7_0_M_AXI_GP0_ARADDR),
        .M_AXI_GP0_ARBURST(processing_system7_0_M_AXI_GP0_ARBURST),
        .M_AXI_GP0_ARCACHE(processing_system7_0_M_AXI_GP0_ARCACHE),
        .M_AXI_GP0_ARID(processing_system7_0_M_AXI_GP0_ARID),
        .M_AXI_GP0_ARLEN(processing_system7_0_M_AXI_GP0_ARLEN),
        .M_AXI_GP0_ARLOCK(processing_system7_0_M_AXI_GP0_ARLOCK),
        .M_AXI_GP0_ARPROT(processing_system7_0_M_AXI_GP0_ARPROT),
        .M_AXI_GP0_ARQOS(processing_system7_0_M_AXI_GP0_ARQOS),
        .M_AXI_GP0_ARREADY(processing_system7_0_M_AXI_GP0_ARREADY),
        .M_AXI_GP0_ARSIZE(processing_system7_0_M_AXI_GP0_ARSIZE),
        .M_AXI_GP0_ARVALID(processing_system7_0_M_AXI_GP0_ARVALID),
        .M_AXI_GP0_AWADDR(processing_system7_0_M_AXI_GP0_AWADDR),
        .M_AXI_GP0_AWBURST(processing_system7_0_M_AXI_GP0_AWBURST),
        .M_AXI_GP0_AWCACHE(processing_system7_0_M_AXI_GP0_AWCACHE),
        .M_AXI_GP0_AWID(processing_system7_0_M_AXI_GP0_AWID),
        .M_AXI_GP0_AWLEN(processing_system7_0_M_AXI_GP0_AWLEN),
        .M_AXI_GP0_AWLOCK(processing_system7_0_M_AXI_GP0_AWLOCK),
        .M_AXI_GP0_AWPROT(processing_system7_0_M_AXI_GP0_AWPROT),
        .M_AXI_GP0_AWQOS(processing_system7_0_M_AXI_GP0_AWQOS),
        .M_AXI_GP0_AWREADY(processing_system7_0_M_AXI_GP0_AWREADY),
        .M_AXI_GP0_AWSIZE(processing_system7_0_M_AXI_GP0_AWSIZE),
        .M_AXI_GP0_AWVALID(processing_system7_0_M_AXI_GP0_AWVALID),
        .M_AXI_GP0_BID(processing_system7_0_M_AXI_GP0_BID),
        .M_AXI_GP0_BREADY(processing_system7_0_M_AXI_GP0_BREADY),
        .M_AXI_GP0_BRESP(processing_system7_0_M_AXI_GP0_BRESP),
        .M_AXI_GP0_BVALID(processing_system7_0_M_AXI_GP0_BVALID),
        .M_AXI_GP0_RDATA(processing_system7_0_M_AXI_GP0_RDATA),
        .M_AXI_GP0_RID(processing_system7_0_M_AXI_GP0_RID),
        .M_AXI_GP0_RLAST(processing_system7_0_M_AXI_GP0_RLAST),
        .M_AXI_GP0_RREADY(processing_system7_0_M_AXI_GP0_RREADY),
        .M_AXI_GP0_RRESP(processing_system7_0_M_AXI_GP0_RRESP),
        .M_AXI_GP0_RVALID(processing_system7_0_M_AXI_GP0_RVALID),
        .M_AXI_GP0_WDATA(processing_system7_0_M_AXI_GP0_WDATA),
        .M_AXI_GP0_WID(processing_system7_0_M_AXI_GP0_WID),
        .M_AXI_GP0_WLAST(processing_system7_0_M_AXI_GP0_WLAST),
        .M_AXI_GP0_WREADY(processing_system7_0_M_AXI_GP0_WREADY),
        .M_AXI_GP0_WSTRB(processing_system7_0_M_AXI_GP0_WSTRB),
        .M_AXI_GP0_WVALID(processing_system7_0_M_AXI_GP0_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .SDIO0_WP(1'b0),
        .S_AXI_HP0_ACLK(clk_wiz_1_clk_out2),
        .S_AXI_HP0_ARADDR(display_surface_0_fb_ARADDR),
        .S_AXI_HP0_ARBURST(display_surface_0_fb_ARBURST),
        .S_AXI_HP0_ARCACHE(display_surface_0_fb_ARCACHE),
        .S_AXI_HP0_ARID(display_surface_0_fb_ARID),
        .S_AXI_HP0_ARLEN(display_surface_0_fb_ARLEN),
        .S_AXI_HP0_ARLOCK(display_surface_0_fb_ARLOCK),
        .S_AXI_HP0_ARPROT(display_surface_0_fb_ARPROT),
        .S_AXI_HP0_ARQOS(display_surface_0_fb_ARQOS),
        .S_AXI_HP0_ARREADY(display_surface_0_fb_ARREADY),
        .S_AXI_HP0_ARSIZE(display_surface_0_fb_ARSIZE),
        .S_AXI_HP0_ARVALID(display_surface_0_fb_ARVALID),
        .S_AXI_HP0_AWADDR(display_surface_0_fb_AWADDR),
        .S_AXI_HP0_AWBURST(display_surface_0_fb_AWBURST),
        .S_AXI_HP0_AWCACHE(display_surface_0_fb_AWCACHE),
        .S_AXI_HP0_AWID(display_surface_0_fb_AWID),
        .S_AXI_HP0_AWLEN(display_surface_0_fb_AWLEN),
        .S_AXI_HP0_AWLOCK(display_surface_0_fb_AWLOCK),
        .S_AXI_HP0_AWPROT(display_surface_0_fb_AWPROT),
        .S_AXI_HP0_AWQOS(display_surface_0_fb_AWQOS),
        .S_AXI_HP0_AWREADY(display_surface_0_fb_AWREADY),
        .S_AXI_HP0_AWSIZE(display_surface_0_fb_AWSIZE),
        .S_AXI_HP0_AWVALID(display_surface_0_fb_AWVALID),
        .S_AXI_HP0_BID(display_surface_0_fb_BID),
        .S_AXI_HP0_BREADY(display_surface_0_fb_BREADY),
        .S_AXI_HP0_BRESP(display_surface_0_fb_BRESP),
        .S_AXI_HP0_BVALID(display_surface_0_fb_BVALID),
        .S_AXI_HP0_RDATA(display_surface_0_fb_RDATA),
        .S_AXI_HP0_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP0_RID(display_surface_0_fb_RID),
        .S_AXI_HP0_RLAST(display_surface_0_fb_RLAST),
        .S_AXI_HP0_RREADY(display_surface_0_fb_RREADY),
        .S_AXI_HP0_RRESP(display_surface_0_fb_RRESP),
        .S_AXI_HP0_RVALID(display_surface_0_fb_RVALID),
        .S_AXI_HP0_WDATA(display_surface_0_fb_WDATA),
        .S_AXI_HP0_WID(display_surface_0_fb_WID),
        .S_AXI_HP0_WLAST(display_surface_0_fb_WLAST),
        .S_AXI_HP0_WREADY(display_surface_0_fb_WREADY),
        .S_AXI_HP0_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP0_WSTRB(display_surface_0_fb_WSTRB),
        .S_AXI_HP0_WVALID(display_surface_0_fb_WVALID),
        .USB0_VBUS_PWRFAULT(1'b0));
  design_1_selectio_tmds_0_0 selectio_tmds_0
       (.clk(Net1),
        .clk_div5(clk_wiz_1_clk_out2),
        .data(tmds_encode_0_q_out0),
        .dout_n(selectio_tmds_0_dout_n),
        .dout_p(selectio_tmds_0_dout_p),
        .reset(proc_sys_reset_0_peripheral_reset));
  design_1_selectio_tmds_0_1 selectio_tmds_1
       (.clk(Net1),
        .clk_div5(clk_wiz_1_clk_out2),
        .data(tmds_encode_0_q_out1),
        .dout_n(selectio_tmds_1_dout_n),
        .dout_p(selectio_tmds_1_dout_p),
        .reset(proc_sys_reset_0_peripheral_reset));
  design_1_selectio_tmds_0_2 selectio_tmds_2
       (.clk(Net1),
        .clk_div5(clk_wiz_1_clk_out2),
        .data(tmds_encode_0_q_out2),
        .dout_n(selectio_tmds_2_dout_n),
        .dout_p(selectio_tmds_2_dout_p),
        .reset(proc_sys_reset_0_peripheral_reset));
  design_1_selectio_tmds_2_0 selectio_tmds_3
       (.clk(Net1),
        .clk_div5(clk_wiz_1_clk_out2),
        .data(xlconstant_0_dout),
        .dout_n(selectio_tmds_3_dout_n),
        .dout_p(selectio_tmds_3_dout_p),
        .reset(proc_sys_reset_0_peripheral_reset));
  design_1_tmds_encode_0_0 tmds_encode_0
       (.c0(hdmi_fb_0_c0),
        .c1(hdmi_fb_0_c1),
        .c2(hdmi_fb_0_c2),
        .c3(hdmi_fb_0_c3),
        .data_en(hdmi_fb_0_data_en),
        .hdmi_clk(clk_wiz_1_clk_out2),
        .hsync(hdmi_fb_0_hsync),
        .q_out0(tmds_encode_0_q_out0),
        .q_out1(tmds_encode_0_q_out1),
        .q_out2(tmds_encode_0_q_out2),
        .reset(proc_sys_reset_0_peripheral_reset),
        .tmds_0(hdmi_fb_0_tmds_0),
        .tmds_1(hdmi_fb_0_tmds_1),
        .tmds_2(hdmi_fb_0_tmds_2),
        .vsync(hdmi_fb_0_vsync));
  design_1_vga_dither_0_0 vga_dither_0
       (.b_i(hdmi_fb_0_tmds_2),
        .b_o(vga_dither_0_b_o),
        .clk(clk_wiz_1_clk_out2),
        .g_i(hdmi_fb_0_tmds_1),
        .g_o(vga_dither_0_g_o),
        .hs_i(hdmi_fb_0_hsync),
        .hs_o(vga_dither_0_hs_o),
        .r_i(hdmi_fb_0_tmds_0),
        .r_o(vga_dither_0_r_o),
        .vs_i(hdmi_fb_0_vsync),
        .vs_o(vga_dither_0_vs_o));
  design_1_xlconcat_0_0 xlconcat_0
       (.In0(selectio_tmds_0_dout_p),
        .In1(selectio_tmds_1_dout_p),
        .In2(selectio_tmds_2_dout_p),
        .dout(xlconcat_0_dout));
  design_1_xlconcat_0_2 xlconcat_1
       (.In0(selectio_tmds_0_dout_n),
        .In1(selectio_tmds_1_dout_n),
        .In2(selectio_tmds_2_dout_n),
        .dout(xlconcat_1_dout));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule

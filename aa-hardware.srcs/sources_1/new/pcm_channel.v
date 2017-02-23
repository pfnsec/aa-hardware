`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2016 13:52:10
// Design Name: 
// Module Name: pcm_channel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pcm_channel (
	input              aclk,
	input              aresetn,

	output reg         ac_arvalid,
	output reg         ac_awvalid,
	output reg         ac_bready,
	output reg         ac_rready,
	output reg         ac_wlast,
	output reg         ac_wvalid,
	output reg  [5:0]  ac_arid,
	output reg  [5:0]  ac_awid,
	output reg  [5:0]  ac_wid,
	output reg  [1:0]  ac_arburst,
	output reg  [1:0]  ac_arlock,
	output reg  [2:0]  ac_arsize,
	output reg  [1:0]  ac_awburst,
	output reg  [1:0]  ac_awlock,
	output reg  [2:0]  ac_awsize,
	output reg  [2:0]  ac_arprot,
	output reg  [2:0]  ac_awprot,
	output reg  [31:0] ac_araddr,
	output reg  [31:0] ac_awaddr,
	output reg  [63:0] ac_wdata,
	output reg  [3:0]  ac_arcache,
	output reg  [3:0]  ac_arlen,
	output reg  [3:0]  ac_arqos,
	output reg  [3:0]  ac_awcache,
	output reg  [3:0]  ac_awlen,
	output reg  [3:0]  ac_awqos,
	output reg  [7:0]  ac_wstrb,
	input              ac_arready,
	input              ac_awready,
	input              ac_bvalid,
	input              ac_rlast,
	input              ac_rvalid,
	input              ac_wready,
	input       [5:0]  ac_bid,
	input       [5:0]  ac_rid,
	input       [1:0]  ac_bresp,
	input       [1:0]  ac_rresp,
	input       [63:0] ac_rdata,

	input              cfg_arvalid,
	input       [2:0]  cfg_arprot,
	input       [31:0] cfg_araddr,
	input              cfg_awvalid,
	input              cfg_bready,
	input              cfg_rready,
	input       [2:0]  cfg_awprot,
	input       [31:0] cfg_awaddr,
	input       [31:0] cfg_wdata,
	input              cfg_wvalid,
	input       [3:0]  cfg_wstrb,
	output reg         cfg_arready,
	output reg         cfg_awready,
	output reg         cfg_wready,
	output reg         cfg_bvalid,
	output reg  [1:0]  cfg_bresp,
	output reg  [1:0]  cfg_rresp,
	output reg         cfg_rvalid,
	output reg  [31:0] cfg_rdata,

	output reg  [8:0]  waddr,
	output reg  [63:0] dout,
	output reg         wr_en,

	//i2c request channel
	output reg [6:0] i2c_addr,
	output reg       i2c_rw,
	output reg [8:0] i2c_wdata,
	output reg       i2c_req_valid,
	input            i2c_req_ready,

	output           muten,

	//i2c response channel
	input      [8:0] i2c_rdata,
	input            i2c_ack,
	input            i2c_resp_valid,
	output reg       i2c_resp_ready,

	output           irq
);

	parameter burst_len = 16;

	reg [31:0] cfg_awaddr_buf; 

	reg [31:0] ac_cfg; 

	`define AC_CFG_EN    0
	`define AC_CFG_IRQEN 1
	`define AC_MUTEN     2
	assign muten = ac_cfg[`AC_MUTEN];

	reg [31:0] ac_irq_status;
	reg [31:0] ac_irq_mask;

	assign irq = (| (ac_irq_status & ac_irq_mask));

	//bits [31:24]: register address
	//bits [23:15]: write data
	reg [31:0] ac_i2c_req;
	`define I2C_TRANSACTION_START 1

	reg [31:0] ac_i2c_resp;
	`define I2C_TRANSACTION_FINISH 1

	reg burst_active;

	reg  [8:0] waddr_buf;
	reg [63:0] dout_buf;
	reg        wr_en_buf;

	reg [20:0] rd_issue_count;

	reg  [4:0] ac_state;

	`define STATE_RESET      0 
	`define STATE_IDLE       1 
	`define STATE_       1 
	`define STATE_BLOCK_IDLE 3 
	`define STATE_FILL_START 4 
	`define STATE_FILL       5

	always @(posedge aclk) begin
		if(~aresetn) begin
			ac_arvalid <= 0;
			ac_awvalid <= 0;
			ac_bready  <= 0;
			ac_rready  <= 0;
			ac_wlast   <= 0;
			ac_wvalid  <= 0;
			ac_arid    <= 0;
			ac_awid    <= 0;
			ac_wid     <= 0;
			ac_arburst <= 2'b01;
			ac_arlock  <= 0;
			ac_arsize  <= 3'b011;
			ac_awburst <= 0;
			ac_awlock  <= 0;
			ac_awsize  <= 0;
			ac_arprot  <= 0;
			ac_awprot  <= 0;
			ac_araddr  <= 0;
			ac_awaddr  <= 0;
			ac_wdata   <= 0;
			ac_arcache <= 4'b0011;
			ac_arlen   <= burst_len - 1;
			ac_arqos   <= 0;
			ac_awcache <= 0;
			ac_awlen   <= 0;
			ac_awqos   <= 0;
			ac_wstrb   <= 0;

			ac_state   <= `STATE_RESET;

			dout       <= 0;
			dout_buf   <= 0;

			wr_en      <= 0;
			wr_en_buf  <= 0;

		end else begin

			case(ac_state)

			`STATE_RESET: begin
				ac_state <= `STATE_RESET;
			end
/*
			`STATE_IDLE: begin
				if(ac_cfg[`FB_CFG_EN]) begin
					ac_araddr  <= ac_base0;
					ac_arvalid <= 0;
					ac_state   <= `STATE_BLOCK_IDLE;
				end

				ac_rready  <= 0;
			end

			`STATE_FLIP: begin
				wr_en       <= 0;
				burst_start <= 0;
				burst_end   <= 0;
				waddr       <= 0;

				if(frame_sync_pending) begin
					if(fb_cfg[`FB_CFG_FLIP]) begin
						if(fb_status & `FB_CFG_FBSEL) begin
							fb_status <= fb_status & ~`FB_CFG_FBSEL;
							fb_araddr <= fb_base0;
						end else begin
							fb_status <= fb_status |  `FB_CFG_FBSEL;
							fb_araddr <= fb_base1;
						end
					end else begin
						fb_araddr <= (fb_status & `FB_CFG_FBSEL) ? fb_base1 : fb_base0; 
					end

					fb_rready      <= 0;
					fb_arvalid     <= 0;
					fb_state       <= `STATE_BLOCK_IDLE;
					rd_issue_count <= 0;
					frame_sync_ack <= 1;
				end
			end

			`STATE_BLOCK_IDLE: begin
				frame_sync_ack <= 0;
				wr_en      <= 0;

				if(rempty) begin
					fb_state   <= `STATE_FILL_START;
					fb_arvalid <= 1;
				end
			end

			`STATE_FILL_START: begin
				wr_en   <= 0;

				if(fb_arvalid & fb_arready) begin
					fb_arvalid     <= 0;
					fb_rready      <= 1;
					rd_issue_count <= rd_issue_count + 1;
					fb_state       <= `STATE_FILL;
				end
			end

			`STATE_FILL: begin
				if(fb_rvalid & fb_rready) begin
					waddr <= waddr + 1;
					wr_en <= 1;
					dout  <= fb_rdata;

					if(fb_rlast) begin
						fb_rready  <= 0;

						if(rd_issue_count = 9600) begin
							fb_state   <= `STATE_FLIP;
						end else begin
							fb_araddr  <= fb_araddr + (burst_len * 8);

							if(waddr == 511) begin
								fb_arvalid <= 0;
								fb_state   <= `STATE_BLOCK_IDLE;
							end else begin
								fb_arvalid <= 1;
								fb_state   <= `STATE_FILL_START;
							end
						end
					end
				end else begin
					wr_en <= 0;
					dout  <= 0;
				end
			end
*/
			endcase
		end
	end

	reg [2:0] cfg_rstate;
	`define RD_IDLE   0
	`define RD_OUTPUT 1

	reg [2:0] cfg_wstate;
	`define WR_IDLE     0
	`define WR_WAIT     1
	`define WR_I2C_WAIT 2
	`define WR_RESP     3

	always @(posedge aclk) begin
		if(~aresetn) begin
			cfg_arready <= 1;
			cfg_awready <= 1;
			cfg_bvalid  <= 0;
			cfg_rvalid  <= 0;
			cfg_wready  <= 0;
			cfg_bresp   <= 0;
			cfg_rresp   <= 0;
			cfg_rdata   <= 0;

			cfg_rstate  <= `RD_IDLE;
			cfg_wstate  <= `WR_IDLE;

			cfg_awaddr_buf <= 0;

			ac_cfg        <= 0; 
			ac_irq_mask   <= 0;
			ac_irq_status <= 0;

			ac_i2c_req    <= 0;
			ac_i2c_resp   <= 0;


		end else begin

			//Read Channel

			case(cfg_rstate)
			`RD_IDLE: begin
				cfg_arready <= 1;

				if(cfg_arvalid & cfg_arready) begin
					cfg_arready <= 0;
					cfg_rresp   <= 2'b00; //resp(OKAY)
					cfg_rstate  <= `RD_OUTPUT;
					cfg_rvalid  <= 1;

					case(cfg_araddr[7:0])
					8'h00: 
						cfg_rdata <=  ac_cfg;
					8'h04:
						cfg_rdata <=  ac_irq_mask;
					8'h08:
						cfg_rdata <= ~ac_irq_mask;
					8'h0C:
						cfg_rdata <=  ac_irq_status;
						
					default: begin
						cfg_rresp  <= 2'b10; //Address invalid - resp(SLVERR)
						cfg_rvalid <= 1;
					end

					endcase
				end

			end

			`RD_OUTPUT: begin
				cfg_arready <= 0;

				if(cfg_rvalid & cfg_rready) begin
					cfg_arready <= 1;
					cfg_rstate  <= `RD_IDLE;
					cfg_rvalid  <= 0;
				end
			end

			endcase

			//Write Channel

			case(cfg_wstate)
			`WR_IDLE: begin
				cfg_awready <= 1;

				if(cfg_awvalid & cfg_awready) begin
					cfg_awready <= 0;
					cfg_wready  <= 1;
					cfg_wstate  <= `WR_WAIT;
					cfg_bvalid  <= 0;

					cfg_awaddr_buf <= cfg_awaddr;

				end
			end


			`WR_WAIT: begin
				if(cfg_wready & cfg_wvalid) begin
					cfg_bresp   <= 2'b00; //resp(OKAY)
					cfg_wstate  <= `WR_RESP;
					cfg_wready  <= 0;
					cfg_bvalid  <= 1;

					case(cfg_awaddr_buf[7:0])
					8'h00: begin
						ac_cfg <= cfg_wdata;
					end

					8'h04: begin
						ac_irq_mask <= ac_irq_mask | cfg_wdata;
					end

					8'h08: begin
						ac_irq_mask <= ac_irq_mask & ~cfg_wdata;
					end

					8'h0C: begin
						ac_irq_status <= ac_irq_mask & ~cfg_wdata;
					end

					8'h10: begin
						ac_i2c_req <= cfg_wdata;

						if(cfg_wdata & `I2C_TRANSACTION_START) begin
							cfg_bvalid <= 0;
							cfg_wstate <= `WR_I2C_WAIT;
						end
					end 
						
					default:
						cfg_bresp <= 2'b10; //Address invalid - resp(SLVERR)
					
					endcase
			
				end
			end

			`WR_I2C_WAIT: begin
				
				if(i2c_req_ready & i2c_req_valid) begin
					cfg_bvalid <= 1;
					cfg_wstate <= `WR_RESP;
				end
			end

			`WR_RESP: begin
				if(cfg_bready & cfg_bvalid) begin
					cfg_bvalid  <= 0;
					cfg_wstate  <= `WR_IDLE;
				end
			end

			endcase

		end
	end

endmodule

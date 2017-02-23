`timescale 1ns / 1ps

module i2s_io (
	input  mclk,
	input  bclk,
	input  axi_clk,

	input  reset,

	input  muten_i,
	output reg muten,

	output reg pbdat,
	output reg pblrc,

	output reg recdat,
	output reg reclrc,

	input  [6:0] i2c_addr,
	input        i2c_rw,
	input  [8:0] i2c_wdata,
	input        i2c_req_valid,
	output reg   i2c_req_ready,

	output reg [8:0] i2c_rdata,
	output reg       i2c_ack,
	output reg       i2c_resp_valid,
	input            i2c_resp_ready,

	output  scl,
	input   sda_o,
	output  sda
	);


	wire i2clk;
	reg [4:0] div;

	BUFGCE i2c_div (
		.O(i2clk),
		.CE(div == 0 ? 1 : 0),
		.I(axi_clk)
	);


	integer i;

	reg [23:0] sq_wav [63:0];

	reg [5:0] bit_addr;
	reg [5:0] sample_addr;


	wire sda_o;
	reg  sda_t;
/*
      IOBUF sda_iob (
      	.O(sda_o),
      	.IO(sda),
      	.I(1'b0),
      	.T(sda_t)
      );
*/

	wire scl_o;
	reg  scl_t;
/*
	IOBUF scl_iob (
      	.O(scl_o),
      	.IO(scl),
      	.I(1'b0),
      	.T(scl_t)
      );
*/

	assign scl = scl_t ? 1'b1 : 1'b0;
	assign sda = sda_t ? 1'b1 : 1'b0;

	assign scl_o = scl;

/*	PULLUP sda_r (
		.O(sda)
	);

	PULLUP scl_r (
		.O(scl)
	);
*/
	reg i2c_subclk;

	`define ZYBO_AC_I2C_ADDR 8'b00110100;

	//i2c request info
	reg [7:0] i2c_devaddr;

	//i2c response info
	reg nack;
	reg ack;
	reg i2c_resp_ack;

	reg [1:0] state;
	
	`define STATE_RESET 	0
	`define STATE_CONFIG 	1
	`define STATE_PLAY 	2

	initial begin
		for(i = 0; i < 32; i = i + 1) begin
			sq_wav[i]      <= 24'b100000000000000000000000;
			sq_wav[i + 32] <= 24'b011111111111111111111111;
		end
	end

	always @(posedge axi_clk) begin
		if(reset) begin
			div <= 0;
		end else begin
			div <= div + 1;
		end
	end

	always @(posedge bclk) begin
		if(reset) begin
			state       <= `STATE_RESET;
			bit_addr    <= 0;
			sample_addr <= 0;
			muten       <= 0;

			i2c_devaddr <= `ZYBO_AC_I2C_ADDR;

			pblrc       <= 0;
			pbdat       <= 0;

		end else begin
			case(state) 

			`STATE_RESET: begin
				state <= `STATE_CONFIG;
			end

			`STATE_CONFIG: begin
				if(~muten_i)
					state <= `STATE_PLAY;
			end

			`STATE_PLAY: begin
				muten <= muten_i;

				pbdat <= sq_wav[sample_addr][23 - bit_addr];

				bit_addr <= bit_addr + 1;

				if((bit_addr == 22) & pblrc) begin
					pblrc <= 0;
					sample_addr <= sample_addr + 1;
				end else if(bit_addr == 22) begin
					pblrc <= 1;
				end else if(bit_addr == 23) begin
					bit_addr <= 0;
				end 
			end 

			endcase
		end
	end


	reg [3:0] i2c_state;

	`define STATE_I2C_RESET	0
	`define STATE_I2C_START	1
	`define STATE_I2C_SLAVE	2
	`define STATE_I2C_RADDR	3
	`define STATE_I2C_WADDR	4
	`define STATE_I2C_RDATA	5
	`define STATE_I2C_WDATA	6
	`define STATE_I2C_RESP	7
	`define STATE_I2C_STOP	8

	reg [2:0] i2c_bit;

	always @(posedge i2clk) begin 
		if(reset) begin
			i2c_state <= `STATE_I2C_RESET;
			
			i2c_rdata <= 0;
			i2c_ack   <= 0;
			nack      <= 0;
			ack       <= 0;

			i2c_req_ready  <= 0;
			i2c_resp_ack   <= 0;
			i2c_resp_valid <= 0;

			i2c_bit     <= 7;

			scl_t       <= 1;
			sda_t       <= 1;
			i2c_subclk  <= 1;

		end else begin
			case(i2c_state) 

			`STATE_I2C_RESET: begin
				i2c_state <= `STATE_I2C_START;	
	//			i2c_req_ready <= 1;
				scl_t <= 1;
			end

			//Wait for transaction; send start condition
			`STATE_I2C_START: begin
				i2c_req_ready  <= 1;
				i2c_resp_valid <= 0;

				if(i2c_req_valid & i2c_req_ready) begin
					i2c_req_ready <= 0;
					sda_t <= 0;
					i2c_state <= `STATE_I2C_SLAVE;

					if(scl_t & ~scl_o) begin 
						//Clock driven low by slave
						
						sda_t <= 0;
						i2c_state <= `STATE_I2C_SLAVE;
					end else begin
						//Send start condition
						sda_t <= 0;
						i2c_state <= `STATE_I2C_SLAVE;
					end
				end 
			end

			//Send slave address
			`STATE_I2C_SLAVE: begin
				if(scl_t) begin
					if(i2c_subclk) begin
						i2c_subclk <= 0;
					end else begin
						i2c_subclk <= 1;
						scl_t <= 0;

						if(i2c_bit == 0) begin
							i2c_state <= `STATE_I2C_WADDR;
							i2c_bit   <= 7;
						end
					end
				end else begin
					if(i2c_subclk) begin
						i2c_subclk <= 0;

						sda_t <= (i2c_bit == 0) ? 0 : i2c_devaddr[i2c_bit];
						i2c_bit <= i2c_bit - 1;
					end else begin
						i2c_subclk <= 1;
						scl_t <= 1;

					end
				end
			end

			`STATE_I2C_WADDR: begin
				if(scl_t) begin
					if(i2c_subclk) begin
						i2c_subclk <= 0;
					end else begin
						i2c_subclk <= 1;
						scl_t <= 0;

						if(~(nack | ack)) begin
							if(~sda_o) begin
								ack <= 1;
							end else begin
								nack <= 1;
							end
						end else if(i2c_bit == 0) begin
							nack <= 0;
							ack  <= 0;
							i2c_state <= `STATE_I2C_WDATA;
							i2c_bit   <= 7;
						end
					end
					
				end else begin
					if(i2c_subclk) begin
						i2c_subclk <= 0;

						//Need to check for ACK of previous transfer.
						//Release the sda line and check if the peripheral holds it low on the next cycle.
						if(~(nack | ack)) begin
							sda_t <= 1;
						end else begin
							sda_t <= (i2c_bit == 0) ? 0 : i2c_addr[i2c_bit];
							i2c_bit <= i2c_bit - 1;
						end
					end else begin
						i2c_subclk <= 1;
						scl_t <= 1;
					end
				end
			end

			`STATE_I2C_WDATA: begin
				if(scl_t) begin
					if(i2c_subclk) begin
						i2c_subclk <= 0;
					end else begin
						i2c_subclk <= 1;
						scl_t <= 0;

						if(~(nack | ack)) begin
							if(~sda_o) begin
								ack <= 1;
							end else begin
								nack <= 1;
							end
						end else if(i2c_bit == 0) begin
							nack <= 0;
							ack  <= 0;
							i2c_state <= `STATE_I2C_STOP;
							i2c_bit   <= 7;
						end
					end
					
				end else begin
					if(i2c_subclk) begin
						i2c_subclk <= 0;
						if(~(nack | ack)) begin
							sda_t <= 1;
						end else begin
							sda_t <= i2c_wdata[i2c_bit];
							i2c_bit <= i2c_bit - 1;
						end
					end else begin
						i2c_subclk <= 1;
						scl_t <= 1;
					end
				end
			end

			`STATE_I2C_STOP: begin
				if(scl_t) begin
					if(i2c_subclk) begin
						i2c_subclk <= 0;
					end else begin
						i2c_subclk <= 1;
						scl_t <= 0;

						if(~(nack | ack)) begin
							if(sda_t & ~(sda_o)) begin
								ack <= 1;
							end else begin
								nack <= 1;
							end
						end else if(sda_t) begin
							nack <= 0;
							ack  <= 0;
							scl_t <= 1;
							sda_t <= 0;
							i2c_ack <= ack;
							i2c_state <= `STATE_I2C_RESP;
						end
					end
				end else begin
					if(i2c_subclk) begin
						i2c_subclk <= 0;
					end else begin
						i2c_subclk <= 1;
						scl_t <= 1;

					end
				end
			end

			`STATE_I2C_RESP: begin
				i2c_resp_valid <= 1;
				

				if(i2c_resp_valid & i2c_resp_ready) begin
					i2c_state <= `STATE_I2C_START;
				end
			end

			endcase
		end
	end
	

endmodule

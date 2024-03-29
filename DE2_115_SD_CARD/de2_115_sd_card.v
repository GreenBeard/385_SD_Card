// ============================================================================
// Copyright (c) 2012 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//
//
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// ============================================================================
//
// Major Functions:	DE2_115_Default
//
// ============================================================================
//
// Revision History :
// ============================================================================
//   Ver  :| Author              :| Mod. Date :| Changes Made:
//   V1.1 :| HdHuang             :| 05/12/10  :| Initial Revision
//   V2.0 :| Eko       				:| 05/23/12  :| version 11.1
// ============================================================================

module DE2_115_SD_CARD( 

//////////// CLOCK //////////
input		          			CLOCK_50,
input		          			CLOCK2_50,
input		          			CLOCK3_50,
input		          			ENETCLK_25,

//////////// Sma //////////
input		          			SMA_CLKIN,
output		          		SMA_CLKOUT,

//////////// LED //////////
output		     [8:0]		LEDG,
output		     [17:0]		LEDR,

//////////// KEY //////////
input		     	  [3:0]		KEY,

//////////// SW //////////
input		        [17:0]		SW,

//////////// SEG7 //////////
output		     [6:0]		HEX0,
output		     [6:0]		HEX1,
output		     [6:0]		HEX2,
output		     [6:0]		HEX3,
output		     [6:0]		HEX4,
output		     [6:0]		HEX5,
output		     [6:0]		HEX6,
output		     [6:0]		HEX7,

//////////// LCD //////////
output		          		LCD_BLON,
inout		        [7:0]		LCD_DATA,
output		          		LCD_EN,
output		          		LCD_ON,
output		          		LCD_RS,
output		          		LCD_RW,

//////////// RS232 //////////
output		          		UART_CTS,
input		          			UART_RTS,
input		          			UART_RXD,
output		          		UART_TXD,

//////////// PS2 //////////
inout		          			PS2_CLK,
inout		          			PS2_DAT,
inout		          			PS2_CLK2,
inout		          			PS2_DAT2,

//////////// SDCARD //////////
output		          		SD_CLK,
inout		          			SD_CMD,
inout		        [3:0]		SD_DAT,
input		          			SD_WP_N,

//////////// VGA //////////
output		     [7:0]		VGA_B,
output		          		VGA_BLANK_N,
output		          		VGA_CLK,
output		     [7:0]		VGA_G,
output		          		VGA_HS,
output		     [7:0]		VGA_R,
output		          		VGA_SYNC_N,
output		          		VGA_VS,

//////////// Audio //////////
input		          			AUD_ADCDAT,
inout		          			AUD_ADCLRCK,
inout		          			AUD_BCLK,
output		          		AUD_DACDAT,
inout		          			AUD_DACLRCK,
output		          		AUD_XCK,

//////////// I2C for EEPROM //////////
output		          		EEP_I2C_SCLK,
inout		          			EEP_I2C_SDAT,

//////////// I2C for Audio and Tv-Decode //////////
output		          		I2C_SCLK,
inout		          			I2C_SDAT,

//////////// Ethernet 0 //////////
output		          		ENET0_GTX_CLK,
input		          			ENET0_INT_N,
output		          		ENET0_MDC,
input		          			ENET0_MDIO,
output		          		ENET0_RST_N,
input		          			ENET0_RX_CLK,
input		          			ENET0_RX_COL,
input		          			ENET0_RX_CRS,
input		    	  [3:0]		ENET0_RX_DATA,
input		          			ENET0_RX_DV,
input		          			ENET0_RX_ER,
input		          			ENET0_TX_CLK,
output		     [3:0]		ENET0_TX_DATA,
output		          		ENET0_TX_EN,
output		          		ENET0_TX_ER,
input		          			ENET0_LINK100,

//////////// Ethernet 1 //////////
output		          		ENET1_GTX_CLK,
input		          			ENET1_INT_N,
output		          		ENET1_MDC,
input		          			ENET1_MDIO,
output		          		ENET1_RST_N,
input		          			ENET1_RX_CLK,
input		          			ENET1_RX_COL,
input		          			ENET1_RX_CRS,
input		        [3:0]		ENET1_RX_DATA,
input		          			ENET1_RX_DV,
input		          			ENET1_RX_ER,
input		          			ENET1_TX_CLK,
output		     [3:0]		ENET1_TX_DATA,
output		          		ENET1_TX_EN,
output		          		ENET1_TX_ER,
input		          			ENET1_LINK100,

//////////// TV Decoder 1 //////////
input		          			TD_CLK27,
input		        [7:0]		TD_DATA,
input		          			TD_HS,
output		          		TD_RESET_N,
input		          			TD_VS,


//////////// USB OTG controller //////////
inout            [15:0]    OTG_DATA,
output           [1:0]     OTG_ADDR,
output                     OTG_CS_N,
output                     OTG_WR_N,
output                     OTG_RD_N,
input                      OTG_INT,
output                     OTG_RST_N,

//////////// IR Receiver //////////
input		          			IRDA_RXD,

//////////// SDRAM //////////
output		     [12:0]		DRAM_ADDR,
output		     [1:0]		DRAM_BA,
output		          		DRAM_CAS_N,
output		          		DRAM_CKE,
output		          		DRAM_CLK,
output		          		DRAM_CS_N,
inout		        [31:0]		DRAM_DQ,
output		     [3:0]		DRAM_DQM,
output		          		DRAM_RAS_N,
output		          		DRAM_WE_N,

//////////// SRAM //////////
output		     [19:0]		SRAM_ADDR,
output		          		SRAM_CE_N,
inout		        [15:0]		SRAM_DQ, //Data
output		          		SRAM_LB_N,
output		          		SRAM_OE_N,
output		          		SRAM_UB_N,
output		          		SRAM_WE_N,

//////////// Flash //////////
output		     [22:0]		FL_ADDR,
output		          		FL_CE_N,
inout		        [7:0]		FL_DQ,
output		          		FL_OE_N,
output		          		FL_RST_N,
input		          			FL_RY,
output		          		FL_WE_N,
output		          		FL_WP_N,

//////////// GPIO //////////
inout		        [35:0]		GPIO,

//////////// HSMC (LVDS) //////////
input		          			HSMC_CLKIN_P1,
input		          			HSMC_CLKIN_P2,
input		          			HSMC_CLKIN0,
output		          		HSMC_CLKOUT_P1,
output		          		HSMC_CLKOUT_P2,
output		          		HSMC_CLKOUT0,
inout		        [3:0]		HSMC_D,
input		        [16:0]		HSMC_RX_D_P,
output		     [16:0]		HSMC_TX_D_P,

//////// EXTEND IO //////////
inout		        [6:0]		EX_IO

);



	//=======================================================
	//  REG/WIRE declarations
	//=======================================================
	wire 								HEX0P;
	wire 								HEX1P;
	wire 								HEX2P;
	wire 								HEX3P;
	wire 								HEX4P;
	wire 								HEX5P;
	wire 								HEX6P;
	wire 								HEX7P;


	//=======================================================
	//  Structural coding
	//=======================================================
	wire 								reset_n;

	assign reset_n = 1'b1;
	
	//=======================================================
	//  Handshake IO Wires
	//=======================================================
	wire [15:0] to_hw_port;
	wire [1:0]  to_sw_sig, to_hw_sig;

	DE2_115_SD_CARD_NIOS DE2_115_qsys_inst(
							  
								  // 1) global signals:
								  .clk_50_clk_in_clk(CLOCK_50),
								  .reset_reset_n(reset_n),
								  .altpll_c3_clk(VGA_CLK),
								  .altpll_c1_clk(DRAM_CLK),
															

								 // the_audio
	//                       .audio_conduit_end_ADCDAT(AUD_ADCDAT),
	//                       .audio_conduit_end_ADCLRC(AUD_ADCLRCK),
	//                       .audio_conduit_end_BCLK(AUD_BCLK),
	//                       .audio_conduit_end_DACDAT(AUD_DACDAT),
	//                       .audio_conduit_end_DACLRC(AUD_DACLRCK),
	//                       .audio_conduit_end_XCK (AUD_XCK),

								 // the_eep_i2c_scl
								  .epp_i2c_scl_external_connection_export(EEP_I2C_SCLK),

								 // the_eep_i2c_sda
								  .epp_i2c_sda_external_connection_export(EEP_I2C_SDAT),
								  
								 // the_i2c_scl
								  .i2c_scl_external_connection_export(I2C_SCLK),

								 // the_i2c_sda
								  .i2c_sda_external_connection_export(I2C_SDAT),

								 // the_key
								  .key_external_connection_export(KEY),
								 
								 // the_ir
								  .ir_external_connection_export(IRDA_RXD),

								 // the_lcd
								  .lcd_external_E(LCD_EN),
								  .lcd_external_RS(LCD_RS),
								  .lcd_external_RW(LCD_RW),
								  .lcd_external_data(LCD_DATA),

								 // the_ledg
								  //.ledg_external_connection_export(LEDG),

								 // the_ledr
								  .ledr_external_connection_export(LEDR),

								 // the_rs232
								  .rs232_external_connection_cts_n(UART_CTS),
								  .rs232_external_connection_rts_n(UART_RTS),
								  .rs232_external_connection_rxd(UART_RXD),
								  .rs232_external_connection_txd(UART_TXD),
								  
								 // the_seg7
//								  .seg7_conduit_end_export({
//											HEX7P, HEX7, HEX6P, HEX6,
//											HEX5P, HEX5, HEX4P, HEX4, 
//											HEX3P, HEX3, HEX2P, HEX2,
//											HEX1P, HEX1, HEX0P, HEX0}),

								 // the_sma_in
								  .sma_in_external_connection_export(SMA_CLKIN),

								 // the_sma_out
								  .sma_out_external_connection_export(SMA_CLKOUT),
	 
								 // the_sw
									.sw_external_connection_export(SW),

								 // the_tri_state_bridge_flash_avalon_slave
								  .tri_state_bridge_flash_bridge_0_out_address_to_the_cfi_flash (FL_ADDR),
								  .tri_state_bridge_flash_bridge_0_out_read_n_to_the_cfi_flash(FL_OE_N),
								  .tri_state_bridge_flash_bridge_0_out_select_n_to_the_cfi_flash(FL_CE_N),
								  .tri_state_bridge_flash_bridge_0_out_tri_state_bridge_flash_data(FL_DQ),
								  .tri_state_bridge_flash_bridge_0_out_write_n_to_the_cfi_flash(FL_WE_N),
								  
								 // sdcard
								  .sd_clk_external_connection_export(SD_CLK),
								  .sd_cmd_external_connection_export(SD_CMD),
								  .sd_dat_external_connection_export(SD_DAT),
								  .sd_wp_n_external_connection_export (SD_WP_N),
								  
								 // Handshake IO
								  .to_hw_port_export(to_hw_port),
								  .to_hw_sig_export(to_hw_sig),
								  .to_sw_sig_export(to_sw_sig),
								  
								 // SDRAM Controller
								  .sdram_controller_addr(DRAM_ADDR),                                         //                    sdram_controller.addr
								  .sdram_controller_ba(DRAM_BA),                                             //                                    .ba
								  .sdram_controller_cas_n(DRAM_CAS_N),                                       //                                    .cas_n
								  .sdram_controller_cke(DRAM_CKE),                                           //                                    .cke
								  .sdram_controller_cs_n(DRAM_CS_N),                                         //                                    .cs_n
								  .sdram_controller_dq(DRAM_DQ),                                             //                                    .dq
								  .sdram_controller_dqm(DRAM_DQM),                                           //                                    .dqm
								  .sdram_controller_ras_n(DRAM_RAS_N),                                       //                                    .ras_n
								  .sdram_controller_we_n(DRAM_WE_N)                                          //                                    .we_n
							  );
							  
	
	
	io_module io_module0 (.clk(CLOCK_50),
								 .reset_n(KEY[3]),
								 .to_sw_sig(to_sw_sig),
								 .to_hw_sig(to_hw_sig),
								 .to_hw_port(to_hw_port),
								 .Data(SRAM_DQ),
								 .ADDR(SRAM_ADDR),
								 .OE(SRAM_OE_N), 
								 .WE(SRAM_WE_N),
								 .CE(SRAM_CE_N), 
								 .UB(SRAM_UB_N), 
								 .LB(SRAM_LB_N)
					);
					
//	LCD_TEST lcd_test_1 (.iCLK(CLOCK_50),
//							.iRST_N(KEY[1]),
//							.LCD_DATA(LCD_DATA),
//							.LCD_RW(LCD_RW),
//							.LCD_EN(LCD_EN),
//							.LCD_RS(LCD_RS)
//					);
					
	assign LEDG = {5'b10000, to_sw_sig, to_hw_sig};
					
	HexDriver Hex0 (.In0(to_hw_port[15:12]), .Out0(HEX0));
	HexDriver Hex1 (.In0(to_hw_port[11:8]),  .Out0(HEX1));
	HexDriver Hex2 (.In0(to_hw_port[7:4]),   .Out0(HEX2));
	HexDriver Hex3 (.In0(to_hw_port[3:0]),   .Out0(HEX3));
	
	// Flash Config
	assign FL_RST_N = reset_n;
	assign FL_WP_N = 1'b1;

	///////////////////////////////////////////
	// LCD config
	assign LCD_BLON = 0; // not supported
	assign LCD_ON = 1'b1; // alwasy on

	wire 	 io_dir;
	wire 	 action;
	assign io_dir = KEY[0] & action;

	///////////////////////////////////////////
	// GPIO
	assign GPIO[17:0] = (io_dir)?GPIO[35:18]:18'hz;
	assign GPIO[35:18] = (io_dir)?GPIO[17:0]:18'hz;

	///////////////////////////////////////////
	// HSMC
	assign HSMC_D[1:0] = (io_dir)?HSMC_D[3:2]:2'hz;
	assign HSMC_D[3:2] = (io_dir)?HSMC_D[1:0]:2'hz;

	assign HSMC_TX_D_P = HSMC_RX_D_P;
	assign HSMC_CLKOUT_P1 = HSMC_CLKIN_P1;
	assign HSMC_CLKOUT_P2 = HSMC_CLKIN_P2;
	assign HSMC_CLKOUT0 = HSMC_CLKIN0;

	///////////////////////////////////////////
	// NET
	assign ENET0_GTX_CLK = ENET0_INT_N;
	assign ENET0_MDC = ENET0_RX_COL;
	assign ENET0_RST_N = ENET0_RX_CRS;
	assign ENET0_TX_DATA = ENET0_RX_DATA;
	assign ENET0_TX_EN = ENET0_RX_ER;
	assign ENET0_TX_ER = ENET0_TX_CLK;

	assign ENET1_GTX_CLK = ENET1_INT_N;
	assign ENET1_MDC = ENET1_RX_COL;
	assign ENET1_RST_N = ENET1_RX_CRS;
	assign ENET1_TX_DATA = ENET1_RX_DATA;
	assign ENET1_TX_EN = ENET1_RX_ER;
	assign ENET1_TX_ER = ENET1_TX_CLK;

	///////////////////////////////////////////
	// TV
	assign TD_RESET_N = TD_VS;
	assign action = FL_RY & TD_HS & TD_CLK27 & (TD_DATA == 8'hff);

	///////////////////////////////////////////
	// ps2
	assign PS2_CLK = PS2_DAT;
	assign PS2_CLK2 = PS2_DAT2;
	
	

endmodule

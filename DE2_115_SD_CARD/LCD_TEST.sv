module	LCD_TEST (	//	Host Side
							input			iCLK,
							input       iRST_N,
							//	LCD Side
							output	[7:0]	LCD_DATA,
							output			LCD_RW,
							output         LCD_EN,
							output         LCD_RS );

//	Internal Wires/Registers
reg	[5:0]	LUT_INDEX;
reg	[8:0]	LUT_DATA;
reg	[5:0]	mLCD_ST;
reg	[17:0]	mDLY;
reg			mLCD_Start;
reg	[7:0]	mLCD_DATA;
reg			mLCD_RS;
wire		mLCD_Done;

parameter	LCD_INTIAL	=	0;
parameter	LCD_LINE1	=	5;
parameter	LCD_CH_LINE	=	LCD_LINE1+16;
parameter	LCD_LINE2	=	LCD_LINE1+16+1;
parameter	LUT_SIZE	=	LCD_LINE1+32+1;

always@(posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		LUT_INDEX	<=	0;
		mLCD_ST		<=	0;
		mDLY		<=	0;
		mLCD_Start	<=	0;
		mLCD_DATA	<=	0;
		mLCD_RS		<=	0;
	end
	else
	begin
		if(LUT_INDEX<LUT_SIZE)
		begin
			case(mLCD_ST)
			0:	begin
					mLCD_DATA	<=	LUT_DATA[7:0];
					mLCD_RS		<=	LUT_DATA[8];
					mLCD_Start	<=	1;
					mLCD_ST		<=	1;
				end
			1:	begin
					if(mLCD_Done)
					begin
						mLCD_Start	<=	0;
						mLCD_ST		<=	2;					
					end
				end
			2:	begin
					if(mDLY<18'h3FFFE)
					mDLY	<=	mDLY+1;
					else
					begin
						mDLY	<=	0;
						mLCD_ST	<=	3;
					end
				end
			3:	begin
					LUT_INDEX	<=	LUT_INDEX+1;
					mLCD_ST	<=	0;
				end
			endcase
		end
	end
end

always
begin
	case(LUT_INDEX)
	//	Initial
	LCD_INTIAL+0:	LUT_DATA	<=	9'h038; // Function Set (8-bit data length, 2-line, font: 5x8 dots)
	LCD_INTIAL+1:	LUT_DATA	<=	9'h00C; // Display Control (Display: on, Cursor: off, Blinking: off)
	LCD_INTIAL+2:	LUT_DATA	<=	9'h001; // Clear Display
	LCD_INTIAL+3:	LUT_DATA	<=	9'h006; // Entry Mode (Cursor Movement: Incremental, Display Shift: off)
	LCD_INTIAL+4:	LUT_DATA	<=	9'h080; // Set DDRAM Address (0x00: Beginning of First Line)
	//	Line 1
	LCD_LINE1+0:	LUT_DATA	<=	9'h120;	 //	[Space]
	LCD_LINE1+1:	LUT_DATA	<=	9'h157;	 // W
	LCD_LINE1+2:	LUT_DATA	<=	9'h165;  // e
	LCD_LINE1+3:	LUT_DATA	<=	9'h16C;  // l
	LCD_LINE1+4:	LUT_DATA	<=	9'h163;  // c
	LCD_LINE1+5:	LUT_DATA	<=	9'h16F;  // o
	LCD_LINE1+6:	LUT_DATA	<=	9'h16D;  // m
	LCD_LINE1+7:	LUT_DATA	<=	9'h165;  // e
	LCD_LINE1+8:	LUT_DATA	<=	9'h120;  // [Space]
	LCD_LINE1+9:	LUT_DATA	<=	9'h174;  // t
	LCD_LINE1+10:	LUT_DATA	<=	9'h16F;  // o
	LCD_LINE1+11:	LUT_DATA	<=	9'h120;  // [Space]
	LCD_LINE1+12:	LUT_DATA	<=	9'h174;  // t
	LCD_LINE1+13:	LUT_DATA	<=	9'h168;  // h
	LCD_LINE1+14:	LUT_DATA	<=	9'h165;  // e
	LCD_LINE1+15:	LUT_DATA	<=	9'h120;  // [Space]
	//	Change Line
	LCD_CH_LINE:	LUT_DATA	<=	9'h0C0;  // Set DDRAM Address (0x40: Beginning of Second Line)
	//	Line 2
	LCD_LINE2+0:	LUT_DATA	<=	9'h120;	 //	[Space]Altera DE2-70
	LCD_LINE2+1:	LUT_DATA	<=	9'h141;	 // A
	LCD_LINE2+2:	LUT_DATA	<=	9'h16C;  // l
	LCD_LINE2+3:	LUT_DATA	<=	9'h174;  // t
	LCD_LINE2+4:	LUT_DATA	<=	9'h165;  // e
	LCD_LINE2+5:	LUT_DATA	<=	9'h172;  // r
	LCD_LINE2+6:	LUT_DATA	<=	9'h161;  // a
	LCD_LINE2+7:	LUT_DATA	<=	9'h120;  // [Space]
	LCD_LINE2+8:	LUT_DATA	<=	9'h144;  // D
	LCD_LINE2+9:	LUT_DATA	<=	9'h145;  // E
	LCD_LINE2+10:	LUT_DATA	<=	9'h132;  // 2
	LCD_LINE2+11:	LUT_DATA	<=	9'h1B0;  // -
	LCD_LINE2+12:	LUT_DATA	<=	9'h131;  // 1
	LCD_LINE2+13:	LUT_DATA	<=	9'h131;  // 1
	LCD_LINE2+14:	LUT_DATA	<=	9'h135;  // 5
	LCD_LINE2+15:	LUT_DATA	<=	9'h120;  // [Space]
	
	default:		LUT_DATA	<=	9'h120;
	endcase
end

LCD_Controller 		u0	(	//	Host Side
							.iDATA(mLCD_DATA),
							.iRS(mLCD_RS),
							.iStart(mLCD_Start),
							.oDone(mLCD_Done),
							.iCLK(iCLK),
							.iRST_N(iRST_N),
							//	LCD Interface
							.LCD_DATA(LCD_DATA),
							.LCD_RW(LCD_RW),
							.LCD_EN(LCD_EN),
							.LCD_RS(LCD_RS)	);

endmodule
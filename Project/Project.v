module Project(cin, oneSec, tenSec, reset, pause, counterOrClockControl, increaseOrDecrease, oneMin, tenMin, oneCounter, tenCounter, setOrStartClock, setCounter);

input cin, reset, pause, increaseOrDecrease, counterOrClockControl, setOrStartClock;
input [5:0] setCounter;
//SWITCH DOWN = 0;
//counterOrClockControl - SW9
//increaseOrDecrease - SW8
//setOrStartClock - SW7
//pause = top button
//reset = bottom button

 
reg finiteState = 0;
reg toggle;
reg ignore = 0;
reg[1:0]setter = 1'd0;	
reg[31:0] count;
reg[5:0] secondsClock = 6'd0;
reg[5:0] minutesClock = 6'd0;
reg[6:0] lapCounter = 7'd0;

output reg [6:0] tenMin;
output reg [6:0] oneMin;
output reg [6:0] tenSec;
output reg [6:0] oneSec;
output reg [6:0] tenCounter;
output reg [6:0] oneCounter;

parameter D = 32'd25000000;


always @(posedge cin)
begin
		if(~setOrStartClock)begin
			if(pause == 1'b0) begin						
				if (ignore == 0) begin
					setter <= setter + 1'd1;
					ignore <= 1;
				end 
				else if (ignore == 3)begin
					ignore <= 0;
				end
			end
		end
		else begin
			if(~counterOrClockControl)begin			
				if(pause == 1'b0) begin						
					if (ignore == 0) begin
						finiteState <= ~finiteState;
						ignore <= 1;
					end 
					else if (ignore == 3)begin
						ignore <= 0;
					end
				end

				if (reset == 1'b0) begin
				//secondsClock <= secondsClockSelector ? 5'd30 : 5'd24;
					secondsClock <= 0;
					minutesClock <= 0;
					finiteState <= 0;
				end 
			end
			else begin				
				if(pause == 1'b0) begin						
					if (ignore == 0) begin
						lapCounter <= lapCounter + 7'd1;
						ignore <= 1;
					end 
					else if (ignore == 3)begin
						ignore <= 0;
					end
				end

				if (reset == 1'b0) begin
				//secondsClock <= secondsClockSelector ? 5'd30 : 5'd24;
					lapCounter <= 7'd0;
				end 
			end
		end
		

		count <= count + 32'd1;
		
      if (count >= (D - 32'd1)) begin
         count <= 32'd0;
			ignore <= ignore + 1;
         toggle <= ~toggle;			
			if(~setOrStartClock)begin //////////////////////////////////////////////////////////////
				if(setter == 0)begin
					minutesClock <= 6'd0;
					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						secondsClock <= 0;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5])												
						secondsClock <= 1;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5])												
						secondsClock <= 2;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5])												
						secondsClock <= 3;
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						secondsClock <= 4;						
					if(setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						secondsClock <= 5;
					if(~setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						secondsClock <= 6;	
					if(setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						secondsClock <= 7;
					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						secondsClock <= 8;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						secondsClock <= 9;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						secondsClock <= 10;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						secondsClock <= 11;	
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						secondsClock <= 12;
					if(setCounter[0] && ~setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						secondsClock <= 13;
					if(~setCounter[0] && setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						secondsClock <= 14;
					if(setCounter[0] && setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						secondsClock <= 15;
						
					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5]) 
						secondsClock <= 16;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5])												
						secondsClock <= 17;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5])												
						secondsClock <= 18;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5])												
						secondsClock <= 19;
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5]) 
						secondsClock <= 20;						
					if(setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5]) 
						secondsClock <= 21;
					if(~setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5]) 
						secondsClock <= 22;	
					if(setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5]) 
						secondsClock <= 23;
					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						secondsClock <= 24;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						secondsClock <= 25;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						secondsClock <= 26;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						secondsClock <= 27;	
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						secondsClock <= 28;
					if(setCounter[0] && ~setCounter[1] && setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						secondsClock <= 29;
					if(~setCounter[0] && setCounter[1] && setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						secondsClock <= 30;
					if(setCounter[0] && setCounter[1] && setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						secondsClock <= 31;

					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5]) 
						secondsClock <= 31;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5])												
						secondsClock <= 32;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5])												
						secondsClock <= 33;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5])												
						secondsClock <= 34;
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5]) 
						secondsClock <= 35;						
					if(setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5]) 
						secondsClock <= 36;
					if(~setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5]) 
						secondsClock <= 37;	
					if(setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5]) 
						secondsClock <= 38;
					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						secondsClock <= 39;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						secondsClock <= 40;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						secondsClock <= 41;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						secondsClock <= 42;	
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						secondsClock <= 43;
					if(setCounter[0] && ~setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						secondsClock <= 44;
					if(~setCounter[0] && setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						secondsClock <= 45;
					if(setCounter[0] && setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						secondsClock <= 46;
						
					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5]) 
						secondsClock <= 47;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5])												
						secondsClock <= 48;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5])												
						secondsClock <= 49;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5])												
						secondsClock <= 50;
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5]) 
						secondsClock <= 51;						
					if(setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5]) 
						secondsClock <= 52;
					if(~setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5]) 
						secondsClock <= 53;	
					if(setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5]) 
						secondsClock <= 54;
					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && setCounter[5]) 
						secondsClock <= 55;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && setCounter[5]) 
						secondsClock <= 56;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && setCounter[5]) 
						secondsClock <= 57;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && setCounter[5]) 
						secondsClock <= 58;	
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && setCounter[3] && setCounter[4] && setCounter[5]) 
						secondsClock <= 59;						
				end
				
				else if(setter == 1'd1) begin
					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						minutesClock <= 0;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5])												
						minutesClock <= 1;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5])												
						minutesClock <= 2;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5])												
						minutesClock <= 3;
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						minutesClock <= 4;						
					if(setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						minutesClock <= 5;
					if(~setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						minutesClock <= 6;	
					if(setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						minutesClock <= 7;
					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						minutesClock <= 8;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						minutesClock <= 9;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						minutesClock <= 10;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						minutesClock <= 11;	
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						minutesClock <= 12;
					if(setCounter[0] && ~setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						minutesClock <= 13;
					if(~setCounter[0] && setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						minutesClock <= 14;
					if(setCounter[0] && setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && ~setCounter[5]) 
						minutesClock <= 15;
						
					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5]) 
						minutesClock <= 16;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5])												
						minutesClock <= 17;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5])												
						minutesClock <= 18;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5])												
						minutesClock <= 19;
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5]) 
						minutesClock <= 20;						
					if(setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5]) 
						minutesClock <= 21;
					if(~setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5]) 
						minutesClock <= 22;	
					if(setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && ~setCounter[5]) 
						minutesClock <= 23;
					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						minutesClock <= 24;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						minutesClock <= 25;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						minutesClock <= 26;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						minutesClock <= 27;	
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						minutesClock <= 28;
					if(setCounter[0] && ~setCounter[1] && setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						minutesClock <= 29;
					if(~setCounter[0] && setCounter[1] && setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						minutesClock <= 30;
					if(setCounter[0] && setCounter[1] && setCounter[2] && setCounter[3] && setCounter[4] && ~setCounter[5]) 
						minutesClock <= 31;

					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5]) 
						minutesClock <= 31;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5])												
						minutesClock <= 32;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5])												
						minutesClock <= 33;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5])												
						minutesClock <= 34;
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5]) 
						minutesClock <= 35;						
					if(setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5]) 
						minutesClock <= 36;
					if(~setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5]) 
						minutesClock <= 37;	
					if(setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && ~setCounter[4] && setCounter[5]) 
						minutesClock <= 38;
					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						minutesClock <= 39;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						minutesClock <= 40;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						minutesClock <= 41;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						minutesClock <= 42;	
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						minutesClock <= 43;
					if(setCounter[0] && ~setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						minutesClock <= 44;
					if(~setCounter[0] && setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						minutesClock <= 45;
					if(setCounter[0] && setCounter[1] && setCounter[2] && setCounter[3] && ~setCounter[4] && setCounter[5]) 
						minutesClock <= 46;
						
					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5]) 
						minutesClock <= 47;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5])												
						minutesClock <= 48;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5])												
						minutesClock <= 49;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5])												
						minutesClock <= 50;
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5]) 
						minutesClock <= 51;						
					if(setCounter[0] && ~setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5]) 
						minutesClock <= 52;
					if(~setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5]) 
						minutesClock <= 53;	
					if(setCounter[0] && setCounter[1] && setCounter[2] && ~setCounter[3] && setCounter[4] && setCounter[5]) 
						minutesClock <= 54;
					if(~setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && setCounter[5]) 
						minutesClock <= 55;
					if(setCounter[0] && ~setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && setCounter[5]) 
						minutesClock <= 56;
					if(~setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && setCounter[5]) 
						minutesClock <= 57;
					if(setCounter[0] && setCounter[1] && ~setCounter[2] && setCounter[3] && setCounter[4] && setCounter[5]) 
						minutesClock <= 58;	
					if(~setCounter[0] && ~setCounter[1] && setCounter[2] && setCounter[3] && setCounter[4] && setCounter[5]) 
						minutesClock <= 59;
				end
			end
			else begin
				setter <= 1'd0;
				if (toggle && ~finiteState && increaseOrDecrease) begin
					if(secondsClock == 6'd0 && minutesClock > 6'd0)begin
						secondsClock <= 6'd59;
						minutesClock <= minutesClock - 6'd1;
					end
					else if(secondsClock > 6'd0)begin
						secondsClock <= secondsClock - 6'd1;	
					end
				end
				else if(toggle && ~finiteState && ~increaseOrDecrease) begin
					secondsClock <= secondsClock + 6'd1;
				end
			end
      end
		
			if(secondsClock > 6'd59)begin
				secondsClock <= 6'd0;
				minutesClock <= minutesClock + 6'd1;
			end
			
			if(minutesClock > 6'd59)begin
				minutesClock <= 6'd0;
			end

			case (lapCounter / 10) 
				7'd1: tenCounter <= 7'b1111001;
				7'd2: tenCounter <= 7'b0100100;
				7'd3: tenCounter <= 7'b0110000;
				7'd4: tenCounter <= 7'b0011001;
				7'd5: tenCounter <= 7'b0010010;
				7'd6: tenCounter <= 7'b0000010;
				7'd7: tenCounter <= 7'b1111000;
				7'd8: tenCounter <= 7'b0000000;
				7'd9: tenCounter <= 7'b0011000;
				default: tenCounter <= 7'b1000000;
			endcase	
			
			case (lapCounter % 10)
				7'd1: oneCounter <= 7'b1111001;
				7'd2: oneCounter <= 7'b0100100;
				7'd3: oneCounter <= 7'b0110000;
				7'd4: oneCounter <= 7'b0011001;
				7'd5: oneCounter <= 7'b0010010;
				7'd6: oneCounter <= 7'b0000010;
				7'd7: oneCounter <= 7'b1111000;
				7'd8: oneCounter <= 7'b0000000;
				7'd9: oneCounter <= 7'b0011000;
				default: oneCounter <= 7'b1000000;
			endcase
			
			case (minutesClock / 10) 
				5'd1: tenMin <= 7'b1111001;
				5'd2: tenMin <= 7'b0100100;
				5'd3: tenMin <= 7'b0110000;
				5'd4: tenMin <= 7'b0011001;
				5'd5: tenMin <= 7'b0010010;
				default: tenMin <= 7'b1000000; //sets oneSec to 0
			endcase	
			
			case (minutesClock % 10)
				5'd1: oneMin <= 7'b1111001;
				5'd2: oneMin <= 7'b0100100;
				5'd3: oneMin <= 7'b0110000;
				5'd4: oneMin <= 7'b0011001;
				5'd5: oneMin <= 7'b0010010;
				5'd6: oneMin <= 7'b0000010;
				5'd7: oneMin <= 7'b1111000;
				5'd8: oneMin <= 7'b0000000;
				5'd9: oneMin <= 7'b0011000;
				default: oneMin <= 7'b1000000; //sets oneSec to 0
			endcase
			
			case (secondsClock / 10) 
				5'd1: tenSec <= 7'b1111001;
				5'd2: tenSec <= 7'b0100100;
				5'd3: tenSec <= 7'b0110000;
				5'd4: tenSec <= 7'b0011001;
				5'd5: tenSec <= 7'b0010010;
				default: tenSec <= 7'b1000000; //sets oneSec to 0
			endcase	
						
			case (secondsClock % 10)
				5'd1: oneSec <= 7'b1111001;
				5'd2: oneSec <= 7'b0100100;
				5'd3: oneSec <= 7'b0110000;
				5'd4: oneSec <= 7'b0011001;
				5'd5: oneSec <= 7'b0010010;
				5'd6: oneSec <= 7'b0000010;
				5'd7: oneSec <= 7'b1111000;
				5'd8: oneSec <= 7'b0000000;
				5'd9: oneSec <= 7'b0011000;
				default: oneSec <= 7'b1000000; //sets oneSec to 0
			endcase	
			
			
	
end



endmodule

//			if ((secondsClock > 6'd0 || minutesClock > 6'd0) && toggle && ~finiteState && increaseOrDecrease) begin
//				secondsClock <= secondsClock - 6'd1;	
//			end
//			else if((secondsClock > 6'd0 || minutesClock > 6'd0) && toggle && ~finiteState && ~increaseOrDecrease) begin
//				secondsClock <= secondsClock + 6'd1;
//			end

			if(switch)begin
				D <= 32'd25000000;
			end
			else begin
				D <= D / 2;
			end
			
			case (currentSecond)
				1: led <= 7'b01111111;
				2: led <= 7'b00111111;
				3: led <= 7'b00011111;
				4: led <= 7'b00001111;
				5: led <= 7'b00000111;
				6: led <= 7'b00000011;
				7: led <= 7'b00000001;
				default: led <= 7'b1111111;
			endcase
			
			currentSecond <= currentSecond + 1;
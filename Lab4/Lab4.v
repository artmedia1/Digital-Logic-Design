module Lab4(cin, oneSec, tenSec, reset, pause, shotClockSelector);

input cin, reset, pause, shotClockSelector;

reg finiteState = 0;
reg toggle;
reg[31:0] count;
reg[4:0] shotClock = 5'd24;
output reg [6:0] tenSec;
output reg [6:0] oneSec;
parameter D = 32'd25000000;


always @(posedge cin)
begin
					
		if(pause == 1'b0) begin
			finiteState <= ~finiteState;
		end

		if (reset == 1'b0) begin
			shotClock <= shotClockSelector ? 5'd30 : 5'd24;
			finiteState <= 0;
		end 

		count <= count + 32'd1;
		
      if (count >= (D - 32'd1)) begin
         count <= 32'd0;
         toggle <= ~toggle;			
			
			if (shotClock > 5'd0 && toggle && ~finiteState) begin
				shotClock <= shotClock + 5'd1;	
			end
			
      end
		 
		case (shotClock / 10) 
			5'd1: tenSec <= 7'b1111001;
			5'd2: tenSec <= 7'b0100100;
			5'd3: tenSec <= 7'b0110000;
			5'd4: tenSec <= 7'b0011001;
			5'd5: tenSec <= 7'b0010010;
			5'd6: tenSec <= 7'b0000010;
			5'd7: tenSec <= 7'b1111000;
			5'd8: tenSec <= 7'b0000000;
			5'd9: tenSec <= 7'b0011000;
			default: oneSec <= 7'b1000000; //sets oneSec to 0
		endcase	
					
		case (shotClock % 10)
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

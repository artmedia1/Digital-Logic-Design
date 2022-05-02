module security(inBus, Lock, clk);

// b3 = inBus[3], b2 = inBus[2], b1 = inBus[1], clear = inBus[0]
input[  :0] inBus;
input clk;
output reg Lock = 1'b1;

reg[1:0] state = 2'b00;

always @(posedge clk) begin

    if(state == 2'b00)begin
        case(inBus)
            4'b1000 : begin
                state <= 2'b01;
                Lock <= 1'b1;
            end
            default : begin
                state <= 2'b00;
                Lock <= 1'b1;
            end
        endcase
    end

    else if(state == 2'b01)begin
        case(inBus)
            4'b0000 : begin
                state <= 2'b01;
                Lock <= 1'b1;
            end
            4'b0010 : begin
                state <= 2'b10;
                Lock <= 1'b1;
            end
            default : begin
                state <= 2'b00;
                Lock <= 1'b1;
            end
        endcase
    end

    else if(state == 2'b10)begin
        case(inBus)
            4'b0000 : begin
                state <= 2'b01;
                Lock <= 1'b1;
            end
            4'b0100 : begin
                state <= 2'b11;
                Lock <= 1'b0;
            end
            default : begin
                state <= 2'b00;
                Lock <= 1'b1;
            end
        endcase
    end 

    else if(inBus[0] == 1)begin
        state <= 2'b00;
        Lock <= 1'b1;
    end

    else begin
        state <= 2'b11;
        Lock <= 1'b0;
    end
end

endmodule
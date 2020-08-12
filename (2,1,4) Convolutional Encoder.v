
// Code your design here
module convolutionencoder(in,out,reset,clk);
  
	input in,reset,clk;
	output reg[1:0] out;
  	reg [2:0] state;
	parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110,s7=3'b111;
  
	always@(posedge clk,posedge reset)
	begin
		if(reset)
		begin
			state<=s0;
			out<=00;
		end
		else
		begin
			case(state)
			s0:begin
				if(in==0)
                begin
					out<=2'b00;
					state<=s0;
				end
				else begin
					out<=2'b11;
					state<=s4;
				end
			end
			s1:begin
				if(in==0) 
                begin
					out<=2'b11;
					state<=s0;
				end
				else begin
					out<=2'b00;
					state<=s4;
				end
			end
			s2:begin
				if(in==0) begin
					out<=2'b10;
					state<=s1;
				end
				else begin
					out<=2'b01;
					state<=s5;
				end
			end
			s3:begin
				if(in==0) begin
					out<=2'b01;
					state<=s1;
				end
				else begin
					out<=2'b10;
					state<=s5;
				end
			end
            s4:begin
				if(in==0)
                begin
					out<=2'b11;
					state<=s2;
				end
				else begin
					out<=2'b00;
					state<=s6;
				end
			end
			s5:begin
				if(in==0) 
                begin
					out<=2'b00;
					state<=s2;
				end
				else begin
					out<=2'b11;
					state<=s6;
				end
			end
			s6:begin
				if(in==0) begin
					out<=2'b01;
					state<=s3;
				end
				else begin
					out<=2'b10;
					state<=s7;
				end
			end
			s7:begin
				if(in==0) begin
					out<=2'b10;
					state<=s3;
				end
				else begin
					out<=2'b01;
					state<=s7;
				end
			end
			endcase
		end
	end
endmodule 


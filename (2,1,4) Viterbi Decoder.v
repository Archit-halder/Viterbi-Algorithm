// Code your design here
// Code your design here

module veterbi214finallast(b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,co,ci,clock);
input b1,b2,b3,b4,b5,b6,b7,b8,b9,b10;
input clock;

reg in0,in1;
reg [1:0]op0,op1;
reg [1:0]in00,in01,in02,in03;
reg [3:0]op00,op01,op02,op03;
reg [2:0]in000,in001,in002,in003,in004,in005,in006,in007;
reg [5:0]op000,op001,op002,op003,op004,op005,op006,op007;
reg [3:0]in0000,in0001,in0002,in0003,in0004,in0005,in0006,in0007;
reg [7:0]op0000,op0001,op0002,op0003,op0004,op0005,op0006,op0007;
reg [4:0]in00000,in00001,in00002,in00003,in00004,in00005,in00006,in00007;
reg [9:0]op00000,op00001,op00002,op00003,op00004,op00005,op00006,op00007;

reg [2:0]hsi0,hsi1;
reg [2:0]hsii0,hsii1,hsii2,hsii3;
reg [2:0]hsiii0,hsiii1,hsiii2,hsiii3,hsiii4,hsiii5,hsiii6,hsiii7;
reg [2:0]hsiv0,hsiv1,hsiv2,hsiv3,hsiv4,hsiv5,hsiv6,hsiv7,hsiv8,hsiv9,hsiv10,hsiv11,hsiv12,hsiv13,hsiv14,hsiv15;
reg [2:0]hsv0,hsv1,hsv2,hsv3,hsv4,hsv5,hsv6,hsv7,hsv8,hsv9,hsv10,hsv11,hsv12,hsv13,hsv14,hsv15;
reg [2:0]hx0,hx1,hx2,hx3,hx4,hx5,hx6,hx7;
reg [2:0]hxx0,hxx1,hxx2,hxx3,hxx4,hxx5,hxx6,hxx7;
reg [2:0]h04,h14,h24,h34,h44,h54,h64,h74;
reg [2:0]h05,h15,h25,h35,h45,h55,h65,h75;

//reg [2:0]hd14,hd24,hd34,hd44,hd54,hd64,hd74,hd84,hx04,hx14,hx24,hx34;
//reg [2:0]hd15,hd25,hd35,hd45,hd55,hd65,hd75,hd85,hx05,hx15,hx25,hx35;

  output reg [9:0] co;
  output reg [4:0] ci;

always@(posedge clock)
        begin	
	//stage1	
	hsi0<=(0^b1)+(0^b2);
	hsi1<=(1^b1)+(1^b2);
	in0<=1'b0;
	op0<=2'b00;
	op1<=2'b11;
	in1<=1'b1;

	//stage2
	hsii0<=hsi0+(0^b3)+(0^b4);
	in00<={in0,1'b0};
	op00<={op0,2'b00};

        hsii1<=hsi0+(1^b3)+(1^b4);
	in01<={in0,1'b1};
	op01<={op0,2'b11};

	hsii2<=hsi1+(1^b3)+(1^b4);
	in02<={in1,1'b0};
	op02<={op1,2'b11};

	hsii3<=hsi1+(0^b3)+(0^b4);
	in03<={in1,1'b1};
	op03<={op1,2'b00};
	
	
	
	//stage3
	hsiii0<=hsii0+(0^b5)+(0^b6);
	in000<={in00,1'b0};
	op000<={op00,2'b00};

	hsiii1<=hsii2+(1^b5)+(0^b6);
	in001<={in02,1'b0};
	op001<={op02,2'b10};

	hsiii2<=hsii1+(1^b5)+(1^b6);
	in002<={in01,1'b0};
	op002<={op01,2'b11};

	hsiii3<=hsii3+(0^b5)+(1^b6);
	in003<={in03,1'b0};
	op003<={op03,2'b01};

	hsiii4<=hsii0+(1^b5)+(1^b6);
	in004<={in00,1'b1};
	op004<={op00,2'b11};

	hsiii5<=hsii2+(0^b5)+(1^b6);
	in005<={in02,1'b1};
	op005<={op02,2'b01};

	hsiii6<=hsii1+(0^b5)+(0^b6);
	in006<={in01,1'b1};
	op006<={op01,2'b00};

	hsiii7<=hsii3+(1^b5)+(0^b6);
	in007<={in03,1'b1};
	op007<={op03,2'b10};

	

	//Stage41

	hsiv0=hsiii0+(0^b7)+(0^b8);
	hsiv1=hsiii1+(1^b7)+(1^b8);
	if (hsiv0<hsiv1)
	begin	
		hx0<=hsiv0;
		in0000<={in000,1'b0};
		op0000<={op000,2'b00};
	end
	else
	begin
		hx0<=hsiv1;
		in0000<={in001,1'b0};
		op0000<={op001,2'b11};
	end

	//stage42

	hsiv2=hsiii2+(1^b7)+(0^b8);
	hsiv3=hsiii3+(0^b7)+(1^b8);
	if (hsiv2<hsiv3)
	begin	
		hx1<=hsiv2;
		in0001<={in002,1'b0};
		op0001<={op002,2'b10};
	end
	else
	begin
		hx1<=hsiv3;
		in0001<={in003,1'b0};
		op0001<={op003,2'b01};
	end

	//stage43

	hsiv4=hsiii4+(1^b7)+(1^b8);
	hsiv5=hsiii5+(0^b7)+(0^b8);
	if (hsiv4<hsiv5)
	begin	
		hx2<=hsiv4;
		in0002<={in004,1'b0};
		op0002<={op004,2'b11};
	end
	else
	begin
		hx2<=hsiv5;
		in0002<={in005,1'b0};
		op0002<={op005,2'b00};
	end

	//stage44

	hsiv6=hsiii6+(0^b7)+(1^b8);
	hsiv7=hsiii7+(1^b7)+(0^b8);
	if (hsiv6<hsiv7)
	begin	
		hx3<=hsiv6;
		in0003<={in006,1'b0};
		op0003<={op006,2'b01};
	end
	else
	begin
		hx3<=hsiv7;
		in0003<={in007,1'b0};
		op0003<={op007,2'b10};
	end

	//stage45

	hsiv8=hsiii0+(1^b7)+(1^b8);
	hsiv9=hsiii1+(0^b7)+(0^b8);
	if (hsiv8<hsiv9)
	begin	
		hx4<=hsiv8;
		in0004<={in000,1'b1};
		op0004<={op000,2'b11};
	end
	else
	begin
		hx4<=hsiv9;
		in0004<={in001,1'b1};
		op0004<={op001,2'b00};
	end

	//stage46

	hsiv10=hsiii2+(0^b7)+(1^b8);
	hsiv11=hsiii3+(1^b7)+(0^b8);
	if (hsiv10<hsiv11)
	begin	
		hx5<=hsiv10;
		in0005<={in002,1'b1};
		op0005<={op002,2'b01};
	end
	else
	begin
		hx5<=hsiv11;
		in0005<={in003,1'b1};
		op0005<={op003,2'b10};
	end

	//stage47

	hsiv12=hsiii4+(0^b7)+(0^b8);
	hsiv13=hsiii5+(1^b7)+(1^b8);
	if (hsiv12<hsiv13)
	begin	
		hx6<=hsiv12;
		in0006<={in004,1'b1};
		op0006<={op004,2'b00};
	end
	else
	begin
		hx6<=hsiv13;
		in0006<={in005,1'b1};
		op0006<={op005,2'b11};
	end

	//stage48

	hsiv14=hsiii6+(1^b7)+(0^b8);
	hsiv15=hsiii7+(0^b7)+(1^b8);
	if (hsiv14<hsiv15)
	begin	
		hx7<=hsiv14;
		in0007<={in006,1'b1};
		op0007<={op006,2'b10};
	end
	else
	begin
		hx7<=hsiv15;
		in0007<={in007,1'b1};
		op0007<={op007,2'b01};
	end

	h04<=hx0;
	h14<=hx1;
	h24<=hx2;
	h34<=hx3;
	h44<=hx4;
	h54<=hx5;
	h64<=hx6;
	h74<=hx7;


	
	//stage51

	hsv0=h04+(0^b9)+(0^b10);
	hsv1=h14+(1^b9)+(1^b10);
	if (hsv0<hsv1)
	begin	
		hxx0<=hsv0;
		in00000<={in0000,1'b0};
		op00000<={op0000,2'b00};
	end
	else
	begin
		hxx0<=hsv1;
		in00000<={in0001,1'b0};
		op00000<={op0001,2'b11};
	end

	//stage52

	hsv2=h24+(1^b9)+(0^b10);
	hsv3=h34+(0^b9)+(1^b10);
	if (hsv2<hsv3)
	begin	
		hxx1<=hsv2;
		in00001<={in0002,1'b0};
		op00001<={op0002,2'b10};
	end
	else
	begin
		hxx1<=hsv3;
		in00001<={in0003,1'b0};
		op00001<={op0003,2'b01};
	end

	//stage53

	hsv4=h44+(1^b9)+(1^b10);
	hsv5=h54+(0^b9)+(0^b10);
	if (hsv4<hsv5)
	begin	
		hxx2<=hsv4;
		in00002<={in0004,1'b0};
		op00002<={op0004,2'b11};
	end
	else
	begin
		hxx2<=hsv5;
		in00002<={in0005,1'b0};
		op00002<={op0005,2'b00};
	end

	//stage54

	hsv6=h64+(0^b9)+(1^b10);
	hsv7=h74+(1^b9)+(0^b10);
	if (hsv6<hsv7)
	begin	
		hxx3<=hsv6;
		in00003<={in0006,1'b0};
		op00003<={op0006,2'b01};
	end
	else
	begin
		hxx3<=hsv7;
		in00003<={in0007,1'b0};
		op00003<={op0007,2'b10};
	end

	//stage55

	hsv8=h04+(1^b9)+(1^b10);
	hsv9=h14+(0^b9)+(0^b10);
	if (hsv8<hsv9)
	begin	
		hxx4<=hsv8;
		in00004<={in0000,1'b1};
		op00004<={op0000,2'b11};
	end
	else
	begin
		hxx4<=hsv9;
		in00004<={in0001,1'b1};
		op00004<={op0001,2'b00};
	end

	//stage56

	hsv10=h24+(0^b9)+(1^b10);
	hsv11=h34+(1^b9)+(0^b10);
	if (hsv10<hsv11)
	begin	
		hxx5<=hsv10;
		in00005<={in0002,1'b1};
		op00005<={op0002,2'b01};
	end
	else
	begin
		hxx5<=hsv11;
		in00005<={in0003,1'b1};
		op00005<={op0003,2'b10};
	end

	//stage57

	hsv12=h44+(0^b9)+(0^b10);
	hsv13=h54+(1^b9)+(1^b10);
	if (hsv12<hsv13)
	begin	
		hxx6<=hsv12;
		in00006<={in0004,1'b1};
		op00006<={op0004,2'b00};
	end
	else
	begin
		hxx6<=hsv13;
		in00006<={in0005,1'b1};
		op00006<={op0005,2'b11};
	end

	//stage58

	hsv14=h64+(1^b9)+(0^b10);
	hsv15=h74+(0^b9)+(1^b10);
	if (hsv14<hsv15)
	begin	
		hxx7<=hsv14;
		in00007<={in0006,1'b1};
		op00007<={op0006,2'b10};
	end
	else
	begin
		hxx7<=hsv15;
		in00007<={in0007,1'b1};
		op00007<={op0007,2'b01};
	end

	h05<=hxx0;
	h15<=hxx1;
	h25<=hxx2;
	h35<=hxx3;
	h45<=hxx4;
	h55<=hxx5;
	h65<=hxx6;
	h75<=hxx7;

	//hamming comparison
        
if(h05<=h15 & h05<=h25 & h05<=h35 & h05<=h45 & h05<=h55 & h05<=h65 & h05<=h75)
begin
co <=op00000;
ci <=in00000;
end
else if(h15<=h05 & h15<=h25 & h15<=h35 & h15<=h45 & h15<=h55 & h15<=h65 & h15<=h75)
begin
co <=op00001;
ci <=in00001;
end
else if(h25<=h05 & h25<=h15 & h25<=h35 & h25<=h45 & h25<=h55 & h25<=h65 & h25<=h75)
begin
co <=op00002;
ci <=in00002;
end
else if(h35<=h05 & h35<=h15 & h35<=h25 & h35<=h45 & h35<=h55 & h35<=h65 & h35<=h75)
begin
co <=op00003;
ci <=in00003;
end
else if(h45<=h05 & h45<=h15 & h45<=h25 & h45<=h35 & h45<=h55 & h45<=h65 & h45<=h75)
begin
co <=op00004;
ci <=in00004;
end
else if(h55<=h05 & h55<=h15 & h55<=h25 & h55<=h35 & h55<=h45 & h55<=h65 & h55<=h75)
begin
co <=op00005;
ci <=in00005;
end
else if(h65<=h05 & h65<=h15 & h65<=h25 & h65<=h35 & h65<=h45 & h65<=h55 & h65<=h75)
begin
co <=op00006;
ci <=in00006;
end
else if(h75<=h05 & h75<=h15 & h75<=h25 & h75<=h35 & h75<=h45 & h75<=h55 & h45<=h65)
begin
co <=op00007;
ci <=in00007;
end
end 

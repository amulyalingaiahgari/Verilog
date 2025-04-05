module tbgates;
reg a,b, control;
wire y;
gates uut (y, a,b, control);
initial
begin
a=0;b=0; control=1;
#5 a=0;b=1; control=0;
#5 a=1;b=0; control=0;
#5 a=1;b=1; control=1;
#5 sfinish;
end
endmodule

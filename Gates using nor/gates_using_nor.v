module gates_using_nor(a,b,y);
    input a, b;
    output y;
	
	wire w1,w2,w3,w4;
	//or gate
	/*nor_gate o1(a,b,w1);
	nor_gate o2(w1,w1,y);
	*/
	
	//and gate
	/*nor_gate a1(a,a,w1);
	nor_gate a2(b,b,w2);
	nor_gate a3(w1,w2,y);
	*/
	
	//nand gate
	/*nor_gate a1(a,a,w1);
	nor_gate a2(b,b,w2);
	nor_gate a3(w1,w2,w3);
	nor_gate a4(w3,w3,y);
	*/
	
	//xor gate
	/*nor_gate a1(a,b,w1);
	nor_gate a2(a,w1,w2);
	nor_gate a3(w1,b,w3);
	nor_gate a4(w2,w3,w4);
	nor_gate a5(w4,w4,y);
	*/
	
	//xnor gate
	nor_gate a1(a,b,w1);
	nor_gate a2(a,w1,w2);
	nor_gate a3(w1,b,w3);
	nor_gate a4(w2,w3,y);
endmodule


module nor_gate(a,b,y);
	input a, b;
	output y;
	
	nor n1(y,a,b);
endmodule

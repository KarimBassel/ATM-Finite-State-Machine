`include "ATM.v" 

module ATMTestBench();
reg incard_tb, language_tb, confirm_tb, again_tb, clock_tb;
reg [1:0] operations_tb;
reg [3:0] password_tb;
reg [6:0] amount_tb;
wire incorrectpswd_tb, nobalance_tb, success_tb;


initial 
begin
integer I;

#10
incard_tb = 1'b0; //Tests incard_tb when 0

#10
incard_tb = 1'b1; //tests incard_tb when 1

#10
language_tb = 1'b0; //tests language_tb when 0

#10
language_tb = 1'b1; //tests language_tb when 1

#10
password_tb = 4'b0011; //wrong password

#10
incard_tb= 1'b1; //returns to incard state

#10
language_tb=1'b1; //language state

#10
password_tb = 4'b0110; //password correct 

#10
operations_tb = 2'b00; //deposit money

#10
amount_tb = 7'1001010; //enters money

#10
confirm_tb = 1'b1; //confirm 1

#10
again_tb= 1'b1; //again 1

#10
operations_tb = 2'b01; //balance check

#10
confirm_tb = 1'b1; //confirm 1

#10
again_tb= 1'b1; //again 1

#10
operations_tb = 2'b10; //withdraw

#10
amount_tb = 7'b0110011; //enters amount to withdraw

#10
confirm_tb = 1'b1; //confirm 1

#10
again_tb = 0; //again 0

/*
randomization
*/
integer seed = 10;
$random(seed);

for(I = 0; I< 10; I = I+1)
begin
#10
incard_tb= $random;
language_tb = $random;
password_tb = $random;
operations_tb = $random;
again_tb = $random;
confirm_tb = $random;
amount_tb = $random;
end

end

initial 
begin 

      clock_tb = 0;
      forever
       #5 clock_tb=~clock_tb;

end
/*
Assertion
*/

wire temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8;
ATM atm();


always @(atm.currentState)
  begin
    case(atm.currentState)
      begin
          4'b0000: 
		  begin 
		  temp0 = 1;
		  temp1 = 0;
		  temp2 = 0;
		  temp3 = 0;
		  temp4 = 0;
	      temp5 = 0;
		  temp6 = 0;
		  temp7 = 0;
		  temp8 = 0; 
		  end
		  
		     4'0001: 
		  begin 
		  temp0 = 0;
		  temp1 = 1;
		  temp2 = 0;
		  temp3 = 0;
		  temp4 = 0;
	      temp5 = 0;
		  temp6 = 0;
		  temp7 = 0;
		  temp8 = 0; 
		  end
	     4'0010: 
		  begin 
		  temp0 = 0;
		  temp1 = 0;
		  temp2 = 1;
		  temp3 = 0;
		  temp4 = 0;
	      temp5 = 0;
		  temp6 = 0;
		  temp7 = 0;
		  temp8 = 0; 
		  end
		   4'0011: 
		  begin 
		  temp0 = 0;
		  temp1 = 0;
		  temp2 = 0;
		  temp3 = 1;
		  temp4 = 0;
	      temp5 = 0;
		  temp6 = 0;
		  temp7 = 0;
		  temp8 = 0; 
		  end
		  	4'0100: 
		  begin 
		  temp0 = 0;
		  temp1 = 0;
		  temp2 = 0;
		  temp3 = 0;
		  temp4 = 1;
	      temp5 = 0;
		  temp6 = 0;
		  temp7 = 0;
		  temp8 = 0; 
		  end
		   	4'0101: 
		  begin 
		  temp0 = 0;
		  temp1 = 0;
		  temp2 = 0;
		  temp3 = 0;
		  temp4 = 0;
	      temp5 = 1;
		  temp6 = 0;
		  temp7 = 0;
		  temp8 = 0; 
		  end
		    	4'0110: 
		  begin 
		  temp0 = 0;
		  temp1 = 0;
		  temp2 = 0;
		  temp3 = 0;
		  temp4 = 0;
	      temp5 = 0;
		  temp6 = 1;
		  temp7 = 0;
		  temp8 = 0; 
		  end
		    4'0111: 
		  begin 
		  temp0 = 0;
		  temp1 = 1;
		  temp2 = 0;
		  temp3 = 0;
		  temp4 = 0;
	      temp5 = 0;
		  temp6 = 0;
		  temp7 = 1;
		  temp8 = 0; 
		  end
		  4'1000: 
		  begin 
		  temp0 = 0;
		  temp1 = 1;
		  temp2 = 0;
		  temp3 = 0;
		  temp4 = 0;
	      temp5 = 0;
		  temp6 = 0;
		  temp7 = 0;
		  temp8 = 1; 
		  end
          default: 
		  begin
		  temp0 = 0;
		  temp1 = 0;
		  temp2 = 0;
		  temp3 = 0;
		  temp4 = 0;
	      temp5 = 0;
		  temp6 = 0;
		  temp7 = 0;
		  temp8 = 0; 
		  end
    end
end

assert always ((temp2 && (password_tb != 4'b0110)) -> next (incorrectpswd_tb));
assert always ((temp2 && (password_tb == 4'b0110)) -> next (!incorrectpswd_tb));
assert always ((temp7 && (confirm_tb)) -> next (success_tb));


ATM DUT(




);

endmodule

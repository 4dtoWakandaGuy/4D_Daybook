//%attributes = {}
If (False:C215)
	//Project Method Name:      CALL_SalesYearonYEar
	//------------------ Method Notes ------------------
	//method Call_SalesYearonYear
	//this method can be called to build info on year on year sales
	//it can return the data to screen to a doc or
	//to the calling method.
	//pass the company code in $1
	//a longint(see the case statement)
	//for how you want the data
	//if the data is going in to a doc the doc ref in $3
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SALES_al_PayOverdueDays;0)
	//ARRAY LONGINT(SALES_al_PayTime;0)
	//ARRAY LONGINT(SALES_al_Years;0)
	//ARRAY REAL(SALES_ar_Spend;0)
	C_BOOLEAN:C305(SALES_ArraySET; SALES_ArraySET2)
	C_LONGINT:C283($_l_index; $_l_Retries; $_l_SalesProcess; $2; SALES_ArraySize)
	C_TEXT:C284($_t_Message; $_t_oldMethodName; $_t_Packet; $_t_SubMessage; $0; $1)
	C_TIME:C306($3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CALL_SalesYearonYEar")
ARRAY LONGINT:C221(SALES_al_Years; 0)
ARRAY REAL:C219(SALES_ar_Spend; 0)
ARRAY LONGINT:C221(SALES_al_PayTime; 0)
ARRAY LONGINT:C221(SALES_al_PayOverdueDays; 0)
SALES_ArraySET:=False:C215
SALES_ArraySET2:=False:C215
SALES_ArraySize:=0
$_l_SalesProcess:=New process:C317("Sales_YearonYear"; 128000; "Sales for customer"; $1; Current process:C322)
$_l_Retries:=0
Repeat 
	$_l_Retries:=$_l_Retries+1
	DelayTicks(20*(1+$_l_Retries))
	If (SALES_ArraySET)
		ARRAY LONGINT:C221(SALES_al_Years; SALES_ArraySize)
		ARRAY REAL:C219(SALES_ar_Spend; SALES_ArraySize)
		ARRAY LONGINT:C221(SALES_al_PayTime; SALES_ArraySize)
		ARRAY LONGINT:C221(SALES_al_PayOverdueDays; SALES_ArraySize)
		SALES_ArraySET2:=True:C214
	End if 
	
Until (Process state:C330($_l_SalesProcess)<0)
Case of 
	: ($2=1)  //screen message
		//make sure you have opened a window to display this message in@!!!!!
		$_t_Message:="Year"+"  "+"Spend     "+" "+"Payment Days(Ave)"+" "+"Overdue days(ave)"+Char:C90(13)
		$_t_SubMessage:=""
		For ($_l_index; 1; Size of array:C274(SALES_al_Years))
			$_t_SubMessage:=$_t_SubMessage+(" "*(4-(Length:C16(String:C10(SALES_al_Years{$_l_index})))))+String:C10(SALES_al_Years{$_l_index})
			$_t_SubMessage:=$_t_SubMessage+" "+(" "*(9-(Length:C16(String:C10(SALES_ar_Spend{$_l_index}))))+String:C10(SALES_ar_Spend{$_l_index}))
			$_t_SubMessage:=$_t_SubMessage+" "+(" "*(16-(Length:C16(String:C10(SALES_al_PayTime{$_l_index}))))+String:C10(SALES_al_PayTime{$_l_index}))
			$_t_SubMessage:=$_t_SubMessage+" "+(" "*(16-(Length:C16(String:C10(SALES_al_PayOverdueDays{$_l_index}))))+String:C10(SALES_al_PayOverdueDays{$_l_index}))
			$_t_SubMessage:=$_t_SubMessage+Char:C90(13)
			
			
		End for 
		MESSAGE:C88($_t_Message+$_t_SubMessage)
	: ($2=2)  //screen Alert
		
		$_t_Message:="Year"+"  "+"Spend     "+" "+"Payment Days(Ave)"+" "+"Overdue days(Ave)"+Char:C90(13)
		$_t_SubMessage:=""
		For ($_l_index; 1; Size of array:C274(SALES_al_Years))
			$_t_SubMessage:=$_t_SubMessage+(" "*(4-(Length:C16(String:C10(SALES_al_Years{$_l_index})))))+String:C10(SALES_al_Years{$_l_index})
			$_t_SubMessage:=$_t_SubMessage+" "+(" "*(9-(Length:C16(String:C10(SALES_ar_Spend{$_l_index}))))+String:C10(SALES_ar_Spend{$_l_index}))
			$_t_SubMessage:=$_t_SubMessage+" "+(" "*(16-(Length:C16(String:C10(SALES_al_PayTime{$_l_index}))))+String:C10(SALES_al_PayTime{$_l_index}))
			$_t_SubMessage:=$_t_SubMessage+" "+(" "*(16-(Length:C16(String:C10(SALES_al_PayOverdueDays{$_l_index}))))+String:C10(SALES_al_PayOverdueDays{$_l_index}))
			$_t_SubMessage:=$_t_SubMessage+Char:C90(13)
			
			
		End for 
		//MESSAGE($_t_Message+$_t_SubMessage)
		If ($_t_SubMessage#"")
			Gen_Alert($_t_Message+$_t_SubMessage)
		End if 
	: ($2=3)  //return the text(another method is handling what to do)
		$_t_Message:="Year"+"  "+"Spend     "+" "+"Payment Days(Ave)"+" "+"Overdue days(Ave)"+Char:C90(13)
		$_t_SubMessage:=""
		For ($_l_index; 1; Size of array:C274(SALES_al_Years))
			$_t_SubMessage:=$_t_SubMessage+(" "*(4-(Length:C16(String:C10(SALES_al_Years{$_l_index})))))+String:C10(SALES_al_Years{$_l_index})
			$_t_SubMessage:=$_t_SubMessage+" "+(" "*(9-(Length:C16(String:C10(SALES_ar_Spend{$_l_index}))))+String:C10(SALES_ar_Spend{$_l_index}))
			$_t_SubMessage:=$_t_SubMessage+" "+(" "*(16-(Length:C16(String:C10(SALES_al_PayTime{$_l_index}))))+String:C10(SALES_al_PayTime{$_l_index}))
			$_t_SubMessage:=$_t_SubMessage+" "+(" "*(16-(Length:C16(String:C10(SALES_al_PayOverdueDays{$_l_index}))))+String:C10(SALES_al_PayOverdueDays{$_l_index}))
			$_t_SubMessage:=$_t_SubMessage+Char:C90(13)
			
			
		End for 
		If ($_t_SubMessage#"")
			$0:=$_t_Message+$_t_SubMessage
		Else 
			$0:=""
		End if 
		
	: ($2=4)  //send to a document
		//the doc ref is in param 3
		If (Count parameters:C259>=3)
			If ($3>?00:00:00?)
				$_t_Packet:=""
				For ($_l_index; 1; Size of array:C274(SALES_al_Years))
					$_t_Packet:=$_t_Packet+$1+Char:C90(9)+String:C10(SALES_al_Years{$_l_index})
					$_t_Packet:=$_t_Packet+Char:C90(9)+String:C10(SALES_ar_Spend{$_l_index})
					$_t_Packet:=$_t_Packet+Char:C90(9)+String:C10(SALES_al_PayTime{$_l_index})
					$_t_Packet:=$_t_Packet+Char:C90(9)+String:C10(SALES_al_PayOverdueDays{$_l_index})
					$_t_Packet:=$_t_Packet+Char:C90(13)
				End for 
				SEND PACKET:C103($3; $_t_Packet)
			End if 
			
		End if 
		
		
End case 
ERR_MethodTrackerReturn("CALL_SalesYearonYEar"; $_t_oldMethodName)
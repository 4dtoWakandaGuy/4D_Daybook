//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_PayAllP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_LONGINT:C283($1)
	C_REAL:C285(v31; vPay2; vSubtotal)
	C_TEXT:C284($_t_AmountSTR; $_t_NewAmountSTR; $_t_oldMethodName; $_t_TestText; $_t_Text)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_PayAllP")
If ($1#0)
	$_t_TestText:="Allocated Amount for "+GEN_at_Name{$1}+":"
	$_t_Text:=Substring:C12($_t_TestText; 1; 40)
	
	$_t_AmountSTR:=String:C10(GEN_ar_Value{GEN_ar_Value}; "########0.00;-########0.00;0")
	$_t_NewAmountSTR:=Substring:C12(Gen_Request($_t_Text; $_t_AmountSTR); 1; 21)
	If (OK=1)
		vPay2:=Round:C94((vPay2-GEN_ar_Value{$1}); 2)
		GEN_ar_Value{GEN_ar_Value}:=Round:C94((Num:C11($_t_NewAmountSTR)); 2)
		vPay2:=Round:C94((vPay2+GEN_ar_Value{$1}); 2)
	End if 
	vSubtotal:=Round:C94((v31-vPay2); 2)
End if 
ERR_MethodTrackerReturn("Gen_PayAllP"; $_t_oldMethodName)
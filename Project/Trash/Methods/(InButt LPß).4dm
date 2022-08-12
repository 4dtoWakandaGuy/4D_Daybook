//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      InButt LPß
	//------------------ Method Notes ------------------
	//InButt LPß
	
	//B=Before
	//P=Page
	//N=Next or Before phase proc without setup
	//S=Changed Sort Order Field or otherwise Update the arrays
	//A=Accept
	//C=Cancel
	//D=Delete
	//F=aFter phase where no Accept - eg before Next Record
	//T=Update Sort Order field from Sort/Dragging before Forms etc
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ButtonPressed; $3)
	C_TEXT:C284($_t_CallMethodName; $_t_MethodName; $_t_oldMethodName; $1; $2)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("InButt LPß")

If (Count parameters:C259>2)
	$_l_ButtonPressed:=$3
Else 
	$_l_ButtonPressed:=0
End if 


Case of 
	: ($1="Companies_InLPß")
		Companies_InLPß($2; $_l_ButtonPressed)
		Case of 
			: ($2="B")
				QV_UpdateQualsPallette(1; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63)
			: ($2="N")
				QV_UpdateQualsPallette(1; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63)
			: ($2="A") | ($2="F")
				QV_UpdateQualsPallette(2; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63; 1)
			: ($2="C")
				QV_UpdateQualsPallette(2; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63; 2)
			: ($2="D")
				QV_UpdateQualsPallette(2; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63; 3)
		End case 
		
	: ($1="Products_InLPß")
		Products_InLPß($2)
		Case of 
			: ($2="B")
				QV_UpdateQualsPallette(1; Table:C252(->[PRODUCTS:9]); [PRODUCTS:9]X_ID:43)
			: ($2="N")
				QV_UpdateQualsPallette(1; Table:C252(->[PRODUCTS:9]); [PRODUCTS:9]X_ID:43)
			: ($2="A") | ($2="F")
				QV_UpdateQualsPallette(2; Table:C252(->[PRODUCTS:9]); [PRODUCTS:9]X_ID:43; 1)
			: ($2="C")
				QV_UpdateQualsPallette(2; Table:C252(->[PRODUCTS:9]); [PRODUCTS:9]X_ID:43; 2)
			: ($2="D")
				QV_UpdateQualsPallette(2; Table:C252(->[PRODUCTS:9]); [PRODUCTS:9]X_ID:43; 3)
		End case 
	: ($1="Orders_InLPß")
		Orders_InLPß($2)
		Case of 
			: ($2="B")
				QV_UpdateQualsPallette(1; Table:C252(->[ORDERS:24]); [ORDERS:24]x_ID:58)
			: ($2="N")
				QV_UpdateQualsPallette(1; Table:C252(->[ORDERS:24]); [ORDERS:24]x_ID:58)
			: ($2="A") | ($2="F")
				QV_UpdateQualsPallette(2; Table:C252(->[ORDERS:24]); [ORDERS:24]x_ID:58; 1)
			: ($2="C")
				QV_UpdateQualsPallette(2; Table:C252(->[ORDERS:24]); [ORDERS:24]x_ID:58; 2)
			: ($2="D")
				QV_UpdateQualsPallette(2; Table:C252(->[ORDERS:24]); [ORDERS:24]x_ID:58; 3)
		End case 
	: ($1="Invoices_InLPß")
		Invoices_InLPß($2)
	: ($1="Purch_InLPß")
		Purch_InLPß($2)
	: ($1="PurchOrd_InLPß")
		PurchOrd_InLPß($2)
	: ($1="FurthFldD_InLPß")
		FurthFldD_InLPß($2)
	Else 
		$_t_CallMethodName:=STR_RemoveLeadTrailSpace($1)
		//If (is windows )
		//this is here because it CRASHES on Windows otherwise
		//EXECUTE METHOD($_t_CallMethodName;*;$2)
		//EXECUTE FORMULA(Substring($1;1;Length($1)-1)+Char(167)+"("+Char(34)+$2+Char(34)+")")
		//BEEP
		//Else 
		//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$1+"("+Char(34)+$2+Char(34)+")")
		EXECUTE METHOD:C1007($_t_CallMethodName; *; $2)
		
		
		//EXECUTE FORMULA($1+"("+Char(34)+$2+Char(34)+")")
		//End if 
End case 
ERR_MethodTrackerReturn("InButt LPß"; $_t_oldMethodName)
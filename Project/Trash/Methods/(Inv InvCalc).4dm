//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Inv InvCalc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/04/2010 20:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($2; $3; $4)
	C_REAL:C285($_r_SubTotal; $_r_Tax; $_r_Total; VEUROSUBTOTAL; VEUROTOTAL; VEUROVAT; vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Inv InvCalc")
//Inv InvCalc
If (Count parameters:C259=0)
	QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
	vSubtotal:=Gen_Round((Sum:C1([INVOICES_ITEMS:161]Amount:5)); 2; 2)
	vEuroSubtotal:=WS_EuroConvertor(vSubtotal; [INVOICES:39]Currency_Code:27)
	vVAT:=Gen_Round((Sum:C1([INVOICES_ITEMS:161]Tax_Amount:7)); 2; 2)
	vEuroVAT:=WS_EuroConvertor(vVAT; [INVOICES:39]Currency_Code:27)
	vTotal:=Gen_Round((Sum:C1([INVOICES_ITEMS:161]Total_Amount:8)); 2; 2)
	vEuroTotal:=WS_EuroConvertor(vTotal; [INVOICES:39]Currency_Code:27)
Else 
	$_r_SubTotal:=0
	$_r_Total:=0
	$_r_Tax:=0
	$_r_SUbtotal:=Sum:C1($2->)
	$_r_Tax:=Sum:C1($3->)
	$_r_Total:=Sum:C1($4->)
	
	vSubtotal:=Gen_Round($_r_SubTotal; 2; 2)
	vEuroSubtotal:=WS_EuroConvertor(vSubtotal; $1)
	vVAT:=Gen_Round($_r_Tax; 2; 2)
	vEuroVAT:=WS_EuroConvertor(vVAT; $1)
	vTotal:=Gen_Round($_r_Total; 2; 2)
	vEuroTotal:=WS_EuroConvertor(vTotal; $1)
	
End if 
ERR_MethodTrackerReturn("Inv InvCalc"; $_t_oldMethodName)
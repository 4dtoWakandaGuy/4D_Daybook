//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalPLBHdg
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($_l_PrintHeight; ch6; s1; vControl)
	C_POINTER:C301($1)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_invF; $_r_invT; VamountF; VamountT; vChargesF; vChargesT; VinvF; vInvoiced; vInvT)
	C_REAL:C285(vPaid; vPTot; vT1; vT4; vYTot)
	C_TEXT:C284($_t_oldMethodName; vHeading; vRec; vTerms)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Acc_BalPLBHdg")
vControl:=3*([HEADINGS:84]Heading_Level:3-1)
vHeading:=(" "*vControl)+[HEADINGS:84]Heading_Name:2
vAmountF:=0
vAmountT:=0
vChargesF:=0
vChargesT:=0
vInvF:=0
vInvT:=0
vInvoiced:=0
vPaid:=0

If (ch6=0)
	If (s1=1)
		Acc_BalPage(1; 2; "PLB_Hdr")
		$_l_PrintHeight:=Print form:C5([HEADINGS:84]; "PLB_Heading")
		If (Count parameters:C259>=1)
			$1->:=$_l_PrintHeight
		End if 
		
	Else 
		SEND PACKET:C103(vHeading+vRec)
	End if 
End if 

If ([HEADINGS:84]Heading_Level:3=1)
	vTerms:=[HEADINGS:84]Heading_Code:1+"@"
	vPTot:=0
	vYTot:=0
	vT1:=0
	vT4:=0
	DB_bo_RecordModified:=False:C215
	//  vStockLevel:=1
Else 
	DB_bo_RecordModified:=True:C214
End if 
ERR_MethodTrackerReturn("Acc_BalPLBHdg"; $_t_oldMethodName)

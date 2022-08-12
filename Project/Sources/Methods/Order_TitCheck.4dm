//%attributes = {}
If (False:C215)
	//Project Method Name:      Order_TitCheck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(ST_ai_StatusUsage;0)
	C_LONGINT:C283($_l_UsageRow)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Order_TitCheck")
If (Not:C34(Undefined:C82(ST_ai_StatusUsage)))
	$_l_UsageRow:=Find in array:C230(ST_ai_StatusUsage; 1)
	If ($_l_UsageRow>0)
		If (Gen_PPCreditChk(->[ORDERS:24]Company_Code:1; ->[CREDIT_STAGES:54]Prevent_Confirmation:9; "changed to "+[TABLE_RECORD_STATES:90]Listing_Name:2))
			Order_TitUp2($1)
		Else 
			[ORDERS:24]State:15:=$1
			States_CUArr(->[ORDERS:24]State:15)
		End if 
	Else 
		Order_TitUp2($1)
	End if 
End if 
ERR_MethodTrackerReturn("Order_TitCheck"; $_t_oldMethodName)

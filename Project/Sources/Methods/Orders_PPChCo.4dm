//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPChCo
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
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Continue)
	C_TEXT:C284($_t_CompanyCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPChCo")
$_l_Continue:=1
FIRST RECORD:C50([ORDER_ITEMS:25])
RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
$_t_CompanyCode:=[ORDERS:24]Company_Code:1
While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & ($_l_Continue=1))
	If ($_t_CompanyCode#[ORDERS:24]Company_Code:1)
		$_l_Continue:=0
	End if 
	NEXT RECORD:C51([ORDER_ITEMS:25])
	RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
End while 
If ($_l_Continue=0)
	Gen_Alert("Please only select Items for a single Customer"; "Cancel")
	$0:=False:C215
Else 
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("Orders_PPChCo"; $_t_oldMethodName)

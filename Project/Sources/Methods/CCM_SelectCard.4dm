//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_SelectCard
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  11/08/2010 16:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CardID; $_l_ContactID; $2; CCM_l_ShowSheetWindow)
	C_TEXT:C284($_t_ContactCode; $_t_oldMethodName; $1; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_SelectCard")
$_t_ContactCode:=""
$_l_ContactID:=0
$_t_ContactCode:=[ORDERS:24]Contact_Code:2
If ([CONTACTS:1]Contact_Code:2#$_t_ContactCode)
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
End if 
$_l_ContactID:=[CONTACTS:1]x_ID:33


CCM_l_ShowSheetWindow:=1
If ($_l_ContactID#0) & ($_t_ContactCode#"")
	If (Count parameters:C259>3)
		If ($3#"")
			If ($3#[COMPANIES:2]Company_Code:1)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$3)
			End if 
			
			$_l_CardID:=CCM_CardSelection(Table:C252(->[CONTACTS:1]); $_l_ContactID; $_t_ContactCode; "Credit Card Details"; [COMPANIES:2]x_ID:63)
		Else 
			$_l_CardID:=CCM_CardSelection(Table:C252(->[CONTACTS:1]); $_l_ContactID; $_t_ContactCode; "Credit Card Details")
		End if 
	Else 
		$_l_CardID:=CCM_CardSelection(Table:C252(->[CONTACTS:1]); $_l_ContactID; $_t_ContactCode; "Credit Card Details")
	End if 
End if 
[ORDERS:24]CC_Issue_No:54:=String:C10($_l_CardID)

CCM_l_ShowSheetWindow:=0
ERR_MethodTrackerReturn("CCM_SelectCard"; $_t_oldMethodName)
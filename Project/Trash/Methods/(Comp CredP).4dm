//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp CredP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vCM)
	C_TEXT:C284($_t_ActualSTRING; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp CredP")
//Comp Credit - Purchases
If (vCM=0)
	READ ONLY:C145([PURCHASE_INVOICES:37])
	QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2=[COMPANIES:2]Company_Code:1; *)
	QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Total_Due:9#0)
	$_t_ActualSTRING:=String:C10(Sum:C1([PURCHASE_INVOICES:37]Total_Due:9); "|Accounts")
	Gen_Alert("Credit Used: "+$_t_ActualSTRING; "")
Else 
	Gen_Alert("This cannot be used when creating Companies from other files"; "Cancel")
End if 
ERR_MethodTrackerReturn("Comp CredP"; $_t_oldMethodName)
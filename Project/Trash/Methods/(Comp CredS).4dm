//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp CredS
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

$_t_oldMethodName:=ERR_MethodTracker("Comp CredS")
//Comp Credit - Sales
If (vCM=0)
	READ ONLY:C145([INVOICES:39])
	QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=[COMPANIES:2]Company_Code:1; *)
	QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0)
	$_t_ActualSTRING:=String:C10(Sum:C1([INVOICES:39]Total_Due:7); "|Accounts")
	Gen_Alert("Credit Used: "+$_t_ActualSTRING; "")
Else 
	Gen_Alert("This cannot be used when creating Companies from other files"; "Cancel")
End if 
ERR_MethodTrackerReturn("Comp CredS"; $_t_oldMethodName)
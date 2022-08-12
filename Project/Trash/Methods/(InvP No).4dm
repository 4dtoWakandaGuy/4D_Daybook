//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      InvP No
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2/6/10 11:08 AM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_IsUnique)
	C_TEXT:C284($_t_DepositCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("InvP No")
//InvP No
Repeat 
	$_t_DepositCode:="*D"+Substring:C12(Gen_CodePref(15; ->[INVOICES:39]Invoice_Number:1; "*D"); 1; 11)
	
	//$_t_DepositCode:=[INVOICES]Invoice No
	SET QUERY DESTINATION:C396(3; $_l_IsUnique)
	QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositCode)
	SET QUERY DESTINATION:C396(0)
Until ($_l_IsUnique=0)

If ($_t_DepositCode="")
	CANCEL:C270
Else 
	[INVOICES:39]Invoice_Number:1:=Substring:C12($_t_DepositCode; 1; 11)
	
End if 
ERR_MethodTrackerReturn("InvP No"; $_t_oldMethodName)
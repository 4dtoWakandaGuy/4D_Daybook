//%attributes = {}
If (False:C215)
	//Project Method Name:      Contact_Code
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_IsUnique)
	C_TEXT:C284(<>DefContSta; <>DefRole; <>PER_t_CurrentUserInitials; $_t_ContactCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contact_Code")
//Contact_Code
//[CONTACTS]Contact Code:=Gen_CodePref (2;->[CONTACTS]Contact Code)
Repeat 
	$_t_ContactCode:=Gen_CodePref(2; ->[CONTACTS:1]Contact_Code:2)
	SET QUERY DESTINATION:C396(3; $_l_IsUnique)
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
	If ($_l_IsUnique=0)
		[CONTACTS:1]Contact_Code:2:=$_t_ContactCode
	End if 
	SET QUERY DESTINATION:C396(0)
Until ($_l_IsUnique=0)


If ([CONTACTS:1]Entry_Date:17=!00-00-00!)
	[CONTACTS:1]Entry_Date:17:=<>DB_d_CurrentDate
	[CONTACTS:1]Modified_Date:28:=<>DB_d_CurrentDate
End if 
If ([CONTACTS:1]Omit:20="")
	[CONTACTS:1]Omit:20:="N"
End if 
If ((<>DefContSta#"") & ([CONTACTS:1]Status:14=""))
	[CONTACTS:1]Status:14:=<>DefContSta
End if 
If ((<>DefRole#"") & ([CONTACTS:1]Role:11=""))
	[CONTACTS:1]Role:11:=<>DefRole
End if 
If ([CONTACTS:1]Taken_by:29="")
	[CONTACTS:1]Taken_by:29:=<>PER_t_CurrentUserInitials
End if 
[CONTACTS:1]Export:18:=Export_Stamp2([CONTACTS:1]Export:18)
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("Contact_Code"; $_t_oldMethodName)
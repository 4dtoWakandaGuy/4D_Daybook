//%attributes = {}
If (False:C215)
	//Project Method Name:      PersonnelSetID
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283(vNo2)
	C_TEXT:C284($_t_oldMethodName; $_t_Search)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PersonnelSetID")
$_t_Search:=Substring:C12(Gen_Request("User Id:"); 1; 21)
If (OK=1)
	If ($_t_Search="")
		Gen_Confirm("Are you sure you want a blank User Id?"; "Yes"; "No")
		If (OK=1)
			[PERSONNEL:11]Person_Identity:13:=$_t_Search
			DB_bo_RecordModified:=True:C214
		End if 
	Else 
		[PERSONNEL:11]Person_Identity:13:=$_t_Search
		DB_bo_RecordModified:=True:C214
	End if 
End if 
vNo2:=Length:C16([PERSONNEL:11]Person_Identity:13)
ERR_MethodTrackerReturn("PersonnelSetID"; $_t_oldMethodName)
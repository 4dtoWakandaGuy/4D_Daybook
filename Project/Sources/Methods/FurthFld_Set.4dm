//%attributes = {}
If (False:C215)
	//Project Method Name: FurthFld_Set
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFld_Set")
//FurthFld_Set - Sets Value into a Field
//Calls Set2 cos of Windows 4D error

If (Count parameters:C259>=3)
	Case of 
		: (Count parameters:C259=3)
			$0:=FurthFld_Set2($1; $2; $3)
		: (Count parameters:C259=4)
			$0:=FurthFld_Set2($1; $2; $3; $4)
	End case 
End if 
ERR_MethodTrackerReturn("FurthFld_Set"; $_t_oldMethodName)
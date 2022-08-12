//%attributes = {}
If (False:C215)
	//Project Method Name:      Documents_4DWriteAccessType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	C_BOOLEAN:C305($1)
	C_TEXT:C284($_t_oldMethodName; $0; <>SYS_t_4DWriteType; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters Write")
//<>SYS_t_4DWriteType="W" =4d write 'gold'
//<>SYS_t_4DWriteType="W" =4d write 'silver'
//<>SYS_t_4DWriteType="" =plain text!
//really is it just "W" or not!


Case of 
	: (DB_UserHas4DWriteAccess)
		$0:="W"
	: (Not:C34(DB_UserHas4DWriteAccess))
		
		If (Not:C34(User in group:C338(Current user:C182; "Designer"))) | ((User in group:C338(Current user:C182; "User")) | (Current user:C182="Demo@"))
			If ($1)
				Gen_Alert("You did not log on as a WP user, and do not have access to 4D Write."+Char:C90(13)+Char:C90(13)+"You may, however, edit and/or print a Document in plain text mode."; "")
			End if 
			$0:=""
		Else 
			$0:="W"
		End if 
		
	Else 
		$0:=""
End case 
ERR_MethodTrackerReturn("Letters Write"; $_t_oldMethodName)

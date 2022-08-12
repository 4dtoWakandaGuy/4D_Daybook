//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_CUCreate
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
	C_LONGINT:C283($2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_CUCreate")
CREATE RECORD:C68([CODE_USES:91])
[CODE_USES:91]Code:1:=$1
[CODE_USES:91]Use:2:=$2
DB_SaveRecord(->[CODE_USES:91])
ERR_MethodTrackerReturn("Gen_CUCreate"; $_t_oldMethodName)
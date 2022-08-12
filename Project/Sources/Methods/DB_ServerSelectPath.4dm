//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ServerSelectPath
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 10:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_Message; $_t_oldMethodName; $_t_ServerPath; $1; DB_t_ServerPath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ServerSelectPath")

If (Count parameters:C259>0)
	$_t_Message:=$1
Else 
	$_t_Message:="Select path"
End if 
DB_t_ServerPath:=""

$_t_ServerPath:=DB_SelectFolder($_t_Message)
If (OK=1)
	DB_t_ServerPath:=$_t_ServerPath
Else 
	DB_t_ServerPath:="Cancelled"
End if 
ERR_MethodTrackerReturn("DB_ServerSelectPath"; $_t_oldMethodName)
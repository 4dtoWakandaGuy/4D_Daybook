//%attributes = {}

//Database Method Name:      DB_CreateMirror
//------------------ Method Notes ------------------
//------------------ Revision Control ----------------
//Date Created:  02/10/2017
//Created BY:  DefaultUser
//Date Modified: 
//Modified By: DefaultUser
//Modification notes
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_CreateMirror")
DATA_CreateMirror
ERR_MethodTrackerReturn("DB_CreateMirror"; $_t_oldMethodName)
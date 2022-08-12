//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetDocumentPath
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 16:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition)
	C_TEXT:C284($_t_oldMethodName; $_t_Path; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetDocumentPath")

//$_t_Path:=System folder(3)
$_t_Path:=System folder:C487(User preferences_user:K41:4)  //kmw 29/010/08 v631b120c - change to use constant for readability (it is the same value)

$_t_Path:=System folder:C487(Documents folder:K41:18)
$0:=$_t_Path
ERR_MethodTrackerReturn("DB_GetDocumentPath"; $_t_oldMethodName)
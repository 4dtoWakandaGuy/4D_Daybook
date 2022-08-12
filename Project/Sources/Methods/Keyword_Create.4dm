//%attributes = {}
If (False:C215)
	//Project Method Name:      Keyword_Create
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
	C_LONGINT:C283($_l_CountParameters)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Keyword_Create")
//Keyword_Create

$_l_CountParameters:=Count parameters:C259
If ($_l_CountParameters=2)
	Keyword_Create2($1; $2; "")
Else 
	Keyword_Create2($1; $2; $3)
End if 
ERR_MethodTrackerReturn("Keyword_Create"; $_t_oldMethodName)
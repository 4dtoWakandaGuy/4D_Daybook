//%attributes = {}
If (False:C215)
	//Project Method Name:      Keyword_Del
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
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Keyword_Del")
//Keyword_Del

$_l_CountParameters:=Count parameters:C259
If ($_l_CountParameters=1)
	Keyword_Del2($1; "")
Else 
	Keyword_Del2($1; $2)
End if 
ERR_MethodTrackerReturn("Keyword_Del"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      GetDiaryHour
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	_O_C_INTEGER:C282($0)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GetDiaryHour")
//this method will return the HOUR from a 24 hour period that a time falls in

//this method will return the HOUR from a 24 hour period that a time falls in

If (Count parameters:C259>=1)
	$0:=Int:C8(($1*1)/3600)
End if 
ERR_MethodTrackerReturn("GetDiaryHour"; $_t_oldMethodName)
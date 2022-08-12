//%attributes = {}
If (False:C215)
	//Project Method Name:      Cur_LoadMultiCurrValCodes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cur_LoadMultiCurrValCodes")

ARRAY TEXT:C222($1->; 2)

$1->{1}:="Historical Rate"
$1->{2}:="Current Rate"
ERR_MethodTrackerReturn("Cur_LoadMultiCurrValCodes"; $_t_oldMethodName)

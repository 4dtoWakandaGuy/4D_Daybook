//%attributes = {}
If (False:C215)
	//Project Method Name:      GEN_SUM
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
	C_LONGINT:C283($_l_Index)
	C_POINTER:C301($1; $2)
	C_REAL:C285($_r_Sum; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GEN_SUM")
//I AM PUTTING THIS METHOD IN
//because sometimes SUM produces strange answers
//if there is low memory it can completely lose track
//the following works
//yes slow but reliable
FIRST RECORD:C50($1->)
For ($_l_Index; 1; Records in selection:C76($1->))
	$_r_Sum:=$_r_Sum+Round:C94($2->; 2)
	NEXT RECORD:C51($1->)
End for 
$0:=$_r_Sum
ERR_MethodTrackerReturn("GEN_SUM"; $_t_oldMethodName)
//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel NoAtAt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/10/2011 16:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_TryNoat; $5)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $3; $4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel NoAtAt")

If (Count parameters:C259>=5)
	$_bo_TryNoat:=$5
Else 
	$_bo_TryNoat:=True:C214
End if 
If ($_bo_TryNoat)
	QUERY:C277($1->; $2->=$3)
	If (Records in selection:C76($1->)=0)
		QUERY:C277($1->; $2->=$4)
	End if 
Else 
	QUERY:C277($1->; $2->=$4)
End if 
ERR_MethodTrackerReturn("Sel NoAtAt"; $_t_oldMethodName)

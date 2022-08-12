//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_NoAtAt2
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
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $4; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_NoAtAt2")

QUERY:C277($1->; $2->=$4)
If (Records in selection:C76($1->)=0)
	QUERY:C277($1->; $3->=$4)
	If (Records in selection:C76($1->)=0)
		QUERY:C277($1->; $2->=$5)
		If (Records in selection:C76($1->)=0)
			QUERY:C277($1->; $3->=$5)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Sel_NoAtAt2"; $_t_oldMethodName)
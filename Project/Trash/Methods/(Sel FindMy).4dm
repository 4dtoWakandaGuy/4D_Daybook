//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel FindMy
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
	C_BOOLEAN:C305(<>FindMy)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel FindMy")
If (<>FindMy)
	If (Records in selection:C76($1->)>1)
		COPY NAMED SELECTION:C331($1->; "Sel")
		If (Count parameters:C259=2)
			QUERY SELECTION:C341($1->; $2->=<>PER_t_CurrentUserInitials)
		Else 
			QUERY SELECTION:C341($1->; $2->=<>PER_t_CurrentUserInitials; *)
			QUERY SELECTION:C341($1->;  | ; $3->=<>PER_t_CurrentUserInitials)
		End if 
		If (Records in selection:C76($1->)=0)
			USE NAMED SELECTION:C332("Sel")
		End if 
		CLEAR NAMED SELECTION:C333("Sel")
	End if 
End if 
ERR_MethodTrackerReturn("Sel FindMy"; $_t_oldMethodName)
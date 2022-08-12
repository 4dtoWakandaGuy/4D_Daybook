//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_c01
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
	C_LONGINT:C283($3; $4; ch0; ch1)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_c01")
//Sel c 0-1
If ((ch0=1) | (ch1=1))
	If (ch0=1)
		If (ch1=1)
			QUERY:C277($1->; $2->=$3; *)
		Else 
			QUERY:C277($1->; $2->=$3)
		End if 
	End if 
	If (ch1=1)
		If (ch0=1)
			QUERY:C277($1->;  | ; $2->=$4)
		Else 
			QUERY:C277($1->; $2->=$4)
		End if 
	End if 
	Master2($1)
End if 
ERR_MethodTrackerReturn("Sel_c01"; $_t_oldMethodName)
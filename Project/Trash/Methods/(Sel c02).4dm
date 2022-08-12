//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel c02
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
	C_LONGINT:C283($3; $4; $5; ch0; ch1; ch2)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel c02")
//Sel c 0-2
If ((ch0=1) | (ch1=1) | (ch2=1))
	If (ch0=1)
		If ((ch1=1) | (ch2=1))
			QUERY:C277($1->; $2->=$3; *)
		Else 
			QUERY:C277($1->; $2->=$3)
		End if 
	End if 
	If (ch1=1)
		If (ch0=1)
			If (ch2=1)
				QUERY:C277($1->;  | ; $2->=$4; *)
			Else 
				QUERY:C277($1->;  | ; $2->=$4)
			End if 
		Else 
			If (ch2=1)
				QUERY:C277($1->; $2->=$4; *)
			Else 
				QUERY:C277($1->; $2->=$4)
			End if 
		End if 
	End if 
	If (ch2=1)
		If ((ch0=1) | (ch1=1))
			QUERY:C277($1->;  | ; $2->=$5)
		Else 
			QUERY:C277($1->; $2->=$5)
		End if 
	End if 
	Master2($1)
End if 
ERR_MethodTrackerReturn("Sel c02"; $_t_oldMethodName)
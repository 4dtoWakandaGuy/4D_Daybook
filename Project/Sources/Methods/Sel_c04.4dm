//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_c04
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
	C_LONGINT:C283($3; $4; $5; $6; $7; ch0; ch1; ch2; ch3; ch4)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_c04")
//Sel c 0-4
If ((ch0=1) | (ch1=1) | (ch2=1) | (ch3=1) | (ch4=1))
	If (ch0=1)
		If ((ch1=1) | (ch2=1) | (ch3=1) | (ch4=1))
			QUERY:C277($1->; $2->=$3; *)
		Else 
			QUERY:C277($1->; $2->=$3)
		End if 
	End if 
	If (ch1=1)
		If (ch0=1)
			If ((ch2=1) | (ch3=1) | (ch4=1))
				QUERY:C277($1->;  | ; $2->=$4; *)
			Else 
				QUERY:C277($1->;  | ; $2->=$4)
			End if 
		Else 
			If ((ch2=1) | (ch3=1) | (ch4=1))
				QUERY:C277($1->; $2->=$4; *)
			Else 
				QUERY:C277($1->; $2->=$4)
			End if 
		End if 
	End if 
	If (ch2=1)
		If ((ch0=1) | (ch1=1))
			If ((ch3=1) | (ch4=1))
				QUERY:C277($1->;  | ; $2->=$5; *)
			Else 
				QUERY:C277($1->;  | ; $2->=$5)
			End if 
		Else 
			If ((ch3=1) | (ch4=1))
				QUERY:C277($1->; $2->=$5; *)
			Else 
				QUERY:C277($1->; $2->=$5)
			End if 
		End if 
	End if 
	If (ch3=1)
		If (ch4=1)
			If ((ch0=1) | (ch1=1) | (ch2=1))
				QUERY:C277($1->;  | ; $2->=$6; *)
			Else 
				QUERY:C277($1->; $2->=$6; *)
			End if 
		Else 
			If ((ch0=1) | (ch1=1) | (ch2=1))
				QUERY:C277($1->;  | ; $2->=$6)
			Else 
				QUERY:C277($1->; $2->=$6)
			End if 
		End if 
	End if 
	If (ch4=1)
		If ((ch0=1) | (ch1=1) | (ch2=1) | (ch3=1))
			QUERY:C277($1->;  | ; $2->=$7)
		Else 
			QUERY:C277($1->; $2->=$7)
		End if 
	End if 
	Master2($1)
End if 
ERR_MethodTrackerReturn("Sel_c04"; $_t_oldMethodName)
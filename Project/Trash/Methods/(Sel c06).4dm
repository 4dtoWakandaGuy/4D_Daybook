//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel c06
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
	C_LONGINT:C283($3; $4; $5; $6; $7; $8; $9; ch0; ch1; ch2; ch3)
	C_LONGINT:C283(ch4; ch5; ch6)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel c06")
//Sel c 0-6
If ((ch0=1) | (ch1=1) | (ch2=1) | (ch3=1) | (ch4=1) | (ch5=1) | (ch6=1))
	If (ch0=1)
		If ((ch1=1) | (ch2=1) | (ch3=1) | (ch4=1) | (ch5=1) | (ch6=1))
			QUERY:C277($1->; $2->=$3; *)
		Else 
			QUERY:C277($1->; $2->=$3)
		End if 
	End if 
	If (ch1=1)
		If (ch0=1)
			If ((ch2=1) | (ch3=1) | (ch4=1) | (ch5=1) | (ch6=1))
				QUERY:C277($1->;  | ; $2->=$4; *)
			Else 
				QUERY:C277($1->;  | ; $2->=$4)
			End if 
		Else 
			If ((ch2=1) | (ch3=1) | (ch4=1) | (ch5=1) | (ch6=1))
				QUERY:C277($1->; $2->=$4; *)
			Else 
				QUERY:C277($1->; $2->=$4)
			End if 
		End if 
	End if 
	If (ch2=1)
		If ((ch0=1) | (ch1=1))
			If ((ch3=1) | (ch4=1) | (ch5=1) | (ch6=1))
				QUERY:C277($1->;  | ; $2->=$5; *)
			Else 
				QUERY:C277($1->;  | ; $2->=$5)
			End if 
		Else 
			If ((ch3=1) | (ch4=1) | (ch5=1) | (ch6=1))
				QUERY:C277($1->; $2->=$5; *)
			Else 
				QUERY:C277($1->; $2->=$5)
			End if 
		End if 
	End if 
	If (ch3=1)
		If ((ch4=1) | (ch5=1))
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
		If ((ch5=1) | (ch6=1))
			If ((ch0=1) | (ch1=1) | (ch2=1) | (ch3=1))
				QUERY:C277($1->;  | ; $2->=$7; *)
			Else 
				QUERY:C277($1->; $2->=$7; *)
			End if 
		Else 
			If ((ch0=1) | (ch1=1) | (ch2=1) | (ch3=1))
				QUERY:C277($1->;  | ; $2->=$7)
			Else 
				QUERY:C277($1->; $2->=$7)
			End if 
		End if 
	End if 
	If (ch5=1)
		If (ch6=1)
			If ((ch0=1) | (ch1=1) | (ch2=1) | (ch3=1) | (ch4=1))
				QUERY:C277($1->;  | ; $2->=$8; *)
			Else 
				QUERY:C277($1->; $2->=$8; *)
			End if 
		Else 
			If ((ch0=1) | (ch1=1) | (ch2=1) | (ch3=1) | (ch4=1))
				QUERY:C277($1->;  | ; $2->=$8)
			Else 
				QUERY:C277($1->; $2->=$8)
			End if 
		End if 
	End if 
	If (ch6=1)
		If ((ch0=1) | (ch1=1) | (ch2=1) | (ch3=1) | (ch4=1) | (ch5=1))
			QUERY:C277($1->;  | ; $2->=$9)
		Else 
			QUERY:C277($1->; $2->=$9)
		End if 
	End if 
	Master2($1)
	
End if 
ERR_MethodTrackerReturn("Sel c06"; $_t_oldMethodName)
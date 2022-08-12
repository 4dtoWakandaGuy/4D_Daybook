//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_SIDate
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
	C_DATE:C307($3; $4)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_SIDate")
MESSAGES OFF:C175
//Sel_SIDate
If (($3>!00-00-00!) | ($4>!00-00-00!))
	Case of 
		: ($4=!00-00-00!)
			QUERY:C277($1->; $2->>=$3)
		: ($3=!00-00-00!)
			QUERY:C277($1->; $2-><=$4)
		: ($3=$4)
			QUERY:C277($1->; $2->=$3)
		Else 
			QUERY:C277($1->; $2->>=$3; *)
			QUERY:C277($1->;  & ; $2-><=$4)
	End case 
	Master2($1)
End if 
MESSAGES ON:C181
ERR_MethodTrackerReturn("Sel_SIDate"; $_t_oldMethodName)
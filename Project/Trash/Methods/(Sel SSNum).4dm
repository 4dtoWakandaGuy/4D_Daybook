//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel_SSNum
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
	C_POINTER:C301($1; $2)
	C_REAL:C285($3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_SSNum")
MESSAGES OFF:C175
If (($3#0) | ($4#0))
	Master_UseSS($1)
	Case of 
		: ($4=0)
			QUERY SELECTION:C341($1->; $2->>=$3)
		: ($3=0)
			QUERY SELECTION:C341($1->; $2-><=$4)
		: ($3=$4)
			QUERY SELECTION:C341($1->; $2->=$3)
		Else 
			QUERY SELECTION:C341($1->; $2->>=$3; *)
			QUERY SELECTION:C341($1->;  & ; $2-><=$4)
	End case 
	Master2($1)
	
End if 
MESSAGES ON:C181
ERR_MethodTrackerReturn("Sel_SSNum"; $_t_oldMethodName)
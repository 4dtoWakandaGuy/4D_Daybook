//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel_SSDate
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

$_t_oldMethodName:=ERR_MethodTracker("Sel_SSDate")
If (($3#!00-00-00!) | ($4#!00-00-00!))
	If ($4=!00-00-00!)
		//$4:=!31/12/99!
	End if 
	Master_UseSS($1)
	Case of 
		: ($4=!00-00-00!)
			QUERY SELECTION:C341($1->; $2->>=$3)
		: ($3=!00-00-00!)
			QUERY SELECTION:C341($1->; $2-><=$4)
		: ($3=$4)
			QUERY SELECTION:C341($1->; $2->=$3)
		Else 
			QUERY SELECTION:C341($1->; $2->>=$3; *)
			If ($4>!00-00-00!)
				QUERY SELECTION:C341($1->; $2->>=$3; *)
				QUERY SELECTION:C341($1->;  & ; $2-><=$4)
			Else 
				QUERY SELECTION:C341($1->; $2->>=$3)
			End if 
			
	End case 
	Master2($1)
End if 
ERR_MethodTrackerReturn("Sel_SSDate"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Load_One
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/04/2011 20:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Load_One")
//Load_One
Sel_LinkMess($1)
If (OK=1)
	CREATE EMPTY SET:C140($2->; "Master")
	//FIRST RECORD($1->)
	RELATE ONE SELECTION:C349($1->; $2->)
	If (False:C215)
		While (Not:C34(End selection:C36($1->)))
			RELATE ONE:C42($2->)
			ADD TO SET:C119($2->; "Master")
			NEXT RECORD:C51($1->)
		End while 
	Else 
		CREATE SET:C116($2->; "Master")
	End if 
	INTERSECTION:C121("Master"; $3; "Master")
	USE SET:C118("Master")
Else 
	USE SET:C118($3)
	CREATE SET:C116($2->; "Master")
End if 
ERR_MethodTrackerReturn("Load_One"; $_t_oldMethodName)
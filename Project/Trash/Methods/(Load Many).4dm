//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Load Many
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/06/2010 09:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAny)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Load Many")
//Load Many
Sel_LinkMess($1)
If (OK=1)
	CREATE EMPTY SET:C140($1->; "Master")
	RELATE MANY SELECTION:C340($2->)
	CREATE SET:C116($1->; "Extra")
	UNION:C120("Master"; "Extra"; "Master")
	If (False:C215)
		FIRST RECORD:C50($1->)
		While (Not:C34(End selection:C36($1->)))
			RELATE MANY:C262($2->)
			CREATE SET:C116($1->; "Extra")
			UNION:C120("Master"; "Extra"; "Master")
			NEXT RECORD:C51($1->)
		End while 
	End if 
	INTERSECTION:C121("Master"; $3; "Master")
	USE SET:C118("Master")
Else 
	USE SET:C118($3)
	CREATE SET:C116($1->; "Master")
End if 
CLEAR SET:C117($3)
vAny:=1
ERR_MethodTrackerReturn("Load Many"; $_t_oldMethodName)
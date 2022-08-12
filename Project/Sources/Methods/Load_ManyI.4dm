//%attributes = {}
If (False:C215)
	//Project Method Name:      Load_ManyI
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
	C_LONGINT:C283(vAny)
	C_POINTER:C301($1; $2; $4; $5)
	C_TEXT:C284($_t_oldMethodName; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Load_ManyI")
//Load_ManyI
Sel_LinkMess($1)
If (OK=1)
	CREATE EMPTY SET:C140($5->; "Master")
	FIRST RECORD:C50($1->)
	While (Not:C34(End selection:C36($1->)))
		QUERY:C277($5->; $4->=$2->)
		CREATE SET:C116($5->; "Extra")
		UNION:C120("Master"; "Extra"; "Master")
		NEXT RECORD:C51($1->)
	End while 
	INTERSECTION:C121("Master"; $3; "Master")
	USE SET:C118("Master")
Else 
	USE SET:C118($3)
	CREATE SET:C116($5->; "Master")
End if 
CLEAR SET:C117($3)
vAny:=1
ERR_MethodTrackerReturn("Load_ManyI"; $_t_oldMethodName)
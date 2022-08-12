//%attributes = {}
If (False:C215)
	//Project Method Name:      Load_ManyINS
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
	C_LONGINT:C283($5)
	C_POINTER:C301($1; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Load_ManyINS")
//Load_ManyI - NO SET
If (Count parameters:C259=4)
	Sel_LinkMess($1)
Else 
	OK:=1
End if 
If (OK=1)
	CREATE EMPTY SET:C140($4->; "Master")
	FIRST RECORD:C50($1->)
	While (Not:C34(End selection:C36($1->)))
		QUERY:C277($4->; $3->=$2->)
		CREATE SET:C116($4->; "Extra")
		UNION:C120("Master"; "Extra"; "Master")
		NEXT RECORD:C51($1->)
	End while 
	USE SET:C118("Master")
Else 
	REDUCE SELECTION:C351($4->; 0)
End if 
ERR_MethodTrackerReturn("Load_ManyINS"; $_t_oldMethodName)
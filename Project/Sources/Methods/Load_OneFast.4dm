//%attributes = {}
If (False:C215)
	//Project Method Name:      Load_OneFast
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/08/2009 10:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($i; $No; $_l_Type)
	C_POINTER:C301($1; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Load_OneFast")
//Load_OneFast

Sel_LinkMess($1)
If (OK=1)
	Join_SelDV($1; $2; $3; $4)
	CREATE SET:C116($3->; "Master")
	If (Count parameters:C259>=5)
		INTERSECTION:C121("Master"; $5; "Master")
	End if 
	USE SET:C118("Master")
Else 
	USE SET:C118($5)
	CREATE SET:C116($3->; "Master")
End if 
ERR_MethodTrackerReturn("Load_OneFast"; $_t_oldMethodName)
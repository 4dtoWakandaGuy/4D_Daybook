//%attributes = {}
If (False:C215)
	//Project Method Name:      SelOr_2
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
	C_BOOLEAN:C305(<>SelOr)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SelOr_2")
If ((<>SelOr) & (vAutoFind=False:C215))
	If (Records in selection:C76($1->)#0)
		CREATE SET:C116($1->; "Extra")
		UNION:C120("Master2"; "Extra"; "Master2")
	End if 
End if 
ERR_MethodTrackerReturn("SelOr_2"; $_t_oldMethodName)
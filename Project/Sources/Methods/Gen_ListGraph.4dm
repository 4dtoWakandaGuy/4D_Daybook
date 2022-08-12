//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ListGraph
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 12:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; $NS)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ListGraph")
//Gen_ListGraph
If (Count parameters:C259>=1)
	If (Records in set:C195("Userset")>0)
		CUT NAMED SELECTION:C334($1->; "$NS")
		$NS:=True:C214
		USE SET:C118("Userset")
	Else 
		$NS:=False:C215
	End if 
	Gen_PallHide
	SET AUTOMATIC RELATIONS:C310(True:C214; True:C214)
	<>SYS_bo_CurrentWindowModal:=True:C214
	_O_GRAPH TABLE:C148($1->)
	<>SYS_bo_CurrentWindowModal:=False:C215
	SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
	Gen_PallShow
	If ($NS)
		USE NAMED SELECTION:C332("$NS")
	End if 
Else 
	Gen_Alert("This method(Gen_ListGraph has been modified and now requires a parameter")
	
End if 
ERR_MethodTrackerReturn("Gen_ListGraph"; $_t_oldMethodName)
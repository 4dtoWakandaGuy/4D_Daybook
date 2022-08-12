//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_ImitMSlists
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
	//ARRAY LONGINT(<>IME_al_NamedSelectionTimestamp;0)
	//ARRAY TEXT(<>IME_at_NamedSelections;0)
	C_BOOLEAN:C305(<>IME_bo_NamedSelectionsInited)
	C_LONGINT:C283(<>IME_l_ListTimeLimit)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_ImitMSlists")

ARRAY TEXT:C222(<>IME_at_NamedSelections; 0)
ARRAY LONGINT:C221(<>IME_al_NamedSelectionTimestamp; 0)
<>IME_l_ListTimeLimit:=1522/4/2
<>IME_bo_NamedSelectionsInited:=True:C214
ERR_MethodTrackerReturn("IME_ImitMSlists"; $_t_oldMethodName)
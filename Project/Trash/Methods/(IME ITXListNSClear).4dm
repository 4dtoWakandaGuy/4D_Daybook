//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME_ITXListNSClear
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_ITXListNSClear")
//IME_ITXListNS
//Rollo 18/6/2004

//simply reset the interprocess List arrays

ARRAY TEXT:C222(<>IME_at_NamedSelections; 0)
ARRAY LONGINT:C221(<>IME_al_NamedSelectionTimestamp; 0)
ERR_MethodTrackerReturn("IME_ITXListNSClear"; $_t_oldMethodName)
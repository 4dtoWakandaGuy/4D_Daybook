If (False:C215)
	//object Name: [COMPANIES]dComp_Sel.oRecordStateDropDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WS_al_RecordStatesID;0)
	//ARRAY TEXT(WS_at_RecordStates;0)
	C_LONGINT:C283(VrStateL)
	C_TEXT:C284($_t_oldMethodName; VrState)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dComp_Sel.oRecordStateDropDown"; Form event code:C388)
If (WS_at_RecordStates>0)
	VrStateL:=WS_al_RecordStatesID{WS_at_RecordStates}
	VrState:=WS_at_RecordStates{WS_at_RecordStates}
	WS_at_RecordStates:=0
	
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dComp_Sel.oRecordStateDropDown"; $_t_oldMethodName)

//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SP_al_TargetType;0)
	//ARRAY TEXT(SP_at_TargetPipelineStatus;0)
	//ARRAY TEXT(SP_at_tTargetType;0)
	C_BOOLEAN:C305(<>NoUpdate)
	C_DATE:C307(SP_D_TFilterFromDate; SP_D_TFilterToDate)
	C_LONGINT:C283($_l_event; SP_l_tFilterType; SP_l_tGroupID; SP_l_tPersonelID; SP_l_tSalesProjectionStateID)
	C_TEXT:C284($_t_oldMethodName; SP_t_tFilterStatus; SP_t_AdHocName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Pop-up/Drop-down List2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SP_at_tTargetType>0)
			SP_t_tFilterStatus:=SP_at_TargetPipelineStatus{SP_at_tTargetType}
			SP_l_tFilterType:=SP_al_TargetType{SP_at_tTargetType}
			<>NoUpdate:=False:C215
			
			SP_FindTargets(SP_l_tPersonelID; SP_l_tGroupID; SP_t_AdHocName; SP_D_TFilterFromDate; SP_D_TFilterToDate; ->SP_l_tSalesProjectionStateID; SP_l_tFilterType)
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.Pop-up/Drop-down List2"; $_t_oldMethodName)

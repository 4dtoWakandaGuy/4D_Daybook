If (False:C215)
	//object Name: [USER]SVS_EditProductInvolved.oitemForRepair
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 11:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SVS_at_CallLocations;0)
	//ARRAY TEXT(SVS_at_RepairStatus;0)
	//ARRAY TEXT(SVS_at_ServiceSeverity;0)
	//ARRAY TEXT(SVS_at_ServiceSymptoms;0)
	//ARRAY TEXT(SVS_at_SIStatus;0)
	//ARRAY TEXT(SVS_at_WarrantyStatus;0)
	C_LONGINT:C283($_l_event; SVS_l_ItemForRepair)
	C_TEXT:C284($_t_oldMethodName; SVS_t_PartsStatus; SVS_t_RepairStatus; SVS_t_Severity; SVS_t_Symptom; SVS_t_FaultNote)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SVS_EditProductInvolved.oitemForRepair"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SVS_l_ItemForRepair=1)
			OBJECT SET ENTERABLE:C238(SVS_t_Symptom; False:C215)
			OBJECT SET ENTERABLE:C238(SVS_t_Severity; False:C215)
			OBJECT SET ENTERABLE:C238(SVS_t_PartsStatus; False:C215)
			OBJECT SET ENTERABLE:C238(SVS_t_RepairStatus; False:C215)
			OBJECT SET ENTERABLE:C238(SVS_t_FaultNote; True:C214)
			OBJECT SET VISIBLE:C603(SVS_at_WarrantyStatus; True:C214)
			OBJECT SET VISIBLE:C603(SVS_at_CallLocations; True:C214)
			OBJECT SET VISIBLE:C603(SVS_at_ServiceSymptoms; True:C214)
			OBJECT SET VISIBLE:C603(SVS_at_ServiceSeverity; True:C214)
			OBJECT SET VISIBLE:C603(SVS_at_SIStatus; True:C214)
			OBJECT SET VISIBLE:C603(SVS_at_RepairStatus; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SVS_EditProductInvolved.oitemForRepair"; $_t_oldMethodName)

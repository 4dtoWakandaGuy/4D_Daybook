If (False:C215)
	//object Name: [USER]Qualities_Pallette.oinfogrouppopup1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(QV_bo_AddAllowed; QV_bo_AlPopulated)
	C_TEXT:C284($_t_oldMethodName; QV_t_QualitiesGroupName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Qualities_Pallette.oinfogrouppopup1"; Form event code:C388)

If (QV_bo_AlPopulated)
	//the al was already populated so save it first
	CONFIRM:C162("Save "+QV_t_QualitiesGroupName+"?"; "Yes"; "No")
	If (OK=1)
		QV_SaveFromPowerview(QV_t_QualitiesGroupName)
	End if 
End if 
If (QV_bo_AddAllowed)
	
	QV_palletePowerviewSetup
	
	
End if 

QV_GroupPopUpScript
ERR_MethodTrackerReturn("OBJ [USER].Qualities_Pallette.oinfogrouppopup1"; $_t_oldMethodName)

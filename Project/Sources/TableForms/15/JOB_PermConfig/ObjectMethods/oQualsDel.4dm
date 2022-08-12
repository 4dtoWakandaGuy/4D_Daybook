If (False:C215)
	//object Name: [USER]JOB_PermConfig.oQualsDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:24
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_lb_QualityNames;0)
	//ARRAY LONGINT(QV_al_QualitySubGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityItemsDeleted;0)
	//ARRAY TEXT(QV_at_QualitySubGroups;0)
	//ARRAY TEXT(QV_at_QualitySubGroupsNM;0)
	C_BOOLEAN:C305(JOB_bo_ConfigisModified)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].JOB_PermConfig.oQualsDel"; Form event code:C388)

LISTBOX GET CELL POSITION:C971(QV_lb_QualityNames; $_l_Column; $_l_Row)
If ($_l_Row>0)
	
	Gen_Confirm("Delete "+QV_at_QualitySubGroupsNM{$_l_Row}; "No"; "Yes")
	If (OK=0)
		APPEND TO ARRAY:C911(QV_al_QualityItemsDeleted; QV_al_QualitySubGroupsIDs{$_l_Row})
		DELETE FROM ARRAY:C228(QV_at_QualitySubGroupsNM; $_l_Row)
		DELETE FROM ARRAY:C228(QV_al_QualitySubGroupsIDs; $_l_Row)
		DELETE FROM ARRAY:C228(QV_at_QualitySubGroups; $_l_Row)
		JOB_bo_ConfigisModified:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].JOB_PermConfig.oQualsDel"; $_t_oldMethodName)

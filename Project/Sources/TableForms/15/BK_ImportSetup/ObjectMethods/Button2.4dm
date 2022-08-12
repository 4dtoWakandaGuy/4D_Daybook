If (False:C215)
	//object Name: [USER]BK_ImportSetup.Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_BKAssModel1IDS;0)
	//ARRAY LONGINT(DM_al_BKAssModel2IDS;0)
	//ARRAY LONGINT(DM_al_BKDataDefaults;0)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	C_LONGINT:C283($_l_ModelID; $_l_ModelRow; DM_l_BKDataModelID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ImportSetup.Button2"; Form event code:C388)
If (DM_l_BKDataModelID>0)
	$_l_ModelRow:=Find in array:C230(DM_al_BKModelIDS; DM_l_BKDataModelID)
	
	$_l_ModelID:=BK_EditDataModel(DM_l_BKDataModelID; DM_al_BKAssModel1IDS{$_l_ModelRow}; DM_al_BKAssModel2IDS{$_l_ModelRow}; DM_at_BKModelNames{$_l_ModelRow}; DM_al_BKDataDefaults{$_l_ModelRow})
	
Else 
	Gen_Alert("You must select a data model first")
End if 
ERR_MethodTrackerReturn("OBJ [USER].BK_ImportSetup.Button2"; $_t_oldMethodName)

If (False:C215)
	//object Name: [USER]Qualities_Pallette.Variable8
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
	//ARRAY LONGINT(AA_al_SubListItemsPOPIDs;0)
	//ARRAY LONGINT(QV_al_QualityYears;0)
	//ARRAY REAL(QV_ar_QualityLevels;0)
	//ARRAY TEXT(AA_at_SubSublistPOPNMs;0)
	//ARRAY TEXT(QV_at_GroupsPopUPNM;0)
	C_BOOLEAN:C305(QV_bo_AddAllowed)
	C_LONGINT:C283(Badd; BDelete; QV_l_CurrentMode)
	C_TEXT:C284($_t_oldMethodName; QV_t_QualitiesGroupName; QV_t_QualityDescription; QV_t_QualityName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Qualities_Pallette.Variable8"; Form event code:C388)
If (QV_bo_AddAllowed)
	Case of 
		: (QV_l_CurrentMode=3)
			//ignore everything else
			ARRAY TEXT:C222(AA_at_SubSublistPOPNMs; 0)
			ARRAY LONGINT:C221(AA_al_SubListItemsPOPIDs; 0)
			OBJECT SET VISIBLE:C603(*; "oSubListQualityNames"; False:C215)
			OBJECT SET ENTERABLE:C238(*; "oQualitiesGroupName"; True:C214)
			OBJECT SET ENTERABLE:C238(*; "oQualityName"; True:C214)
			OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; True:C214)
			// SET ENTERABLE(QV_R_QualityLevel;True)
			OBJECT SET VISIBLE:C603(*; "oQualityLevelsDropDown"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oSubListQualityNames"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oQualityYearsDropDown"; True:C214)  //NG Checked April 2020
			GOTO OBJECT:C206(*; "oQualityName")
			OBJECT SET TITLE:C194(*; "oAddQualityButton"; "Save")
			OBJECT SET TITLE:C194(*; "oDeleteQualityButton"; "Delete")
			OBJECT SET ENABLED:C1123(*; "oDeleteQualityButton"; False:C215)
			
			
	End case 
End if 
ERR_MethodTrackerReturn("OBJ [USER].Qualities_Pallette.Variable8"; $_t_oldMethodName)

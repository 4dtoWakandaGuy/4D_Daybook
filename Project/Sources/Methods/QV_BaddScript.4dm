//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_BaddScript
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
	//ARRAY LONGINT(AA_al_SubListItemsPOPIDs;0)
	//ARRAY LONGINT(QV_al_QualityYear;0)
	//ARRAY LONGINT(QV_al_QualityYears;0)
	//ARRAY REAL(QV_ar_QualityLevel;0)
	//ARRAY REAL(QV_ar_QualityLevels;0)
	//ARRAY TEXT(AA_at_SubSublistPOPNMs;0)
	//ARRAY TEXT(QV_at_GroupsPopUPNM;0)
	C_BOOLEAN:C305(QV_bo_AddAllowed; QV_bo_Modified)
	C_LONGINT:C283(Badd; BDelete; Bedit; QV_HL_QualitiesList; QV_l_CurrentMode; QV_l_QualityYear; QV_l_SelectedQualityID)
	C_REAL:C285(QV_R_QualityLevel)
	C_TEXT:C284($_t_oldMethodName; QV_t_QualitiesGroupName; QV_t_QualityDescription; QV_t_QualityName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_BaddScript")
//this is the script of the button to save an item
If (QV_bo_AddAllowed)
	If (Is a list:C621(QV_HL_QualitiesList))
		Case of 
			: (QV_l_CurrentMode=1)
				//there is no current loaded ITEM
				QV_l_SelectedQualityID:=-1
				QV_t_QualitiesGroupName:=""
				QV_t_QualityName:=""
				QV_t_QualityDescription:=""
				QV_R_QualityLevel:=0
				QV_l_QualityYear:=0
				ARRAY TEXT:C222(AA_at_SubSublistPOPNMs; 0)
				ARRAY LONGINT:C221(AA_al_SubListItemsPOPIDs; 0)
				OBJECT SET VISIBLE:C603(AA_at_SubSublistPOPNMs; False:C215)
				OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; True:C214)
				OBJECT SET ENTERABLE:C238(QV_t_QualityName; True:C214)
				OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; True:C214)
				// SET ENTERABLE(QV_R_QualityLevel;True)
				OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; True:C214)
				OBJECT SET VISIBLE:C603(*; "Picture27"; True:C214)
				OBJECT SET VISIBLE:C603(QV_at_GroupsPopUPNM; True:C214)
				OBJECT SET VISIBLE:C603(*; "Picture28"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture25"; True:C214)
				OBJECT SET VISIBLE:C603(*; "Picture26"; True:C214)
				OBJECT SET VISIBLE:C603(QV_al_QualityYears; True:C214)
				// SET ENTERABLE(QV_l_QualityYear;True)
				GOTO OBJECT:C206(QV_t_QualityName)
				OBJECT SET TITLE:C194(Badd; "Save")
				OBJECT SET TITLE:C194(BDelete; "Clear")
				//_O_DISABLE BUTTON(Bedit)
				OBJECT SET ENABLED:C1123(Bedit; False:C215)
				//_O_ENABLE BUTTON(Bdelete)
				OBJECT SET ENABLED:C1123(Bdelete; True:C214)
				QV_l_CurrentMode:=2
				
			: (QV_l_CurrentMode=2)
				//UNSAVED ITEM IS LOADED
				QV_bo_Modified:=True:C214
				QV_SaveCurrentQuality(False:C215; QV_l_SelectedQualityID)
				QV_l_SelectedQualityID:=0
				QV_t_QualitiesGroupName:=""
				QV_t_QualityName:=""
				QV_t_QualityDescription:=""
				QV_R_QualityLevel:=0
				QV_l_QualityYear:=0
				OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; False:C215)
				OBJECT SET ENTERABLE:C238(QV_t_QualityName; False:C215)
				OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; False:C215)
				ARRAY TEXT:C222(AA_at_SubSublistPOPNMs; 0)
				ARRAY LONGINT:C221(AA_al_SubListItemsPOPIDs; 0)
				OBJECT SET VISIBLE:C603(AA_at_SubSublistPOPNMs; False:C215)
				// SET ENTERABLE(QV_R_QualityLevel;False)
				OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture25"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture26"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture27"; False:C215)
				OBJECT SET VISIBLE:C603(QV_at_GroupsPopUPNM; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture28"; False:C215)
				OBJECT SET VISIBLE:C603(QV_al_QualityYears; False:C215)
				QV_al_QualityYear:=0
				QV_ar_QualityLevel:=0
				GOTO OBJECT:C206(QV_HL_QualitiesList)
				OBJECT SET TITLE:C194(Badd; "Add")
				OBJECT SET TITLE:C194(BDelete; "Delete")
				//_O_DISABLE BUTTON(Bedit)
				OBJECT SET ENABLED:C1123(Bedit; False:C215)
				//_O_DISABLE BUTTON(BDelete)
				OBJECT SET ENABLED:C1123(BDelete; False:C215)
				QV_l_CurrentMode:=1
			: (QV_l_CurrentMode=3)
				//an existing item is loaded(from the QV_HL_QualitiesList)
				QV_bo_Modified:=True:C214
				QV_SaveCurrentQuality(False:C215; QV_l_SelectedQualityID)
				QV_l_SelectedQualityID:=-1
				QV_t_QualitiesGroupName:=""
				QV_t_QualityName:=""
				QV_t_QualityDescription:=""
				QV_R_QualityLevel:=0
				QV_l_QualityYear:=0
				ARRAY TEXT:C222(AA_at_SubSublistPOPNMs; 0)
				ARRAY LONGINT:C221(AA_al_SubListItemsPOPIDs; 0)
				
				OBJECT SET VISIBLE:C603(AA_at_SubSublistPOPNMs; False:C215)
				OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; False:C215)
				OBJECT SET ENTERABLE:C238(QV_t_QualityName; False:C215)
				OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; False:C215)
				// SET ENTERABLE(QV_R_QualityLevel;False)
				OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture25"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture26"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture27"; False:C215)
				OBJECT SET VISIBLE:C603(QV_at_GroupsPopUPNM; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture28"; False:C215)
				OBJECT SET VISIBLE:C603(QV_al_QualityYears; False:C215)
				QV_al_QualityYear:=0
				QV_ar_QualityLevel:=0
				GOTO OBJECT:C206(QV_HL_QualitiesList)
				OBJECT SET TITLE:C194(Badd; "Add")
				OBJECT SET TITLE:C194(BDelete; "Delete")
				
				QV_l_CurrentMode:=1
				//_O_DISABLE BUTTON(Bedit)
				//_O_DISABLE BUTTON(BDelete)
				OBJECT SET ENABLED:C1123(Bedit; False:C215)
				OBJECT SET ENABLED:C1123(BDelete; False:C215)
				
		End case 
		
		
		
		
		
	End if 
End if 
ERR_MethodTrackerReturn("QV_BaddScript"; $_t_oldMethodName)

If (False:C215)
	//object Name: [USER]SD2_TabSettingForm.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:23
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_ActionInclude;0)
	//ARRAY LONGINT(SD_al_DocIncludes;0)
	//ARRAY LONGINT(SD_al_TabIDs;0)
	//ARRAY LONGINT(SD2_al_TabIncludes;0)
	//ARRAY TEXT(SD2_at_TabNames;0)
	C_BOOLEAN:C305(SD2_bo_SaveWindow)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray; CB_IncludeDocument; SD_l_CurrentTab)
	C_TEXT:C284($_t_oldMethodName; SD2_t_TabName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_TabSettingForm.Variable3"; Form event code:C388)
If (SD_l_CurrentTab#0)
	Case of 
		: (SD_l_CurrentTab<0)
			//It is a new tab any way
			
			
			$_l_SizeofArray:=Size of array:C274(SD2_al_TabIncludes)
			DELETE FROM ARRAY:C228(SD_al_TabIDs; Size of array:C274(SD_al_TabIDs); 1)
			DELETE FROM ARRAY:C228(SD2_at_TabNames; Size of array:C274(SD2_at_TabNames); 1)
			DELETE FROM ARRAY:C228(SD2_al_TabIncludes; Size of array:C274(SD2_al_TabIncludes); 1)
			DELETE FROM ARRAY:C228(SD_al_DocIncludes; Size of array:C274(SD_al_DocIncludes); 1)
			
			
		: (SD_l_CurrentTab>0)
			//update the tab
			
			Gen_Confirm("Are you sure you wish to remove the tab "+SD2_at_TabNames{SD_l_CurrentTab}+"?"; "No"; "Yes")
			If (OK=0)
				SD2_bo_SaveWindow:=True:C214
				DELETE FROM ARRAY:C228(SD_al_TabIDs; SD_l_CurrentTab; 1)
				DELETE FROM ARRAY:C228(SD2_at_TabNames; SD_l_CurrentTab; 1)
				DELETE FROM ARRAY:C228(SD2_al_TabIncludes; SD_l_CurrentTab; 1)
				DELETE FROM ARRAY:C228(SD_al_DocIncludes; SD_l_CurrentTab; 1)
				
			End if 
			SD_l_CurrentTab:=0
			SD2_t_TabName:=""
			OBJECT SET VISIBLE:C603(*; "oLabelTabIncludes"; False:C215)
			SD_l_CurrentTab:=0
			SD2_at_TabNames:=0
			CB_IncludeDocument:=0
			For ($_l_Index; 1; Size of array:C274(SD_al_ActionInclude))
				SD_al_ActionInclude{$_l_Index}:=0
			End for 
			
	End case 
Else 
	Gen_Alert("You must select an item to remove!")
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_TabSettingForm.Variable3"; $_t_oldMethodName)

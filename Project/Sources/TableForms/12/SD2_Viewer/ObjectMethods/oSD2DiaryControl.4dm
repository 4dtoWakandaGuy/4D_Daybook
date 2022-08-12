If (False:C215)
	//object Method Name:      SD2_at_DiaryTabs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_DiaryTabIDS;0)
	//ARRAY LONGINT(SD2_al_TabIds;0)
	//ARRAY TEXT(SD2_at_DiaryTabs;0)
	//ARRAY TEXT(SD2_at_TabNames;0)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_ExistingTabID; $_l_TabRef; SD2_l_PREFSROW)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_Viewer.oSD2DiaryControl"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_TabRef:=Find in array:C230(SD2_at_TabNames; SD2_at_DiaryTabs{SD2_at_DiaryTabs})
		If ($_l_TabRef>0)
			If (SD2_l_PREFSROW>0)
				$_l_ExistingTabID:=Find in array:C230(SD2_al_DiaryTabIDS{SD2_l_PREFSROW}; SD2_al_TabIds{$_l_TabRef})
				SD2_SearchforWorkFlow(-><>PER_l_CurrentUserID; SD2_al_TabIds{$_l_TabRef})
				
			Else 
			End if 
			
			
		Else 
		End if 
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_Viewer.oSD2DiaryControl"; $_t_oldMethodName)

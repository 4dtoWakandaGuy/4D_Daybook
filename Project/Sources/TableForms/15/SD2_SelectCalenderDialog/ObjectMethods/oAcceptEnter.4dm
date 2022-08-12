If (False:C215)
	//object Name: [USER]SD2_SelectCalenderDialog.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_DiaryOwnersPeople;0)
	//ARRAY TEXT(SD2_at_DiaryOwnersResources;0)
	C_LONGINT:C283(WS_l_OpenCalander)
	C_TEXT:C284($_t_oldMethodName; SD2_t_OpenDiaryPersonIdent)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_SelectCalenderDialog.Variable3"; Form event code:C388)

WS_l_OpenCalander:=0
If (SD2_at_DiaryOwnersPeople>0)
	SD2_t_OpenDiaryPersonIdent:=SD2_at_DiaryOwnersResources{SD2_at_DiaryOwnersPeople}
	WS_l_OpenCalander:=1
Else 
	If (SD2_at_DiaryOwnersResources>0)
		SD2_t_OpenDiaryPersonIdent:=SD2_at_DiaryOwnersResources{SD2_at_DiaryOwnersResources}
		WS_l_OpenCalander:=1
	End if 
End if 
If (WS_l_OpenCalander=1)
	CANCEL:C270
Else 
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_SelectCalenderDialog.Variable3"; $_t_oldMethodName)

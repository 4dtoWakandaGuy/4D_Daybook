If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.oPersonNameDropDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_DIOPersonnelid;0)
	//ARRAY TEXT(SD_at_DIOPersonnelNAME;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.oPersonNameDropDown"; Form event code:C388)
If (SD_at_DIOPersonnelNAME>0)
	If (SD_al_DIOPersonnelid{SD_at_DIOPersonnelNAME}=-1)
		WS_AddDiaryitemOwner([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
	End if 
	
End if 
SD_at_DIOPersonnelNAME:=1
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.oPersonNameDropDown"; $_t_oldMethodName)
If (False:C215)
	//object Name: [USER]SD2_diaryViewer.Pop-up%2FDrop-down List2
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
	//ARRAY TEXT(SD_at_StatusCodes;0)
	C_REAL:C285(SD2_at_StatusNM)
	C_TEXT:C284($_t_oldMethodName; SD2_t_StatusFIlter)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.Pop-up/Drop-down List2"; Form event code:C388)
If (SD2_at_StatusNM>0)
	SD2_t_StatusFIlter:=SD_at_StatusCodes{SD2_at_StatusNM}
	SD2_at_StatusNM:=0
	//************** commented out 11/07/08 -kmw *************
	//If (SD2_T_SearchValue#"")
	//SD2_DiaryVIewManageView (1;SD2_T_SearchValue)
	//Else
	//SD2_DiaryVIewManageView (-1)
	//End if
	//**************************************************************
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.Pop-up/Drop-down List2"; $_t_oldMethodName)

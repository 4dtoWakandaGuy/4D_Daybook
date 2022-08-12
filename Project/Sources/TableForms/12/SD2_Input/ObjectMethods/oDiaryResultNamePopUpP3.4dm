If (False:C215)
	//object Name: [DIARY]SD2_Input.oDiaryResultNamePopUpP3
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
	//ARRAY TEXT(SD2_at_PlanResultTab;0)
	//ARRAY TEXT(SD2_at_ResultCodes;0)
	//ARRAY TEXT(SD2_at_resultNames;0)
	C_TEXT:C284($_t_oldMethodName; SD2_t_SELResultName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_Input.oDiaryResultNamePopUpP3"; Form event code:C388)

If (SD2_at_resultNames>0)
	[DIARY:12]Result_Code:11:=SD2_at_ResultCodes{SD2_at_resultNames}
	SD2_t_SELResultName:=SD2_at_resultNames{SD2_at_resultNames}
	SD2_DiaryinLPX(->[DIARY:12]Result_Code:11)
	If (Not:C34([DIARY:12]Done:14))
		[DIARY:12]Done:14:=True:C214
		SD2_DiaryinLPX(->[DIARY:12]Done:14)
	End if 
	// and set the result tab to visible
	SD2_at_PlanResultTab:=2
	SD2_SetInterface("SD2_Input"; True:C214; 2)
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_Input.oDiaryResultNamePopUpP3"; $_t_oldMethodName)

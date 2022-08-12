//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_hl_LoadFirstRec
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Expanded; SD_bo_AddingDiaryRecord)
	C_DATE:C307(SD_D_CurrentviewDate; vPosDate; vPosDate2)
	C_LONGINT:C283(<>HLDIARY_RELATEINFO; $_l_CharacterPosition; $_l_ItemReference; $_l_SelectedItemParent; $_l_SublistID; $vsItemRef; bAddBut; SD_l_EditingDiaryRecord; SD_l_HLDayTime; vlItemPos)
	C_REAL:C285(vlMItemPos)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; vDateText; vPosText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_hl_LoadFirstRec")
//SD_hl_LaodFirstRec: loads the first record in the list
If (SD_l_EditingDiaryRecord=1)
	SuperDiary_SaveChk
End if 

<>hlDIARY_RELATEINFO:=0
vlItemPos:=1  // Get the position of the selected item
If (vlItemPos#0)  // Just in case, check the position
	GET LIST ITEM:C378(SD_l_HLDayTime; vlItemPos; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
	$_l_SelectedItemParent:=List item parent:C633(SD_l_HLDayTime; $_l_ItemReference)
	If ($_l_SelectedItemParent>0)
		SELECT LIST ITEMS BY REFERENCE:C630(SD_l_HLDayTime; List item parent:C633(SD_l_HLDayTime; $_l_ItemReference))  // Select the parent item
	End if 
	vlMItemPos:=1
	GET LIST ITEM:C378(SD_l_HLDayTime; vlMItemPos; $vsItemRef; $_t_ItemText)
	SELECT LIST ITEMS BY REFERENCE:C630(SD_l_HLDayTime; $_l_ItemReference)  // Reselect the child item
	//////////_o_REDRAW LIST(SD_l_HLDayTime)
	SD_bo_AddingDiaryRecord:=False:C215
	
	//here need to test if a  record is already loaded
	//what if adding a new record
	//must save/cancel first
	UNLOAD RECORD:C212([DIARY:12])
	READ ONLY:C145([DIARY:12])
	
	bAddBut:=0
	
	OBJECT SET ENTERABLE:C238([DIARY:12]Company_Code:1; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Contact_Code:2; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Date_Do_From:4; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Date_Do_To:33; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Time_Do_From:6; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Time_Do_To:35; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Person:8; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Action_Code:9; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Action_Details:10; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Result_Code:11; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Result_Description:12; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Document_Code:15; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Document_Heading:32; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Script_Code:29; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Units:20; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Value:16; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Job_Code:19; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Stage_Code:21; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Order_Code:26; False:C215)
	
	OBJECT SET ENTERABLE:C238([DIARY:12]Product_Code:13; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Call_Code:25; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Diary_Code:3; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Status:30; False:C215)
	$_l_CharacterPosition:=Position:C15(" :"; $_t_ItemText)
	vPosText:=Substring:C12($_t_ItemText; $_l_CharacterPosition+2)
	vDateText:=Substring:C12($_t_ItemText; 1; 2)
	If (Substring:C12($_t_ItemText; 3; 1)="/") & (Substring:C12($_t_ItemText; 6; 1)="/")
		vPosDate:=Date:C102(Substring:C12($_t_ItemText; 1; 10))
		vPosDate2:=vPosDate
	Else 
		vPosDate2:=Date:C102(vDateText+"/"+String:C10(Month of:C24(SD_D_CurrentviewDate))+"/"+String:C10(Year of:C25(SD_D_CurrentviewDate)))
	End if 
	QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_From:4=SD_D_CurrentviewDate; *)
	QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Details:10=vPosText+"@")
	RELATE ONE:C42([DIARY:12]Company_Code:1)
	WT_hl_DiaryDETAIL2
	If (Records in selection:C76([DIARY:12])>0)
		If ([DIARY:12]Done:14=True:C214)
			
			READ WRITE:C146([DIARY:12])
			LOAD RECORD:C52([DIARY:12])
			OBJECT SET ENTERABLE:C238([DIARY:12]Done:14; True:C214)
		Else 
			
		End if 
	End if 
End if 
//////////_o_REDRAW LIST(SD_l_HLDayTime)
ERR_MethodTrackerReturn("SD_hl_LoadFirstRec"; $_t_oldMethodName)

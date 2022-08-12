If (False:C215)
	//object Name: Object Name:      SD3_DiaryView.oTimeToPopUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Expanded)
	C_LONGINT:C283($_l_event; $_l_ItemReference; $_l_SelectedListItem; $_l_SublistID; SD_HL_l_Hours2)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName)
	C_TIME:C306($_ti_Time)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_Input.oTimeToPopUpP1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		
		
		If ([DIARY:12]Diary_Code:3#"")
			$_l_SelectedListItem:=Selected list items:C379(SD_HL_l_Hours2)
			If ($_l_SelectedListItem>0)
				GET LIST ITEM:C378(SD_HL_l_Hours2; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
				$_ti_Time:=Time:C179(Time string:C180($_l_ItemReference))
				If ([DIARY:12]Done:14=False:C215)
					[DIARY:12]Display_Time_To:54:=$_ti_Time
				Else 
					[DIARY:12]Display_Time_To:54:=$_ti_Time
				End if 
				
				SD2_DiaryinLPX(->[DIARY:12]Display_Time_To:54)
				OBJECT SET VISIBLE:C603(*; "oTimeDuration@"; False:C215)
				
			End if 
			
		End if 
		
		
End case 
SELECT LIST ITEMS BY POSITION:C381(SD_HL_l_Hours2; 0)
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_Input.oTimeToPopUpP1"; $_t_oldMethodName)
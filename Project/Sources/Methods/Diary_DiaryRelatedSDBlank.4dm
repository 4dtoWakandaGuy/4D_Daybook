//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_DiaryRelatedSDBlank
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Expanded)
	C_LONGINT:C283(<>HLDIARY_RELATEINFO; $_l_CountListItems; $_l_ItemReference; $_l_SelectedListItem; $_l_SublistID)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiaryRelatedSDBlank")
//Diary_DiaryRelatedSDBlank - SuperDiary

//◊hlDIARY_RELATEINFO:=0
//◊hlDIARY_RELATEINFO:=New list
If (<>hlDIARY_RELATEINFO<1)
Else 
	OBJECT SET ENTERABLE:C238(<>hlDIARY_RELATEINFO; True:C214)
	$_l_CountListItems:=Count list items:C380(<>hlDIARY_RELATEINFO)
	If ($_l_CountListItems>0)
		For ($_l_SelectedListItem; 1; $_l_CountListItems)
			GET LIST ITEM:C378(<>hlDIARY_RELATEINFO; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
			DELETE FROM LIST:C624(<>hlDIARY_RELATEINFO; $_l_ItemReference; *)
			// Do NOT forget to call REDRAW LIST otherwise the list won't be updated
			////////////_o_REDRAW LIST(<>hlDIARY_RELATEINFO)
			// itEmText:=""
			//itemRef:=◊hlDIARY_RELATEINFO+1
			//APPEND TO LIST(◊hlDIARY_RELATEINFO;itEmText;itemRef;0;False)
			//REDRAW LIST(◊hlDIARY_RELATEINFO)
		End for 
	End if 
End if 
ERR_MethodTrackerReturn("Diary_DiaryRelatedSDBlank"; $_t_oldMethodName)
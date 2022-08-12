If (False:C215)
	//object Name: [USER]SD2_TabSettingForm.Variable7
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
	//ARRAY INTEGER(SD2_ai_GroupIncluded;0)
	ARRAY LONGINT:C221($_al_ItemsToReset; 0)
	//ARRAY LONGINT(SD_al_ActionGroupIncludes;0)
	//ARRAY LONGINT(SD_al_ActionID;0)
	//ARRAY LONGINT(SD_al_ActionInclude;0)
	//ARRAY LONGINT(SD2_al_ActionGroupIDs;0)
	//ARRAY LONGINT(SD2_al_CurrentGroups;0)
	//ARRAY LONGINT(SD2_al_TabIncludes;0)
	//ARRAY TEXT(SD_at_ActionName;0)
	//ARRAY TEXT(SD2_at_ActionGroupNames;0)
	C_LONGINT:C283($_l_ActionItemID; $_l_ActionRow; $_l_ArrayElement; $_l_CurrentWinRefOLD; $_l_GroupID; $_l_GroupItemRow; $_l_GroupItemsIndex; $_l_GroupRow; $_l_Index; $_l_ItemRow; $_l_ObjectBottom)
	C_LONGINT:C283($_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_TabIncludesID; $_l_TabItemsReference; SD_l_CurrentTab; SD2_l_GroupAdd; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_TabSettingForm.Variable7"; Form event code:C388)
//this will display a list of the existing groups. and allow the creation of a new group.
//First we need a list of the groups the current item currently belongs to
If (SD_l_CurrentTab>0)
	
	ARRAY LONGINT:C221(SD2_al_CurrentGroups; 0)
	For ($_l_Index; 1; Size of array:C274(SD2_al_TabIncludes{SD_l_CurrentTab}))
		$_l_TabIncludesID:=SD2_al_TabIncludes{SD_l_CurrentTab}{$_l_Index}
		If ($_l_TabIncludesID<0)  //group
			$_l_ActionRow:=Find in array:C230(SD_al_ActionID; $_l_TabIncludesID)
			If ($_l_ActionRow>0)
				//it should be!
				INSERT IN ARRAY:C227(SD2_al_CurrentGroups; Size of array:C274(SD2_al_CurrentGroups)+1; 1)
				SD2_al_CurrentGroups{Size of array:C274(SD2_al_CurrentGroups)}:=Abs:C99(SD_al_ActionID{$_l_ActionRow})
			End if 
		End if 
		
	End for 
	
	OBJECT GET COORDINATES:C663(SD_al_ActionInclude; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	//not currently visible this button....
	
	WIN_l_CurrentWinRef:=Open window:C153($_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft; $_l_ObjectTop; 1)
	DIALOG:C40([USER:15]; "SD2_GroupEditor")  //NG Jun 2020 this form does not not exist
/*
If (SD2_l_GroupAdd=1)
	
For ($_l_Index;1;Size of array(SD2_ai_GroupIncluded))
If (SD2_ai_GroupIncluded{$_l_Index}=1)
$_l_ActionRow:=Find in array(SD_al_ActionID;-(SD2_al_ActionGroupIDs{$_l_Index}))
If ($_l_ActionRow<0)
$_l_GroupID:=SD2_al_ActionGroupIDs{$_l_Index}
INSERT IN ARRAY(SD_al_ActionID;Size of array(SD_al_ActionID)+1;1)
INSERT IN ARRAY(SD_al_ActionInclude;Size of array(SD_al_ActionInclude)+1;1)
INSERT IN ARRAY(SD_at_ActionName;Size of array(SD_at_ActionName)+1;1)
SD_al_ActionID{Size of array(SD_al_ActionID)}:=-($_l_GroupID)
SD_al_ActionInclude{Size of array(SD_al_ActionInclude)}:=1
$_l_GroupRow:=Find in array(SD2_al_ActionGroupIDs;$_l_GroupID)
SD_at_ActionName{Size of array(SD_at_ActionName)}:="•"+(SD2_at_ActionGroupNames{$_l_GroupRow})
  //And take out the items in that group
For ($_l_GroupItemsIndex;1;Size of array(SD_al_ActionGroupIncludes{$_l_GroupRow}))
$_l_ActionItemID:=SD_al_ActionGroupIncludes{$_l_GroupRow}{$_l_GroupItemsIndex}
$_l_ItemRow:=Find in array(SD_al_ActionID;$_l_ActionItemID)
If ($_l_ItemRow>0)
SD_al_ActionInclude{$_l_ItemRow}:=0
End if 
	
End for 
	
Else 
  //item is already included,, remove it from the note of current groups so we can find any deleted
SD_al_ActionInclude{$_l_ActionRow}:=1
$_l_ActionRow:=Find in array(SD2_al_CurrentGroups;SD2_al_ActionGroupIDs{$_l_Index})
If ($_l_ActionRow>0)
  //it should be
SD2_al_CurrentGroups{$_l_ActionRow}:=0
End if 
	
End if 
End if 
	
End for 
	
  //Here take out and groups removed
For ($_l_Index;1;Size of array(SD2_al_CurrentGroups))
ARRAY LONGINT($_al_ItemsToReset;0)
$_l_ArrayElement:=0
If (SD2_al_CurrentGroups{$_l_Index}#0)
  //Remove group--put the items back as long as they are not in another group
$_l_GroupRow:=Find in array(SD2_al_ActionGroupIDs;SD2_al_CurrentGroups{$_l_Index})
For ($_l_GroupItemsIndex;1;Size of array(SD_al_ActionGroupIncludes{$_l_GroupRow}))
If (SD_al_ActionGroupIncludes{$_l_GroupRow}{$_l_GroupItemsIndex}#0)
$_l_GroupItemRow:=Find in array($_al_ItemsToReset;SD_al_ActionGroupIncludes{$_l_GroupRow}{$_l_GroupItemsIndex})
If ($_l_GroupItemRow<0)
$_l_ArrayElement:=$_l_ArrayElement+1
If ($_l_ArrayElement>Size of array($_al_ItemsToReset))
INSERT IN ARRAY($_al_ItemsToReset;Size of array($_al_ItemsToReset)+1;100)
	
End if 
$_al_ItemsToReset{$_l_ArrayElement}:=SD_al_ActionGroupIncludes{$_l_GroupRow}{$_l_GroupItemsIndex}
End if 
End if 
End for 
$_l_TabItemsReference:=Find in array(SD_al_ActionID;-(SD2_al_CurrentGroups{$_l_Index}))
If ($_l_TabItemsReference>0)  // it should be
SD_al_ActionInclude{$_l_TabItemsReference}:=0
	
End if 
	
End if 
End for 
ARRAY LONGINT($_al_ItemsToReset;$_l_ArrayElement)
	
	
For ($_l_Index;1;Size of array($_al_ItemsToReset))
If ($_al_ItemsToReset{$_l_Index}>0)
$_l_TabItemsReference:=Find in array(SD_al_ActionID;$_al_ItemsToReset{$_l_Index})
If ($_l_TabItemsReference>0)  // it should be
SD_al_ActionInclude{$_l_TabItemsReference}:=0
End if 
End if 
End for 
	
	
	
	
	
	
End if 
CLOSE WINDOW
*/
	
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	
	
End if 
ERR_MethodTrackerReturn("OBJ:SD2_TabSettingForm,BnewGroup"; $_t_oldMethodName)



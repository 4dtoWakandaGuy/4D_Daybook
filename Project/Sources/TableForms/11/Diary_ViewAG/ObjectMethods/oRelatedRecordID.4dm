If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.oRelatedRecordID
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
	//ARRAY LONGINT(SD_al_RelationMenuNums;0)
	//ARRAY TEXT(SD_at_Arrayrelations;0)
	//ARRAY TEXT(SD_at_RelationTypes;0)
	C_LONGINT:C283($_l_RelationMenuRow; SD_l_DescriptionSplitter; SD_l_RelationAdd)
	C_POINTER:C301(SD_ptr_RelationAdd)
	C_TEXT:C284($_t_FIrstCharacter; $_t_oldMethodName; $_t_RelationAdd; SD_t_RelationAdd; SD_t_RelationCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.oRelatedRecordID"; Form event code:C388)
SD_ptr_RelationAdd->:=SD_t_RelationCode
Diary_InD
SD_t_RelationCode:=SD_ptr_RelationAdd->

If (SD_ptr_RelationAdd->#"")
	$_l_RelationMenuRow:=Find in array:C230(SD_al_RelationMenuNums; SD_l_RelationAdd)
	If ($_l_RelationMenuRow>0)
		
		SD_at_Arrayrelations{$_l_RelationMenuRow}:=SD_t_RelationAdd+SD_t_RelationCode
		SD_SetSplitter(->SD_l_DescriptionSplitter)
		
	Else 
		INSERT IN ARRAY:C227(SD_at_Arrayrelations; 9999; 1)
		INSERT IN ARRAY:C227(SD_al_RelationMenuNums; 9999; 1)
		SD_al_RelationMenuNums{Size of array:C274(SD_al_RelationMenuNums)}:=SD_l_RelationAdd
		$_t_RelationAdd:=Lowercase:C14(SD_t_RelationAdd)
		$_t_FIrstCharacter:=Uppercase:C13(Substring:C12($_t_RelationAdd; 1; 1))
		$_t_RelationAdd:=$_t_FIrstCharacter+Substring:C12($_t_RelationAdd; 2; Length:C16($_t_RelationAdd))
		SD_at_Arrayrelations{Size of array:C274(SD_at_Arrayrelations)}:=$_t_RelationAdd+SD_t_RelationCode
		SD_SetSplitter(->SD_l_DescriptionSplitter)
		
	End if 
	OBJECT SET VISIBLE:C603(SD_t_RelationAdd; False:C215)
	OBJECT SET VISIBLE:C603(*; "Pic_Relation"; False:C215)
	OBJECT SET VISIBLE:C603(SD_t_RelationCode; False:C215)
	OBJECT SET VISIBLE:C603(SD_at_RelationTypes; False:C215)
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.oRelatedRecordID"; $_t_oldMethodName)

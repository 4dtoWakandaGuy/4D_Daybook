If (False:C215)
	//object Method Name: DB_OutputForm.oSearchCriteriaButton
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 
	//Created BY: 
	//Date Modified: 
	//Modified By 
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SRCH_at_SearchOptions;0)
	C_BOOLEAN:C305($_bo_useResources)
	C_LONGINT:C283(<>StrLang; $_l_FormEvent; $_l_Index; $_l_PopupSelected; DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_CarriageReturn; $_t_OldMethodName; $_t_PopupMenu; $_t_SearchButtonName; $_t_SearchCloseObject; $_t_SearchCriteriaObject; SD2_t_SearchCriteria; SD2_T_SearchValue)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_OutputForm/oSearchCriteriaButton"; Form event code:C388)
If (False:C215)  // ----------------------------------------------------
End if 
$_t_OldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oSearchCriteriaButton"; Form event code:C388)



//identify object names (dont forget that when duplicate objects !)
//$FocusRing:="oFocusRing"  //focus ring (visible or dont depending on the focus
$_t_SearchButtonName:="oSearchCriteriaButton"  //magnifiing glass used to select criteria
//$_t_SearchCloseObject:="oSearchClearButton"  //close box to clear the critéria
//$_t_SearchCriteriaObject:="oSearchCriteria"  //search criteria grey (help)

$_l_FormEvent:=Form event code:C388
$_bo_useResources:=False:C215

Case of 
		
	: ($_l_FormEvent=On Load:K2:1)
		
	: ($_l_FormEvent=On Alternative Click:K2:36)
		
		$_t_CarriageReturn:=Char:C90(13)
		$_t_PopupMenu:=""
		
		
		//Else
		$_t_PopupMenu:=""
		For ($_l_Index; 1; Size of array:C274(SRCH_at_SearchOptions))
			$_t_PopupMenu:=$_t_PopupMenu+SRCH_at_SearchOptions{$_l_Index}+$_t_CarriageReturn
		End for 
		
		$_l_PopupSelected:=Pop up menu:C542($_t_PopupMenu)
		
		If ($_l_PopupSelected>0)
			SD2_t_SearchCriteria:=SRCH_at_SearchOptions{$_l_PopupSelected}
			SearchPicker SET HELP TEXT("oSearchvalue"; SD2_t_SearchCriteria)
			
		End if 
		
		
		If (SD2_t_SearchCriteria="More Choices") | (SD2_t_SearchCriteria="Advanced Query...")
			//More choices search
			SD2_T_SearchValue:=""
			SRCH_MoreChoices(DB_l_CurrentDisplayedForm)
			
			SD2_t_SearchCriteria:=""
			SearchPicker SET HELP TEXT("oSearchvalue"; SD2_t_SearchCriteria)
			GOTO OBJECT:C206(SD2_T_SearchValue)
		Else 
			OBJECT SET VISIBLE:C603(*; $_t_SearchCriteriaObject; True:C214)
			OBJECT SET VISIBLE:C603(*; $_t_SearchCloseObject; False:C215)
			
			SD2_T_SearchValue:=""
			GOTO OBJECT:C206(SD2_T_SearchValue)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oSearchCriteriaButton"; $_t_OldMethodName)

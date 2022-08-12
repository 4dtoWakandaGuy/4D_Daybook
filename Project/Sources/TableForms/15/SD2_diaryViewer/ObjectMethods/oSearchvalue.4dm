If (False:C215)
	//object Name: [USER]SD2_diaryViewer.oSearchvalue
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
	C_BOOLEAN:C305($_bo_UseReSources; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_REAL:C285(SRCH_r_Timer; SRCH_r_TimerOLD)
	C_TEXT:C284($_t_EditedText; $_t_FocusRingName; $_t_oldMethodName; $_t_SearchButtonName; $_t_SearchCloseName; $_t_SearchCriteriaName; SRCH_t_SearchValue)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.oSearchvalue"; Form event code:C388)


//identify object names (dont forget that when duplicate objects !)
$_t_FocusRingName:="oFocusRing"  //focus ring (visible or dont depending on the focus
$_t_SearchButtonName:="oSearchCriteriaButton"  //magnifiing glass used to select criteria
$_t_SearchCloseName:="oSearchClearButton"  //close box to clear the critéria
$_t_SearchCriteriaName:="oSearchCriteriaButton"  //search criteria grey (help)





$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		OBJECT SET VISIBLE:C603(*; $_t_FocusRingName; False:C215)
		
	: ($_l_event=On After Keystroke:K2:26)
		
		SET TIMER:C645(10)
		
		$_t_EditedText:=Get edited text:C655
		If (Length:C16($_t_EditedText)=1)
			SRCH_r_TimerOLD:=0
			SRCH_r_Timer:=0
		End if 
		
		If ($_t_EditedText#"")
			OBJECT SET VISIBLE:C603(*; $_t_SearchCriteriaName; False:C215)
			OBJECT SET VISIBLE:C603(*; $_t_SearchCloseName; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; $_t_SearchCriteriaName; True:C214)
			OBJECT SET VISIBLE:C603(*; $_t_SearchCloseName; False:C215)
		End if 
		SRCH_t_SearchValue:=$_t_EditedText
		
	: ($_l_event=On Getting Focus:K2:7)
		
		OBJECT SET VISIBLE:C603(*; $_t_FocusRingName; True:C214)
		
	: ($_l_event=On Losing Focus:K2:8)
		
		OBJECT SET VISIBLE:C603(*; $_t_FocusRingName; False:C215)
		
		$_t_EditedText:=Get edited text:C655
		If ($_t_EditedText#"")
			OBJECT SET VISIBLE:C603(*; $_t_SearchCriteriaName; False:C215)
			OBJECT SET VISIBLE:C603(*; $_t_SearchCloseName; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; $_t_SearchCriteriaName; True:C214)
			OBJECT SET VISIBLE:C603(*; $_t_SearchCloseName; False:C215)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.oSearchvalue"; $_t_oldMethodName)

If (False:C215)
	//object Name: [USER]Prod_SelectionPallette.oSearchCriteriaButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 16:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SRCH_at_SearchOptions;0)
	C_BOOLEAN:C305($_bo_UseReSources; DB_bo_NoLoad)
	C_LONGINT:C283(<>StrLang; $_l_event; $_l_Index; $_l_PopupSelected; $_l_TableNumber)
	C_TEXT:C284($_t_CarriageReturn; $_t_FocusRingName; $_t_oldMethodName; $_t_PopupMenu; $_t_SearchButtonName; $_t_SearchCloseName; $_t_SearchCriteriaName; SD2_t_SearchCriteria; SD2_T_SearchValue)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Prod_SelectionPallette.oSearchCriteriaButton"; Form event code:C388)


//identify object names (dont forget that when duplicate objects !)
$_t_FocusRingName:="oFocusRing"  //focus ring (visible or dont depending on the focus
$_t_SearchButtonName:="oSearchCriteriaButton"  //magnifiing glass used to select criteria
$_t_SearchCloseName:="oSearchClearButton"  //close box to clear the critéria
$_t_SearchCriteriaName:="oSearchCriteria"  //search criteria grey (help)

$_l_event:=Form event code:C388

$_bo_UseReSources:=False:C215

Case of 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
	: ($_l_event=On Alternative Click:K2:36)
		
		$_t_CarriageReturn:=Char:C90(13)
		$_t_PopupMenu:=""
		
		If ($_bo_UseReSources)
			
			$_t_PopupMenu:=$_t_PopupMenu+Get indexed string:C510(<>StrLang; 5)+$_t_CarriageReturn
			$_t_PopupMenu:=$_t_PopupMenu+Get indexed string:C510(<>StrLang; 6)+$_t_CarriageReturn
			$_t_PopupMenu:=$_t_PopupMenu+Get indexed string:C510(<>StrLang; 7)+$_t_CarriageReturn
			$_t_PopupMenu:=$_t_PopupMenu+Get indexed string:C510(<>StrLang; 8)+$_t_CarriageReturn
			
			$_l_PopupSelected:=Pop up menu:C542($_t_PopupMenu)
			Case of 
				: ($_l_PopupSelected=1)
					SD2_t_SearchCriteria:=Get indexed string:C510(<>StrLang; 5)
				: ($_l_PopupSelected=2)
					SD2_t_SearchCriteria:=Get indexed string:C510(<>StrLang; 6)
				: ($_l_PopupSelected=3)
					SD2_t_SearchCriteria:=Get indexed string:C510(<>StrLang; 7)
				: ($_l_PopupSelected=4)
					SD2_t_SearchCriteria:=Get indexed string:C510(<>StrLang; 8)
			End case 
			
		Else 
			$_t_PopupMenu:=""
			For ($_l_Index; 1; Size of array:C274(SRCH_at_SearchOptions))
				$_t_PopupMenu:=$_t_PopupMenu+SRCH_at_SearchOptions{$_l_Index}+$_t_CarriageReturn
			End for 
			
			$_l_PopupSelected:=Pop up menu:C542($_t_PopupMenu)
			
			If ($_l_PopupSelected>0)
				SD2_t_SearchCriteria:=SRCH_at_SearchOptions{$_l_PopupSelected}
				
			End if 
			
		End if 
		If (SD2_t_SearchCriteria="More Choices")
			//More choices search
			$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
			SRCH_MoreChoices($_l_TableNumber)
			
			SD2_t_SearchCriteria:=""
			GOTO OBJECT:C206(SD2_T_SearchValue)
		Else 
			OBJECT SET VISIBLE:C603(*; $_t_SearchCriteriaName; True:C214)
			OBJECT SET VISIBLE:C603(*; $_t_SearchCloseName; False:C215)
			
			SD2_T_SearchValue:=""
			GOTO OBJECT:C206(SD2_T_SearchValue)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].Prod_SelectionPallette.oSearchCriteriaButton"; $_t_oldMethodName)

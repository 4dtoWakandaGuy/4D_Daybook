//%attributes = {}
If (False:C215)
	//Project Method Name:      SRCH_loadaSearchparameters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SRCH_loadaSearchparameters
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SRCH_at_SearchOptions;0)
	C_BOOLEAN:C305($_bo_UseResources)
	C_LONGINT:C283(<>StrLang; $_l_Event; $_l_TableNumber)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_FocusRingName; $_t_oldMethodName; $_t_SearchButtonName; $_t_SearchCloseName; $_t_SearchCriteriaName; SD2_t_SearchCriteria; SD2_T_SearchValue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SRCH_loadaSearchparameters")
//identify object names (dont forget that when duplicate objects !)
$_t_FocusRingName:="oFocusRing"  //focus ring (visible or dont depending on the focus
$_t_SearchButtonName:="oSearchCriteriaButton"  //magnifiing glass used to select criteria
$_t_SearchCloseName:="oSearchClearButton"  //close box to clear the critéria
$_t_SearchCriteriaName:="oSearchCriteria"  //search criteria grey (help)
$_l_Event:=Form event code:C388
$_bo_UseResources:=False:C215
ARRAY TEXT:C222(SRCH_at_SearchOptions; 0)

$_bo_UseResources:=False:C215
$_l_TableNumber:=Table:C252($1)
SRCH_SetSearchParameters($_l_TableNumber)
If ($_bo_UseResources)
	SD2_t_SearchCriteria:=Get indexed string:C510(<>StrLang; 5)
Else 
	SD2_t_SearchCriteria:="Search"
End if 
OBJECT SET VISIBLE:C603(*; $_t_SearchCriteriaName; True:C214)
OBJECT SET VISIBLE:C603(*; $_t_SearchCloseName; False:C215)

SD2_T_SearchValue:=""
OBJECT SET VISIBLE:C603(*; $_t_FocusRingName; False:C215)
ERR_MethodTrackerReturn("SRCH_loadaSearchparameters"; $_t_oldMethodName)

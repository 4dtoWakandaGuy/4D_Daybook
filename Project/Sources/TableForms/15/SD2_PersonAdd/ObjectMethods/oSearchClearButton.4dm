If (False:C215)
	//object Name: [USER]SD2_PersonAdd.oSearchClearButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FocusRingName; $_t_oldMethodName; $_t_SearchButtonName; $_t_SearchCloseName; $_t_SearchCriteriaName; SD2_T_SearchValue)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_PersonAdd.oSearchClearButton"; Form event code:C388)


//identify object names (dont forget that when duplicate objects !)
$_t_FocusRingName:="oFocusRing"  //focus ring (visible or dont depending on the focus
$_t_SearchButtonName:="oSearchCriteriaButton"  //magnifiing glass used to select criteria
$_t_SearchCloseName:="oSearchClearButton"  //close box to clear the critéria
$_t_SearchCriteriaName:="oSearchCriteriaButton"  //search criteria grey (help)

OBJECT SET VISIBLE:C603(*; $_t_SearchCriteriaName; True:C214)
OBJECT SET VISIBLE:C603(*; $_t_SearchCloseName; False:C215)

SD2_T_SearchValue:=""

//ALL RECORDS(currenttable_p->)
ERR_MethodTrackerReturn("OBJ [USER].SD2_PersonAdd.oSearchClearButton"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_SetChoiceList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/05/2011 07:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ArrayType; $_l_Index; $_l_ListIdenty)
	C_POINTER:C301($2; $3)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ListName; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_SetChoiceList")
// LB-SetchoiceList
// Creates a popup choice list for a ListBox array
// 07/07/06 pb
// parameters:
// $1 = name for list - make sure it isn't already in use - suggest prefixing with "lb"
// $2 = pointer to array containing values to put into popup
// $3 pointer to array to associate the popup with

// example: LB_SetChoiceList ("lbQV_at_YearsOptions";->QV_at_Values;->atDisplayArray)
//NG Although this does not directly replace an area list function the addition of a pop-up to an area
// column was an area list function carred out in the setup of the area so this is an LB rather than an LBi method
If ($1#"")
	$_t_ListName:=$1+<>PER_t_CurrentUserInitials
	$_l_ListIdenty:=New list:C375
	$_l_ArrayType:=Type:C295($2->)
	Case of 
		: ($_l_ArrayType=LongInt array:K8:19) | ($_l_ArrayType=Real array:K8:17) | ($_l_ArrayType=Integer array:K8:18)
			
			For ($_l_Index; 1; Size of array:C274($2->))
				
				APPEND TO LIST:C376($_l_ListIdenty; String:C10($2->{$_l_Index}); $_l_Index)
			End for 
		: ($_l_ArrayType=String array:K8:15) | ($_l_ArrayType=Text array:K8:16)
			For ($_l_Index; 1; Size of array:C274($2->))
				
				APPEND TO LIST:C376($_l_ListIdenty; $2->{$_l_Index}; $_l_Index)
			End for 
	End case 
	
	SAVE LIST:C384($_l_ListIdenty; $_t_ListName)
	OBJECT SET LIST BY NAME:C237($3->; "")
	OBJECT SET LIST BY NAME:C237($3->; $_t_ListName)
	CLEAR LIST:C377($_l_ListIdenty)
Else 
	OBJECT SET LIST BY NAME:C237($3->; "")
End if 
ERR_MethodTrackerReturn("LB_SetChoiceList"; $_t_oldMethodName)
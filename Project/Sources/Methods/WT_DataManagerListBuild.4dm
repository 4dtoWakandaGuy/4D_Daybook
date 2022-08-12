//%attributes = {}
If (False:C215)
	//Project Method Name:      WT_DataManagerListBuild
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_UserTabPage;0)
	//ARRAY TEXT(DB_at_USERTAB;0)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray; $_l_UserTabPage; USR_hl_DataManList)
	C_TEXT:C284($_t_oldMethodName; $_t_UserTabName)
End if 
//Code Starts Here
TRACE:C157
$_t_oldMethodName:=ERR_MethodTracker("WT_DataManagerListBuild")
//builds an hierarchical list for Data Manager's Preferences view
$_l_SizeofArray:=Size of array:C274(DB_at_USERTAB)
USR_hl_DataManList:=New list:C375  // Create a new empty hierarchical list
For ($_l_Index; 1; $_l_SizeofArray)
	$_l_UserTabPage:=DB_al_UserTabPage{$_l_Index}
	$_t_UserTabName:=DB_at_USERTAB{$_l_Index}
	If ($_t_UserTabName#"")
		APPEND TO LIST:C376(USR_hl_DataManList; $_t_UserTabName; $_l_UserTabPage)
		SET LIST ITEM PROPERTIES:C386(USR_hl_DataManList; 0; False:C215; Bold:K14:2; 0)
	End if 
End for 
SET LIST PROPERTIES:C387(USR_hl_DataManList; _o_Ala Macintosh:K28:1; _o_Macintosh node:K28:5; 15)
ERR_MethodTrackerReturn("WT_DataManagerListBuild"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ExportMenus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    19/11/2010 16:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_Index3; $_l_ItemCount; $_l_MenuCount; $_l_MenuItemNumber; $_l_offset)
	C_TEXT:C284($_t_MenuItem; $_t_MenuTitle; $_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ExportMenus")
$_ti_DocumentRef:=Create document:C266(""; "TEXT")

For ($_l_Index; 1; 117)
	SEND PACKET:C103($_ti_DocumentRef; "Menu bar"+String:C10($_l_Index)+Char:C90(13))
	$_l_offset:=0
	SET MENU BAR:C67($_l_Index)
	$_l_MenuCount:=Count menus:C404(Current process:C322)
	For ($_l_Index2; 1; $_l_MenuCount)
		$_l_MenuItemNumber:=$_l_Index2+$_l_offset
		$_t_MenuTitle:=Get menu title:C430($_l_MenuItemNumber)
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+$_t_MenuTitle+Char:C90(13))
		$_l_ItemCount:=Count menu items:C405($_l_MenuItemNumber)
		For ($_l_Index3; 1; $_l_ItemCount)
			$_t_MenuItem:=Get menu item:C422($_l_MenuItemNumber; $_l_Index3)
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+$_t_MenuItem+Char:C90(13))
		End for 
	End for 
End for 
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ERR_MethodTrackerReturn("DB_ExportMenus"; $_t_oldMethodName)
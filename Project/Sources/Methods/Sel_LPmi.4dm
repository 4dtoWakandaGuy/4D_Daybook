//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_LPmi
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
	C_LONGINT:C283($_l_MenuSelected; $0)
	C_TEXT:C284($_t_MenuName; $_t_oldMethodName; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_LPmi")
//Sel_LPmi - Menu Item

If (DB_t_CurrentFormUsage="-1@")
	$0:=Num:C11(Substring:C12(DB_t_CurrentFormUsage; 3; 2))
Else 
	$_l_MenuSelected:=Menu selected:C152
	$_t_MenuName:=Get menu title:C430($_l_MenuSelected\65536)
	If (($_t_MenuName="Find") | ($_t_MenuName="View"))
		$0:=($_l_MenuSelected%65536)
	Else 
		$0:=0
	End if 
End if 
If ($0>0)
	If (Count parameters:C259>=1)
		Menu_RecordItem($1; $0)
	End if 
End if 
ERR_MethodTrackerReturn("Sel_LPmi"; $_t_oldMethodName)
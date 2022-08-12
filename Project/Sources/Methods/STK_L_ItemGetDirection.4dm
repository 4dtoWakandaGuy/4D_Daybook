//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_l_ItemGetDirection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/09/2011 15:09 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_l_ItemGetDirection")
$0:=0
ERR_MethodTrackerReturn("STK_l_ItemGetDirection"; $_t_oldMethodName)

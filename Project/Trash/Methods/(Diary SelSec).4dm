//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_SelSec
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>PER_l_AccessLevel; xSearch)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; vSales)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_SelSec")
If (<>PER_l_AccessLevel>1)
	OBJECT SET ENTERABLE:C238(vSales; False:C215)
	
	OBJECT SET ENABLED:C1123(xSearch; False:C215)
	vSales:=<>PER_t_CurrentUserInitials
End if 
ERR_MethodTrackerReturn("Diary_SelSec"; $_t_oldMethodName)

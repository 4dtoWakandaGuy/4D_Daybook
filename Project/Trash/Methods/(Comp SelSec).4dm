//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp_SelSec
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_RestrictCompanies)
	C_LONGINT:C283(<>PER_l_AccessLevel; xSearch)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; vSales)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_SelSec")
If ((<>PER_l_AccessLevel>1) & (<>SYS_bo_RestrictCompanies))  ///<>SYS_bo_RestrictCompanies means can only find companies of which is am the sales person
	OBJECT SET ENTERABLE:C238(vSales; False:C215)
	OBJECT SET ENABLED:C1123(xSearch; False:C215)
	
	vSales:=<>PER_t_CurrentUserInitials
End if 
ERR_MethodTrackerReturn("Comp_SelSec"; $_t_oldMethodName)
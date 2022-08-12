//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_SupAdd
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
	C_TEXT:C284($_t_oldMethodName; $_t_ParentCompanyCode; vArea; vDetails; vFax; vTel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_SupAdd")
$_t_ParentCompanyCode:=[COMPANIES:2]Superior:34
CUT NAMED SELECTION:C334([COMPANIES:2]; "$Sel")
QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_ParentCompanyCode)
If (Records in selection:C76([COMPANIES:2])=0)
	vArea:=""
	vDetails:=""
	vTel:=""
	vFax:=""
Else 
	Company_Details
End if 
USE NAMED SELECTION:C332("$Sel")
ERR_MethodTrackerReturn("Comp_SupAdd"; $_t_oldMethodName)
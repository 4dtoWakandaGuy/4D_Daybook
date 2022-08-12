//%attributes = {}
If (False:C215)
	//Project Method Name:      BDL_Init
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>BDL_bo_COMPRESS)
	C_LONGINT:C283(<>BDL_l_MINBDLSIZE)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BDL_Init")
//Pseudoconstants:
<>BDL_l_MINBDLSIZE:=163  //minimum size a bundle can be
<>BDL_bo_COMPRESS:=False:C215
ERR_MethodTrackerReturn("BDL_Init"; $_t_oldMethodName)

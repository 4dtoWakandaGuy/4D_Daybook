//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      MoveTypes Mod
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
	C_TEXT:C284(<>SYS_t_FormSizeName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MoveTypes Mod")
READ ONLY:C145([STOCK_TYPES:59])
READ ONLY:C145([TRANSACTION_TYPES:31])
Minor_ModName(->[MOVEMENT_TYPES:60]; "MoveTypes"; <>SYS_t_FormSizeName; "Movement Types")
ERR_MethodTrackerReturn("MoveTypes Mod"; $_t_oldMethodName)
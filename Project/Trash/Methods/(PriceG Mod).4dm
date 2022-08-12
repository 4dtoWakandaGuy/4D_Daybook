//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PriceG Mod
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

$_t_oldMethodName:=ERR_MethodTracker("PriceG Mod")
Minor_ModName(->[PRICE_GROUPS:18]; "PriceG"; <>SYS_t_FormSizeName; "Price Groups")
ERR_MethodTrackerReturn("PriceG Mod"; $_t_oldMethodName)
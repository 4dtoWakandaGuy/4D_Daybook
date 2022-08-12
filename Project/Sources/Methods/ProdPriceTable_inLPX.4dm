//%attributes = {}
If (False:C215)
	//Project Method Name:      ProdPriceTable_inLPX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: ProdPriceTable_inLPX`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProdPriceTable_inLPX")

PriceTable_inLPX($1)
ERR_MethodTrackerReturn("ProdPriceTable_inLPX"; $_t_oldMethodName)

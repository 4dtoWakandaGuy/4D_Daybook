If (False:C215)
	//object Name: [PRICE_GROUPS]PriceGroup_In.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRICE_GROUPS].PriceGroup_In.Variable3"; Form event code:C388)
Gen_ExportButt(->[PRICE_GROUPS:18]Export:7)
ERR_MethodTrackerReturn("OBJ [PRICE_GROUPS].PriceGroup_In.Variable3"; $_t_oldMethodName)
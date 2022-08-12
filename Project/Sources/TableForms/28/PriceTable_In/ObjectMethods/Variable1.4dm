If (False:C215)
	//object Name: [PRICE_TABLE]PriceTable_In.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2010 21:29
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRICE_TABLE].PriceTable_In.Variable1"; Form event code:C388)
Gen_ExportButt(->[PRICE_TABLE:28]Export:11)
ERR_MethodTrackerReturn("OBJ [PRICE_TABLE].PriceTable_In.Variable1"; $_t_oldMethodName)
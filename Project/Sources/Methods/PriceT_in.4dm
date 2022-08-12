//%attributes = {}
If (False:C215)
	//Project Method Name:      PriceT_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/09/2010 09:08
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

$_t_oldMethodName:=ERR_MethodTracker("PriceT_in")
If (False:C215)
	Gen_In("Enter to Price Table"; "PriceT_File"; "Master"; ->[PRICE_TABLE:28])
Else 
	Gen_Alert("Calls to PriceT_in should now be changed to DB_MenuNewRecord("+Char:C90(34)+"PRICE TABLE"+Char:C90(34)+")")
End if 
ERR_MethodTrackerReturn("PriceT_in"; $_t_oldMethodName)
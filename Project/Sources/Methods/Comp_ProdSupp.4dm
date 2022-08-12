//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_ProdSupp
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
	C_TEXT:C284($_t_oldMethodName; $1; vCompCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_ProdSupp")
QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)

QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=vCompCode)
[PRODUCTS_SUPPLIERS:148]Company_Code:1:=$1
ERR_MethodTrackerReturn("Comp_ProdSupp"; $_t_oldMethodName)
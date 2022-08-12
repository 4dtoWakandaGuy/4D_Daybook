//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_InLPPC
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_InLPPC")
Case of 
	: (DB_GetProductGroupBrand)
		[PRODUCTS:9]Product_Code:1:=[PRODUCTS:9]Group_Code:3+[PRODUCTS:9]Brand_Code:4+[PRODUCTS:9]Model_Code:5
	: (DB_Get_ProductBrandPref)
		[PRODUCTS:9]Product_Code:1:=[PRODUCTS:9]Brand_Code:4+[PRODUCTS:9]Model_Code:5
		
	Else 
		[PRODUCTS:9]Product_Code:1:=[PRODUCTS:9]Model_Code:5
End case 
ERR_MethodTrackerReturn("Products_InLPPC"; $_t_oldMethodName)
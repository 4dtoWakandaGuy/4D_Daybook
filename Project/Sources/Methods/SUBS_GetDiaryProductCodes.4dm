//%attributes = {}
If (False:C215)
	//Project Method Name:      SUBS_GetDiaryProductCodes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   17/05/2011 20:16 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	//ARRAY TEXT(DIA_at_SubsProductCodes;0)
	C_BOOLEAN:C305(DIA_bo_ProductsLoaded)
	C_REAL:C285($2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SUBS_GetDiaryProductCodes")
ARRAY TEXT:C222($_at_ProductCodes; 0)
READ ONLY:C145([PRODUCTS:9])
QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Component_Code:2=$1)
SELECTION TO ARRAY:C260([COMPONENTS:86]Product_Code:1; $_at_ProductCodes)
QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_Entry_Class:55=4)
SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
VARIABLE TO VARIABLE:C635($2; DIA_at_SubsProductCodes; $_at_ProductCodes)
SET PROCESS VARIABLE:C370($2; DIA_bo_ProductsLoaded; True:C214)


//This method(c
ERR_MethodTrackerReturn("SUBS_GetDiaryProductCodes"; $_t_oldMethodName)
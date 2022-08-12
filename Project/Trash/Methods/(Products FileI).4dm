//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products_FileI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: Products_FileI`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	C_BOOLEAN:C305(<>NewProductScreen)
	C_LONGINT:C283(PROD_l_FunctionPref; PROD_l_FunctionType)
	C_TEXT:C284($_t_oldMethodName; PROD_t_FormName; PROD_t_FunctionName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_FileI")
//NG April 2004 Removed ◊Screen


FORM SET INPUT:C55([PRODUCTS:9]; "Products_IN2009")
WIN_t_CurrentInputForm:="Products_IN2009"

PROD_t_FormName:=PROD_GetFunctionPref(False:C215; PROD_t_FunctionName)

If (PROD_t_FormName#"")
	FORM SET INPUT:C55([PRODUCTS:9]; PROD_t_FormName)
End if 

ARRAY POINTER:C280(PRD_aPtr_RelatedConfiguration; 0)

ERR_MethodTrackerReturn("Products_FileI"; $_t_oldMethodName)

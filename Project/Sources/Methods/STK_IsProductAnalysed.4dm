//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_IsProductAnalysed
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  08/06/2011 09:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_IsProductAnalysed")
QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$1)
$0:=[PRODUCTS:9]x_Product_Stock_is_Setup:59
UNLOAD RECORD:C212([PRODUCTS:9])
ERR_MethodTrackerReturn("STK_IsProductAnalysed"; $_t_oldMethodName)

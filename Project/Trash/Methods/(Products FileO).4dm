//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products_FileO
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
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_FileO")
FORM SET OUTPUT:C54([PRODUCTS:9]; "Products Out")
WIN_t_CurrentOutputform:="Products Out"
ERR_MethodTrackerReturn("Products_FileO"; $_t_oldMethodName)
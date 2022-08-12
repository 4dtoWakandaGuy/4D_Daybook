If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.oAddContacts2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.oAddContacts2"; Form event code:C388)

//This button is on Page_1-which is only displayed when there is just one person
//we have to add the
If (Current date:C33(*)<[PRODUCTS:9]Actual_End_Date:49) | ([PRODUCTS:9]Actual_End_Date:49=!00-00-00!)
	
	//Add a component product line
	PROD_AddSubEntityComponents("SUBSComponent")
	
	
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.oAddContacts2"; $_t_oldMethodName)

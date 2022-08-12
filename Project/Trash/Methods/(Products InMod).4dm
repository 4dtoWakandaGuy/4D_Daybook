//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products_InMod
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284(<>ProdCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_InMod")
[PRODUCTS:9]Modified_Date:10:=<>DB_d_CurrentDate
[PRODUCTS:9]Export:22:=Export_Stamp3([PRODUCTS:9]Export:22)
DB_bo_RecordModified:=True:C214
<>ProdCode:=[PRODUCTS:9]Product_Code:1
ERR_MethodTrackerReturn("Products_InMod"; $_t_oldMethodName)
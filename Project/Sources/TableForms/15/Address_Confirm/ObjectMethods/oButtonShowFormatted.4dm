If (False:C215)
	//object Name: [USER]Address_Confirm.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_TextADD; LAB_T_ADDRESS; LAB_t_AddressCounty; LAB_t_AddressLine1; LAB_t_AddressLine2; LAB_t_AddressPostCode; LAB_t_AddressPostCountry; LAB_t_AddressTown; LAB_t_CompanyName; LAB_t_PersonName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Address_Confirm.Variable10"; Form event code:C388)
LAB_T_ADDRESS:=LAB_BuildAddress(LAB_t_AddressLine1; LAB_t_AddressLine2; LAB_t_AddressTown; LAB_t_AddressCounty; LAB_t_AddressPostCode; LAB_t_AddressPostCountry)
$_t_TextADD:=""
If (LAB_t_PersonName#"")
	$_t_TextADD:=LAB_t_PersonName+Char:C90(13)
End if 
If (LAB_t_CompanyName#"")
	$_t_TextADD:=$_t_TextADD+LAB_t_CompanyName+Char:C90(13)
End if 
LAB_T_ADDRESS:=$_t_TextADD+LAB_T_ADDRESS
FORM GOTO PAGE:C247(2)
ERR_MethodTrackerReturn("OBJ [USER].Address_Confirm.Variable10"; $_t_oldMethodName)

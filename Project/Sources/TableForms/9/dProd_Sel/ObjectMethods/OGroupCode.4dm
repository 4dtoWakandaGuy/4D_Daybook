If (False:C215)
	//object Name: [PRODUCTS]dProd_Sel.OGroupCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vGroup)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].dProd_Sel.OGroupCode"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vGroup; ""; ->[PRODUCT_GROUPS:10]; ->[PRODUCT_GROUPS:10]Group_Code:1; ->[PRODUCT_GROUPS:10]Group_Name:2; "Group")
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].dProd_Sel.OGroupCode"; $_t_oldMethodName)

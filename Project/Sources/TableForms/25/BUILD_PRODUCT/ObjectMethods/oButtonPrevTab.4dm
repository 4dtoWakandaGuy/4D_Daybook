If (False:C215)
	//object Name: [ORDER_ITEMS]BUILD_PRODUCT.oButtonPrevTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2010 06:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(OI_at_ProductSections;0)
	C_LONGINT:C283(OI_l_AndTab)
	C_TEXT:C284($_t_oldMethodName; OI_t_LookupValue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oButtonPrevTab"; Form event code:C388)
Case of 
	: (OI_at_ProductSections=1)
		//do nothing
	Else 
		If (OI_t_LookupValue#"")  //wait till its clear to tab
			OI_l_AndTab:=-1
		Else 
			OI_at_ProductSections:=OI_at_ProductSections-1
			PRD_BuildFormSetPage
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oButtonPrevTab"; $_t_oldMethodName)

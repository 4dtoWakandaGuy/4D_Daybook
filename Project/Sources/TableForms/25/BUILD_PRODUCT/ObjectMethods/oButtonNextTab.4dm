If (False:C215)
	//object Name: [ORDER_ITEMS]BUILD_PRODUCT.oButtonNextTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(OI_at_ProductSections;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oButtonNextTab"; Form event code:C388)
Case of 
	: (OI_at_ProductSections=Size of array:C274(OI_at_ProductSections))
		//Here validate all the mandatories are set
		//confirm they want to save
	Else 
		OI_at_ProductSections:=OI_at_ProductSections+1
		PRD_BuildFormSetPage
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oButtonNextTab"; $_t_oldMethodName)

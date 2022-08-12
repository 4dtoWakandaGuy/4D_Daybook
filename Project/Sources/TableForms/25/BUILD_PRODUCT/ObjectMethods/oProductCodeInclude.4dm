If (False:C215)
	//object Name: [ORDER_ITEMS]BUILD_PRODUCT.oProductCodeInclude
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
	//ARRAY BOOLEAN(OI_abo_IncludeInProduct;0)
	//ARRAY BOOLEAN(OI_abo_UserSetInclude;0)
	//ARRAY LONGINT(OI_al_ComponentSectionID;0)
	//ARRAY LONGINT(OI_al_SectionIDS;0)
	//ARRAY TEXT(OI_at_ProductSections;0)
	C_BOOLEAN:C305(OI_bo_IncludeProduct)
	C_LONGINT:C283($_l_SectionID; $_l_SectionRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oProductCodeInclude"; Form event code:C388)
$_l_SectionID:=OI_al_ComponentSectionID{OI_at_ProductSections}
$_l_SectionRow:=Find in array:C230(OI_al_SectionIDS; $_l_SectionID)
If ($_l_SectionRow>0)
	OI_abo_IncludeInProduct{$_l_SectionRow}:=OI_bo_IncludeProduct
	
	OI_abo_UserSetInclude{$_l_SectionRow}:=True:C214
	
End if 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oProductCodeInclude"; $_t_oldMethodName)

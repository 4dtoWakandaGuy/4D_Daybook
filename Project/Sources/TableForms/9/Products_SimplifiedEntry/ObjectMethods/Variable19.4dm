If (False:C215)
	//object Name: [PRODUCTS]Products_SimplifiedEntry.Variable19
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
	//ARRAY LONGINT(PROD_al_EditMode;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY TEXT(PRD_at_ModeSupplier;0)
	C_BOOLEAN:C305($_bo_Switch; $_bo_Update)
	C_PICTURE:C286(PROD_apic_ModePictProd)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_SimplifiedEntry.Variable19"; Form event code:C388)
$_bo_Switch:=True:C214
$_bo_Update:=(PROD_al_EditMode{PRD_at_ModeSupplier}=3)
LBi_EditListLay(->PRD_aPtr_RelatedConfiguration; ->PRD_at_ModeSupplier; ->PROD_apic_ModePictProd; ->PROD_al_EditMode; $_bo_Switch)
If (OK=1) & ($_bo_Update)
	QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
	LBi_EditListUpd(->PRD_aPtr_RelatedConfiguration)
	LBi_EditListLay(->PRD_aPtr_RelatedConfiguration; ->PRD_at_ModeSupplier; ->PROD_apic_ModePictProd; ->PROD_al_EditMode)
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_SimplifiedEntry.Variable19"; $_t_oldMethodName)

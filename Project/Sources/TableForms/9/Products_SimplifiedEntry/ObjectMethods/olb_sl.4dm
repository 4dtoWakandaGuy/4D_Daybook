If (False:C215)
	//object Name: [PRODUCTS]Products_SimplifiedEntry.olb_sl
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
	//ARRAY BOOLEAN(PRD_lb_RelatedData;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY TEXT(PRD_at_ModeSupplier;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; $_l_CurrentSortColumn; LB_l_LastRow)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_SimplifiedEntry.olb_sl"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		
		//$_l_CurrentSortColumn:=LB_GetColumn (->e_LB_SI;"";$_t_VariableName)
		$_l_CurrentSortColumn:=LB_GetColumn(->PRD_lb_RelatedData; ""; $_t_VariableName)  //Changed 11/11/08 v631b120f -kmw (needs to be passed the actual list box)
		LBi_AreaScript(->PRD_aPtr_RelatedConfiguration; 0; [PRODUCTS:9]Product_Code:1; ->PRD_at_ModeSupplier; $_l_Row; $_t_VariableName; "PROD_LBI_SUppliers"; $_l_CurrentSortColumn)
		
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
	Else 
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		
		LBi_AreaScript(->PRD_aPtr_RelatedConfiguration; 0; [PRODUCTS:9]Product_Code:1; ->PRD_at_ModeSupplier; $_l_Row; $_t_VariableName; "PROD_LBI_SUppliers")
		
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_SimplifiedEntry.olb_sl"; $_t_oldMethodName)

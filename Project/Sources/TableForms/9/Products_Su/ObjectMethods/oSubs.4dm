If (False:C215)
	//object Name: [PRODUCTS]Products_SU.oSubs
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
	//ARRAY BOOLEAN(ORD_LB_Subs;0)
	//ARRAY POINTER(SUBS_aPtr_LBSettings;0)
	//ARRAY TEXT(PROD_at_SubsItems;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; $_l_CurrentSortColumn)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_SU.oSubs"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->ORD_LB_Subs; ""; $_t_VariableName)
		LBi_AreaScript(->SUBS_aPtr_LBSettings; 0; [PRODUCTS:9]Product_Code:1; ->PROD_at_SubsItems; $_l_Row; $_t_VariableName; "PROD_LBI_Subsitems"; $_l_CurrentSortColumn)
		
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
	Else 
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		
		LBi_AreaScript(->SUBS_aPtr_LBSettings; 0; [PRODUCTS:9]Product_Code:1; ->PROD_at_SubsItems; $_l_Row; $_t_VariableName; "PROD_LBI_Subsitems")
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_SU.oSubs"; $_t_oldMethodName)

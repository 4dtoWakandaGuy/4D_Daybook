If (False:C215)
	//object Name: [PRODUCTS]Products_inCAT.oPrice
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
	//ARRAY BOOLEAN(Prod_lb_PriceBox;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldNumber; $_l_TableNumber; LB_l_RowNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_inCAT.oPrice"; Form event code:C388)
$_l_event:=Form event code:C388

RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
LB_l_RowNumber:=Self:C308->
$_l_Column:=LB_GetColumn(->Prod_lb_PriceBox; $_t_VariableName)
//`LB_l_ColumnNumber:=Find in array($_ptr_ArrayOfArrayNames->;$_t_VariableName)

Case of 
	: ($_l_event=On Data Change:K2:15)
		Prod_LBI_ModPT
End case 

//***********ends**********************************
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_inCAT.oPrice"; $_t_oldMethodName)
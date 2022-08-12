If (False:C215)
	//object Name: [USER]STK_ShowCurrentStock.oCurrentStock
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/04/2010 18:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_lb_CurrentStock;0)
	//ARRAY LONGINT(STK_al_ProductIDS;0)
	C_BOOLEAN:C305(STK_bo_LineSelected)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_ProductID; $_l_SelectedColumn; $_l_SelectedRow; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].STK_ShowCurrentStock.oCurrentStock"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		STK_bo_LineSelected:=True:C214
		
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_SelectedColumn:=LB_GetColumn(->STK_lb_CurrentStock; $_t_VariableName)
		
		$_l_SelectedRow:=Self:C308->
		If ($_l_SelectedColumn=1)  //info column
			
			$_l_ProductID:=STK_al_ProductIDS{$_l_SelectedRow}
			//STK_ShowSalesHistory($_l_ProductID)
			
			
			
		End if 
		
	: ($_l_event=On Row Moved:K2:32)
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].STK_ShowCurrentStock.oCurrentStock"; $_t_oldMethodName)

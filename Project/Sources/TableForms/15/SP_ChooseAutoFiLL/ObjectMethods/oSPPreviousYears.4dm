If (False:C215)
	//object Name: [USER]SP_ChooseAutoFiLL.oSP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SP_lb_Listbox2;0)
	C_BOOLEAN:C305(QV_bo_Drop)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldNumber; $_l_SelectedRow; $_l_SublistID; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SP_ChooseAutoFiLL.oSP"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Drag Over:K2:13)
		
	: ($_l_event=On Clicked:K2:4)  //$_l_Column:=AL_GetColumn (SP_powerView)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		
		$_l_Column:=LB_GetColumn(->SP_lb_Listbox2; $_t_VariableName)
		$_l_SelectedRow:=Self:C308->
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SP_ChooseAutoFiLL.oSP"; $_t_oldMethodName)

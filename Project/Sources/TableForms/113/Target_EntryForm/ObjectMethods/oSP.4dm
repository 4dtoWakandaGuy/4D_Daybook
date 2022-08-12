If (False:C215)
	//object Name: [SALES_PROJECTION]Target_EntryForm.oSP
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
	//ARRAY BOOLEAN(SP_lb_Listbox;0)
	C_BOOLEAN:C305(QV_bo_Drop)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldNumber; $_l_Row; $_l_SelectedRow; $_l_SublistID; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].Target_EntryForm.oSP"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Drag Over:K2:13)
		
		//Else
	: ($_l_event=On Clicked:K2:4)
		//If (ALProEvt=1)  `did user single-click on a line?
		//$_l_Column:=AL_GetColumn (SP_powerView)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		
		$_l_Column:=LB_GetColumn(->SP_lb_Listbox; $_t_VariableName)
		//$_l_SelectedRow:=AL_GetLine (SP_powerView)  `get the line the user selected
		$_l_SelectedRow:=Self:C308->
		//End if   `ALProEvt=1
		
		// but I don't see the point ...
End case 
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].Target_EntryForm.oSP"; $_t_oldMethodName)

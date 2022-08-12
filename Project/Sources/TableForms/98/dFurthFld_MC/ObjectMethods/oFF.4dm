If (False:C215)
	//object Name: [CUSTOM_FIELDS]dFurthFld_MC.oFF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2010 09:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CUS_lb_FurtherFields;0)
	C_LONGINT:C283($_l_ColumnNumber; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CUSTOM_FIELDS].dFurthFld_MC.oFF"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4) | (Form event code:C388=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		LISTBOX GET CELL POSITION:C971(CUS_lb_FurtherFields; $_l_ColumnNumber; $_l_Row)
		If ($_l_ColumnNumber=2) | ($_l_ColumnNumber=3)
			EDIT ITEM:C870(Self:C308->; $_l_Row)
			//  AL_SetScroll (eALFurth;$s;2)
			
		End if 
	: (Form event code:C388=On Data Change:K2:15)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		LISTBOX GET CELL POSITION:C971(CUS_lb_FurtherFields; $_l_ColumnNumber; $_l_Row)
		Furth_LBI_Mod(->CUS_lb_FurtherFields; $_l_ColumnNumber; $_l_Row)
End case 
ERR_MethodTrackerReturn("OBJ:dFurthFld_MC,CUS_lb_FurtherFields"; $_t_oldMethodName)

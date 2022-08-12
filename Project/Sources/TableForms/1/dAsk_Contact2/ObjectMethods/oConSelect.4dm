If (False:C215)
	//object Name: [CONTACTS]dask_Contact2.oConSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CON_lb_LBCont;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; vContact)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dask_Contact2.oConSelect"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			vContact:=SVS_at_PreviewEvent{$_l_Row}
			
			ACCEPT:C269
		Else 
			LISTBOX SELECT ROW:C912(CON_lb_LBCont; 1; 0)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dask_Contact2.oConSelect"; $_t_oldMethodName)

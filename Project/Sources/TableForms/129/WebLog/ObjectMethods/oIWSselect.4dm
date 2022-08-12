If (False:C215)
	//object Method Name: Object Name:      [WEBSETUP_4D].WebLog.oIWSselect
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
	//ARRAY BOOLEAN(IWS_lb_LBProcess;0)
	//ARRAY TEXT(<>IWS_at_ProcessName;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebLog.oIWSselect"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			<>IWS_at_ProcessName:=$_l_Row
			IWS_LogArrayInfo
		Else 
			LISTBOX SELECT ROW:C912(IWS_lb_LBProcess; 1; 0)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebLog.oIWSselect"; $_t_oldMethodName)

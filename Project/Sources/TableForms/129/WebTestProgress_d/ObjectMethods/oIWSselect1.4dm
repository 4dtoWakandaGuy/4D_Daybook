If (False:C215)
	//object Method Name: Object Name:      [WEBSETUP_4D].WebTestProgress_d.oIWSselect1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebTestProgress_d.oIWSselect1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			
		Else 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebTestProgress_d.oIWSselect1"; $_t_oldMethodName)

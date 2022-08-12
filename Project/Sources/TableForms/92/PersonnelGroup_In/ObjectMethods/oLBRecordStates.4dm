If (False:C215)
	//object Name: [PERSONNEL_GROUPS]Groups_In.oLBRecordStates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2012 09:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GRP_lb_RecordStates;0)
	C_LONGINT:C283($_l_ColumnNumber; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL_GROUPS].Groups_In.oLBRecordStates"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->GRP_lb_RecordStates; $_t_VariableName)
		
		If ($_l_Row>0)
			
			PersonGr_InArrC
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL_GROUPS].Groups_In.oLBRecordStates"; $_t_oldMethodName)

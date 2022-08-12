If (False:C215)
	//object Name: [COMPANIES]dLists.oComSelect1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(COM_lb_Companies;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; bd2)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; vText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dLists.oComSelect1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			vText:=GEN_at_Name{GEN_at_Name}
			GEN_at_RecordCode:=GEN_at_Name
			GEN_at_Identity:=GEN_at_Name
			If (bd2=0)
				ACCEPT:C269
			End if 
		Else 
			LISTBOX SELECT ROW:C912(COM_lb_Companies; 1; 0)
		End if 
	: ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			vText:=GEN_at_Name{GEN_at_Name}
			GEN_at_RecordCode:=GEN_at_Name
			GEN_at_Identity:=GEN_at_Name
			
			ACCEPT:C269
			
		Else 
			LISTBOX SELECT ROW:C912(COM_lb_Companies; 1; 0)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dLists.oComSelect1"; $_t_oldMethodName)

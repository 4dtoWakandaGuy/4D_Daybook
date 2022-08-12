If (False:C215)
	//object Name: [CONTACTS]dSWContact.oCompanies
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
	//ARRAY TEXT(a03Stri1;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; CON_l_SelectRow)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; VCompCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dSWContact.oCompanies"; Form event code:C388)
$_l_event:=Form event code:C388

RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)

$_l_Row:=Self:C308->
CON_l_SelectRow:=$_l_Row
Case of 
	: ($_l_event=On Data Change:K2:15)
		If ($_l_Row>0)
			VCompCode:=a03Stri1{$_l_Row}
		End if 
		
End case 
//No call back was in this form   `***********ends**********************************
ERR_MethodTrackerReturn("OBJ [CONTACTS].dSWContact.oCompanies"; $_t_oldMethodName)

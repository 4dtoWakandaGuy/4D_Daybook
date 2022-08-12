If (False:C215)
	//object Name: [USER]CO_EditTokenField.oFieldNameChoices
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
	//ARRAY LONGINT(CO_al_FieldNos;0)
	//ARRAY TEXT(CO_at_FieldNames;0)
	C_LONGINT:C283($_l_event; CO_l_TokenField)
	C_TEXT:C284($_t_oldMethodName; CO_t_TokenField)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CO_EditTokenField.oFieldNameChoices"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (CO_at_FieldNames>0)
			CO_t_TokenField:=CO_at_FIeldNames{CO_at_FIeldNames}
			CO_l_TokenField:=CO_al_FieldNos{CO_at_FIeldNames}
		End if 
		CO_at_FieldNames:=0
End case 
ERR_MethodTrackerReturn("OBJ [USER].CO_EditTokenField.oFieldNameChoices"; $_t_oldMethodName)

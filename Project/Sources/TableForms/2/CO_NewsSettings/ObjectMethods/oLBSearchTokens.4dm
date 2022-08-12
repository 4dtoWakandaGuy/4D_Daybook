If (False:C215)
	//object Name: [COMPANIES]CO_NewsSettings.oLBSearchTokens
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 13:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CO_lb_Tokens;0)
	//ARRAY LONGINT(CO_al_EditTokenFlag;0)
	//ARRAY LONGINT(CO_al_FieldNos;0)
	//ARRAY LONGINT(CO_al_TokenFields;0)
	//ARRAY TEXT(CO_at_FIeldNames;0)
	//ARRAY TEXT(CO_at_TokenFields;0)
	//ARRAY TEXT(CO_at_TokenOptions;0)
	C_LONGINT:C283($_l_FieldIndex; $_l_FieldRow; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_Row; CO_al_EditTokenFlag; CO_l_TokenField; WIN_l_CurrentWinRef; $_l_event)
	C_LONGINT:C283($_l_FieldIndex; $_l_FieldRow; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_Row; CO_l_TokenField; CO_l_TokenSave; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284(CO_t_TokenField; CO_t_TokenOption; $_t_oldMethodName; CO_t_TokenField; CO_t_TokenOption)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].CO_NewsSettings.oLBSearchTokens"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Double Clicked:K2:5)
		$_l_Row:=Self:C308->
		
		If ($_l_Row>0)
			CO_al_EditTokenFlag:=0
			CO_l_TokenSave:=0
			WIN_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			
			OBJECT GET COORDINATES:C663(CO_lb_Tokens; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			WIN_l_CurrentWinRef:=Open window:C153($_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+410; $_l_ObjectTop+62; 1)
			CO_t_TokenOption:=CO_at_TokenOptions{$_l_Row}
			CO_t_TokenField:=CO_at_TokenFields{$_l_Row}
			CO_l_TokenField:=CO_al_TokenFields{$_l_Row}
			CO_at_FIeldNames:=0
			DIALOG:C40([USER:15]; "CO_EditTokenField")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=WIN_l_CurrentWinRefOLD
			If (CO_l_TokenSave=1)
				CO_at_TokenOptions{$_l_Row}:=CO_t_TokenOption
				CO_at_TokenFields{$_l_Row}:=CO_t_TokenField
				CO_al_TokenFields{$_l_Row}:=CO_l_TokenField
				CO_LoadWebSearchtokens(True:C214)
				ARRAY TEXT:C222(CO_at_TokenFields; Size of array:C274(CO_al_TokenFields))
				For ($_l_FieldIndex; 1; Size of array:C274(CO_al_TokenFields))
					$_l_FieldRow:=Find in array:C230(CO_al_FieldNos; CO_al_TokenFields{$_l_FieldIndex})
					CO_at_TokenFields{$_l_FieldRow}:=CO_at_FIeldNames{$_l_FieldRow}
				End for 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].CO_NewsSettings.oLBSearchTokens"; $_t_oldMethodName)

If (False:C215)
	//object Name: [COMPANIES]CO_NewsSettings.oAddToken
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(bAddToken)
	//ARRAY LONGINT(CO_al_EditTokenFlag;0)
	//ARRAY LONGINT(CO_al_FieldNos;0)
	//ARRAY LONGINT(CO_al_TokenFields;0)
	//ARRAY TEXT(CO_at_FIeldNames;0)
	//ARRAY TEXT(CO_at_TokenFields;0)
	//ARRAY TEXT(CO_at_TokenOptions;0)
	C_LONGINT:C283($_l_FieldRow; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRIght; $_l_ObjectTop; bAddToken; CO_al_EditTokenFlag; CO_l_TokenField; CO_l_WebTable; WIN_l_CurrentWinRef; $_l_FieldIndex)
	C_LONGINT:C283($_l_FieldRow; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRIght; $_l_ObjectTop; CO_l_TokenField; CO_l_TokenSave; CO_l_WebTable; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284(CO_t_TokenField; CO_t_TokenOption; $_t_oldMethodName; CO_t_TokenField; CO_t_TokenOption)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].CO_NewsSettings.oAddToken"; Form event code:C388)

//here we will open a window with a variable to type the token (No < or > and no Spaces and a pop up of the(Normalised) field names)
OBJECT GET COORDINATES:C663(bAddToken; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectBottom)
HIDE WINDOW:C436
WIN_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef

WIN_l_CurrentWinRef:=Open window:C153($_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+410; $_l_ObjectTop+62; 1)
CO_al_EditTokenFlag:=1
CO_t_TokenOption:=""
CO_t_TokenField:=""
CO_l_TokenField:=0
CO_at_FIeldNames:=0

DIALOG:C40([USER:15]; "CO_EditTokenField")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=WIN_l_CurrentWinRefOLD

If (CO_l_TokenSave=1)
	APPEND TO ARRAY:C911(CO_at_TokenOptions; CO_t_TokenOption)
	APPEND TO ARRAY:C911(CO_at_TokenFields; CO_t_TokenField)
	APPEND TO ARRAY:C911(CO_al_TokenFields; CO_l_TokenField)
	CO_LoadWebSearchtokens(False:C215; CO_l_WebTable)
	
	ARRAY TEXT:C222(CO_at_TokenFields; Size of array:C274(CO_al_TokenFields))
	
	For ($_l_FieldIndex; 1; Size of array:C274(CO_al_TokenFields))
		$_l_FieldRow:=Find in array:C230(CO_al_FieldNos; CO_al_TokenFields{$_l_FieldIndex})
		CO_at_TokenFields{$_l_FieldIndex}:=CO_at_FIeldNames{$_l_FieldRow}
	End for 
End if 
SHOW WINDOW:C435
CO_at_TokenOptions:=0
CO_at_TokenFields:=0
ERR_MethodTrackerReturn("OBJ [COMPANIES].CO_NewsSettings.oAddToken"; $_t_oldMethodName)

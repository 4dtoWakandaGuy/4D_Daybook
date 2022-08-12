If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oLBFunctionNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_AvailableFunctions;0)
	//ARRAY LONGINT(DBQR_al_FunctionType;0)
	//ARRAY TEXT(DBQR_at_FunctionCode;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row)
	C_TEXT:C284($_t_oldMethodName; $_t_ScriptCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_QR_EDITOR.oLBFunctionNames"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Double Clicked:K2:5)
		LISTBOX GET CELL POSITION:C971(DB_lb_AvailableFunctions; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			If (DBQR_al_FunctionType{$_l_Row}=2)
				$_t_ScriptCode:=DBQR_at_FunctionCode{$_l_Row}
				$_t_ScriptCode:=GEN_editRestictedMacro($_t_ScriptCode; 10; WF Macros)
			End if 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oLBFunctionNames"; $_t_oldMethodName)

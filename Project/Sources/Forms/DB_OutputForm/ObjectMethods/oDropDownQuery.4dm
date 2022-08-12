If (False:C215)
	//object Method Name: Object Name:      DB_OutputForm.oDropDownQuery
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/07/2012 19:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DB_at_PopUpSelector;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_ExecuteMethodName; $_t_oldMethodName; DB_t_SelectorFunction)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oDropDownQuery"; Form event code:C388)


$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		//$Formula:=DB_t_SelectorFunction+"("+Char(34)+DB_at_PopUpSelector{DB_at_PopUpSelector}+Char(34)+")"
		$_t_ExecuteMethodName:=DB_t_SelectorFunction
		EXECUTE METHOD:C1007($_t_ExecuteMethodName; *; DB_at_PopUpSelector{DB_at_PopUpSelector})
		//EXECUTE FORMULA($Formula)
		
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oDropDownQuery"; $_t_oldMethodName)

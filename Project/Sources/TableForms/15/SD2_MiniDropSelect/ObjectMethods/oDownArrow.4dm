If (False:C215)
	//object Name: [USER]SD2_MiniDropSelect.oDownArrow
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
	//ARRAY TEXT(SD2_at_ContactEmailSelect;0)
	C_LONGINT:C283(DOC_l_CallEvent; SD2_l_LastSelected)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_MiniDropSelect.oDownArrow"; Form event code:C388)

If (SD2_at_ContactEmailSelect<Size of array:C274(SD2_at_ContactEmailSelect))
	SD2_at_ContactEmailSelect:=SD2_at_ContactEmailSelect+1
	
	EDIT ITEM:C870(SD2_at_ContactEmailSelect; SD2_at_ContactEmailSelect)
	SD2_l_LastSelected:=SD2_at_ContactEmailSelect
	DOC_l_CallEvent:=0
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_MiniDropSelect.oDownArrow"; $_t_oldMethodName)

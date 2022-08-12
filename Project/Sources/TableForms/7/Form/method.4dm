If (False:C215)
	//Table Form Method Name: [DOCUMENTS]Form
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].Form"; Form event code:C388)
If (Form event code:C388=On Printing Detail:K2:18)
	//Set_FontFS_ByPointer ([DOCUMENTS]FDocument_Font;[DOCUMENTS]iDocument_Font_Size;->vText)
	SetFontsByPointerParameter([DOCUMENTS:7]Document_Font_Size:8; [DOCUMENTS:7]Document_Font:7; 0; ->vText)
	//Set_FontsFS ("vText";[DOCUMENTS]FDocument_Font;[DOCUMENTS]iDocument_Font_Size)
End if 
ERR_MethodTrackerReturn("FM [DOCUMENTS].Form"; $_t_oldMethodName)

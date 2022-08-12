If (False:C215)
	//Table Form Method Name: [DOCUMENTS]Letter_Cont
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(vPageNo)
	C_TEXT:C284($_t_oldMethodName; vLetterDate; vName; vText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].Letter_Cont"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		//Set_FontsFS ("vName+vLetterDate+vPageNo+vText";[DOCUMENTS]FDocument_Font;[DOCUMENTS]iDocument_Font_Size)
		SetFontsByPointerParameter([DOCUMENTS:7]Document_Font_Size:8; [DOCUMENTS:7]Document_Font:7; 0; ->vName; ->vLetterDate; ->vPageNo; ->vText)
End case 
ERR_MethodTrackerReturn("FM [DOCUMENTS].Letter_Cont"; $_t_oldMethodName)

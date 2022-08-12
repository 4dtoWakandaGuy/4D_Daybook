If (False:C215)
	//Table Form Method Name: [DOCUMENTS]Letter_Print
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
	C_TEXT:C284($_t_oldMethodName; vDetails; vHeading; vLetterDate; vOurRef; vSalutation; vText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].Letter_Print"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		If (vOurRef#"Our Ref@")
			vOurRef:="Our Ref: "+vOurRef
		End if 
		SetFontsByPointerParameter([DOCUMENTS:7]Document_Font_Size:8; [DOCUMENTS:7]Document_Font:7; 0; ->vOurRef; ->vLetterDate; ->vDetails; ->vSalutation; ->vHeading; ->vText)
		//Set_FontsFS ("vOurRef+vLetterDate+vDetails+vSalutation+vHeading+vText";[DOCUMENTS]FDocument_Font;[DOCUMENTS]iDocument_Font_Size)
End case 
ERR_MethodTrackerReturn("FM [DOCUMENTS].Letter_Print"; $_t_oldMethodName)

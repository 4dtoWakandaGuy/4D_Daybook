If (False:C215)
	//Table Form Method Name: [USER]SD2_EmailEntry
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/06/2010 18:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; SD2_bo_AttachmentBoxDone; SD2_bo_RecipientBoxDone; SD2_bo_SentFromFormButton)
	C_LONGINT:C283($_l_event; SD2_l_DocType)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD2_EmailEntry"; Form event code:C388)  //added error tracker call 08/07/08 -kmw

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		SD2_bo_AttachmentBoxDone:=False:C215
		SD2_bo_RecipientBoxDone:=False:C215
		SD2_bo_SentFromFormButton:=False:C215  //added 27/11/08 v631b120i -kmw
		//Remember this form loads TWO records-on document and one diary
		If ([DOCUMENTS:7]Document_Class:14=0)  //New document
			//NG December 2007-this should be prefernence so it uses the 4D write email if wanted
			SD2_l_DocType:=Text Email
			
		Else 
			SD2_l_DocType:=[DOCUMENTS:7]Document_Class:14
		End if 
		OpenHelp(Table:C252(->[DIARY:12]); "Diary_InEmail")
		INT_SetInput(Table:C252(->[DOCUMENTS:7]); "Diary_InEmail")
	: ($_l_event=On Activate:K2:9)
End case 
SD2_DiaryInLLP
ERR_MethodTrackerReturn("FM [USER].SD2_EmailEntry"; $_t_oldMethodName)  //added error tracker call 08/07/08 -kmw

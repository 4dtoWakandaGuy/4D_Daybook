If (False:C215)
	//Table Form Method Name: [DOCUMENTS]Mail_Envelope
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
	C_LONGINT:C283(<>DataSize)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].Mail_Envelope"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		//Set_Fonts ("vDetails+vOurRef";◊DataSize)
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vDetails; ->vOurRef)  //NG March 2006
End case 
ERR_MethodTrackerReturn("FM [DOCUMENTS].Mail_Envelope"; $_t_oldMethodName)

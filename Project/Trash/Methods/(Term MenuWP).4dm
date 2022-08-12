//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Term MenuWP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2012 11:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MenuProc)
	C_TEXT:C284($_t_NewDocumentItemName; $_t_oldMethodName; $_t_QuotesMenuItemName; $_t_ViewDocumentsItemName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Term MenuWP")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 


$_t_QuotesMenuItemName:=DB_GetTranslatedTerminology(Table:C252(->[ORDERS:24]); "View Letters & Quotes")
If ($_t_QuotesMenuItemName#"View Letters & Quotes")
	DB_MenuAction("Documents"; "View Letters & Quotes "; 1; $_t_QuotesMenuItemName; <>MenuProc; False:C215)
End if 
$_t_NewDocumentItemName:=DB_GetTranslatedTerminology(Table:C252(->[ORDERS:24]); "New Document")
If ($_t_NewDocumentItemName#"New Document")
	DB_MenuAction("Documents"; "New Document"; 1; $_t_NewDocumentItemName; <>MenuProc; False:C215)
End if 
$_t_ViewDocumentsItemName:=DB_GetTranslatedTerminology(Table:C252(->[ORDERS:24]); "View Documents")
If ($_t_ViewDocumentsItemName#"View Documents")
	DB_MenuAction("Documents"; "View Documents"; 1; $_t_ViewDocumentsItemName; <>MenuProc; False:C215)
End if 
$_t_QuotesMenuItemName:=DB_GetTranslatedTerminology(Table:C252(->[ORDERS:24]); "View Letters & Quotes")
If ($_t_QuotesMenuItemName#"View Letters & Quotes")
	DB_MenuAction("Documents"; "View Letters & Quotes "; 1; $_t_QuotesMenuItemName; <>MenuProc; False:C215)
	//  SET_MENU ITEM(4;5;"View Inquiries, Qtns, Orders";◊MenuProc)
End if 
ERR_MethodTrackerReturn("Term MenuWP"; $_t_oldMethodName)

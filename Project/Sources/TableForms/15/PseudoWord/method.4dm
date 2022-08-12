If (False:C215)
	//Table Form Method Name: [USER]PseudoWord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 16:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; Write_word)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].PseudoWord"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "PseudoWord")
		//Execute a command to put the document into the area
		
		If (Is macOS:C1572)
			WR OPEN DOCUMENT:P12000:48(Write_word; ""; "W8BN")
			$_bo_OK:=(OK=1)
		Else 
			WR OPEN DOCUMENT:P12000:48(Write_word; ""; ".DOC")
			$_bo_OK:=(OK=1)
		End if 
		If ($_bo_OK)
			
			WR SET AREA PROPERTY:P12000:137(Write_word; 0; 0)
			WR SET AREA PROPERTY:P12000:137(Write_word; 7; 1; "Document")
			WR EXECUTE COMMAND:P12000:113(Write_word; 20)
			//dont ask to save
			
			//   WR ON EVENT (Write_word;10;"DB_4DCancelWindow")
			CANCEL:C270
		Else 
			CANCEL:C270
		End if 
		
End case 
ERR_MethodTrackerReturn("FM:PseudoWord"; $_t_oldMethodName)

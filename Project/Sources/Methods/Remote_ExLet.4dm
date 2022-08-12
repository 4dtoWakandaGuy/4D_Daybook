//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_ExLet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess)
	C_TEXT:C284($_t_DocumentName; $_t_oldMethodName; $1; vFld; vRec)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_ExLet")
If (Records in selection:C76([DOCUMENTS:7])>0)
	MESSAGE:C88("      "+String:C10(Records in selection:C76([DOCUMENTS:7]))+" Documents"+Char:C90(13))
	SEND PACKET:C103(vDoc; "*FILE*"+vRec+"Documents"+vRec+String:C10(Records in selection:C76([DOCUMENTS:7]))+vRec)
	FIRST RECORD:C50([DOCUMENTS:7])
	While ((Not:C34(End selection:C36([DOCUMENTS:7]))) & (<>SYS_l_CancelProcess#<>Process))
		MESSAGE:C88("         "+[DOCUMENTS:7]Document_Code:1+Char:C90(13))
		SEND PACKET:C103(vDoc; [DOCUMENTS:7]Export:6+vFld+[DOCUMENTS:7]Document_Code:1+vFld+[DOCUMENTS:7]Heading:2+vFld)
		
		$_t_DocumentName:=$1+[PERSONNEL:11]Initials:1+[DOCUMENTS:7]Document_Code:1
		SET CHANNEL:C77(10; [PERSONNEL:11]Export_Path:11+Folder separator:K24:12+"Docs"+Folder separator:K24:12+$_t_DocumentName)
		If (OK=1)
			SEND RECORD:C78([DOCUMENTS:7])
			SET CHANNEL:C77(11)
		Else 
			MESSAGE:C88("         "+"The Document text could not be written"+Char:C90(13))
		End if 
		
		SEND PACKET:C103(vDoc; "Fetch: "+$_t_DocumentName+vFld)
		SEND PACKET:C103(vDoc; [DOCUMENTS:7]Document_Font:7+vFld+String:C10([DOCUMENTS:7]Document_Font_Size:8)+vFld+String:C10(Num:C11([DOCUMENTS:7]Standard:9))+vFld+[DOCUMENTS:7]Person:10+vFld)
		SEND PACKET:C103(vDoc; String:C10([DOCUMENTS:7]Table_Number:11)+vFld+[DOCUMENTS:7]Analysis_Code:12+vFld+[DOCUMENTS:7]Document_Type:13+vFld)
		SEND PACKET:C103(vDoc; vRec)
		NEXT RECORD:C51([DOCUMENTS:7])
	End while 
	SEND PACKET:C103(vDoc; "*END*"+vFld+vRec)
End if 
ERR_MethodTrackerReturn("Remote_ExLet"; $_t_oldMethodName)

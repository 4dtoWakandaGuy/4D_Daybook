//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ExDel
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
	C_TEXT:C284($_t_oldMethodName; vFld; vRec)
	C_TIME:C306(vDoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ExDel")
If (Records in selection:C76([DELETIONS:66])>0)
	MESSAGE:C88("      "+String:C10(Records in selection:C76([DELETIONS:66]))+" Deletions"+Char:C90(13))
	SEND PACKET:C103(vDoc; "*FILE*"+vRec+"Deletions"+vRec+String:C10(Records in selection:C76([DELETIONS:66]))+vRec)
	FIRST RECORD:C50([DELETIONS:66])
	While ((Not:C34(End selection:C36([DELETIONS:66]))) & (<>SYS_l_CancelProcess#<>Process))
		If (vFld=Char:C90(198))
			SEND PACKET:C103(vDoc; Replace string:C233(Replace string:C233([DELETIONS:66]Text:1; Char:C90(200); Char:C90(198)); Char:C90(201); Char:C90(183)))
		Else 
			SEND PACKET:C103(vDoc; [DELETIONS:66]Text:1)
		End if 
		NEXT RECORD:C51([DELETIONS:66])
	End while 
	SEND PACKET:C103(vDoc; "*END*"+vFld+vRec)
End if 
ERR_MethodTrackerReturn("Remote ExDel"; $_t_oldMethodName)
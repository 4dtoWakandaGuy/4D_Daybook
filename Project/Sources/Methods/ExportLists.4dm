//%attributes = {}
If (False:C215)
	//Project Method Name:      ExportLists
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_index)
	C_REAL:C285(MCOunt; Mi)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ExportLists")
If (True:C214)
	SET CHANNEL:C77(12; "")
	ALL RECORDS:C47([X_LISTS:111])
	MCOunt:=Records in selection:C76([X_LISTS:111])
	SEND VARIABLE:C80(MCount)
	For ($_l_index; 1; Records in selection:C76([X_LISTS:111]))
		
		SEND RECORD:C78([X_LISTS:111])
		NEXT RECORD:C51([X_LISTS:111])
	End for 
	SET CHANNEL:C77(11; "")
	SET CHANNEL:C77(12; "")
	ALL RECORDS:C47([LIST_ITEMS:95])
	MCOunt:=Records in selection:C76([LIST_ITEMS:95])
	SEND VARIABLE:C80(MCount)
	For ($_l_index; 1; Records in selection:C76([LIST_ITEMS:95]))
		
		SEND RECORD:C78([LIST_ITEMS:95])
		NEXT RECORD:C51([LIST_ITEMS:95])
	End for 
	SET CHANNEL:C77(11; "")
End if 

If (False:C215)
	
	Mi:=0
	READ WRITE:C146([X_LISTS:111])
	ALL RECORDS:C47([X_LISTS:111])
	DELETE SELECTION:C66([X_LISTS:111])
	SET CHANNEL:C77(13; "")
	RECEIVE VARIABLE:C81(Mcount)
	For (Mi; 1; MCount)
		RECEIVE RECORD:C79([X_LISTS:111])
		AA_CheckUUID(Table:C252(->[X_LISTS:111]))
		
		SAVE RECORD:C53([X_LISTS:111])
		
	End for 
	SET CHANNEL:C77(11)
	Mi:=0
	
	
	
	
	SET CHANNEL:C77(11)
	
	
	
	READ WRITE:C146([LIST_ITEMS:95])
	ALL RECORDS:C47([LIST_ITEMS:95])
	DELETE SELECTION:C66([LIST_ITEMS:95])
	SET CHANNEL:C77(13; "")
	RECEIVE VARIABLE:C81(mCount)
	
	For (Mi; 1; mCount)
		RECEIVE RECORD:C79([LIST_ITEMS:95])
		AA_CheckUUID(Table:C252(->[LIST_ITEMS:95]))
		
		SAVE RECORD:C53([LIST_ITEMS:95])
		
	End for 
	
End if 
ERR_MethodTrackerReturn("ExportLists"; $_t_oldMethodName)
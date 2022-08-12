//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_BKServerBlobtoVars
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
	C_LONGINT:C283($_l_offset; DM_l_BkserverPort)
	C_TEXT:C284($_t_oldMethodName; DM_t_BKFilePath; DM_t_BKServerIP; DM_t_BKServerName; DM_t_BusinessKitServer)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_BKServerBlobtoVars")
$_l_offset:=0
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_BKServerIP; $_l_offset)
If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_BkserverPort; $_l_offset)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_BKFilePath; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_BusinessKitServer; $_l_offset)
			DM_t_BKServerName:=DM_t_BusinessKitServer
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DM_BKServerBlobtoVars"; $_t_oldMethodName)
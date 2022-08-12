//%attributes = {}
If (False:C215)
	//Project Method Name:      RecordUser
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK)
	C_TEXT:C284($_t_CurrentActiveDirectory; $_t_DocName; $_t_oldMethodName; $1; $2)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("RecordUser")
//this simple method will record who logs on as what
//this is so we can set up the single password system

If (Count parameters:C259>=2)
	While (Semaphore:C143("$WriteUserDoc"))
		DelayTicks(2)
	End while 
	$_t_CurrentActiveDirectory:=Get 4D folder:C485
	$_t_DocName:="users.txt"
	$_l_OK:=Test path name:C476($_t_CurrentActiveDirectory+$_t_DocName)
	If ($_l_OK>0)
		//``
		$_ti_DocumentRef:=Append document:C265($_t_CurrentActiveDirectory+$_t_DocName; "TEXT")
	Else 
		$_ti_DocumentRef:=DB_CreateDocument($_t_CurrentActiveDirectory+$_t_DocName; "TEXT")
	End if 
	SEND PACKET:C103($_ti_DocumentRef; $2+Char:C90(9)+$1+Char:C90(13))
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	CLEAR SEMAPHORE:C144("$WriteUserDoc")
End if 
ERR_MethodTrackerReturn("RecordUser"; $_t_oldMethodName)
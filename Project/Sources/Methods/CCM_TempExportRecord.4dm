//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_TempExportRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_BlobSize; $_l_offset)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_Text)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_TempExportRecord")
If (Count parameters:C259>=1)
	$_l_BlobSize:=BLOB size:C605($1->)
	$_l_offset:=0
	COPY BLOB:C558($1->; [CCM_PSPTransaction:136]SENTDATA:6; $_l_offset; $_l_offset; $_l_BlobSize)
	$_t_Text:=BLOB to text:C555($1->; 3)
	$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT")
	SEND PACKET:C103($_ti_DocumentRef; $_t_Text)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
End if 
ERR_MethodTrackerReturn("CCM_TempExportRecord"; $_t_oldMethodName)
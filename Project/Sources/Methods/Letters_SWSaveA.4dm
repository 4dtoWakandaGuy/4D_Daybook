//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_SWSaveA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>SYS_t_4DWriteType; $_t_oldMethodName; vTitle1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_SWSaveA")
If (Gen_Option)
	If (<>SYS_t_4DWriteType="WS")  // 4DWrite "Silver"
		//WR O DO COMMAND (Write;104;1)
		WR EXECUTE COMMAND:P12000:113(104)
		// Else
		//  $r:=SW Do Command (Write;107;1) `SuperWrite out 24/04/02 pb
	End if 
Else 
	Open_Any_Window(275; 448)
	DIALOG:C40([DOCUMENTS:7]; "dSaveAs")
	CLOSE WINDOW:C154
	$_l_OK:=OK
	OK:=1
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	If ($_l_OK=1)
		SET WINDOW TITLE:C213(vTitle1)
		DB_bo_RecordModified:=False:C215
	Else 
		DB_bo_RecordModified:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("Letters_SWSaveA"; $_t_oldMethodName)
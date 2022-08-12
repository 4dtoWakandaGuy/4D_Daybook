If (False:C215)
	//object Name: [WEBSETUP_4D]WebLog.Variable2373
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_WindowReferenceRow; $_l_WindowRow; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebLog.Variable2373"; Form event code:C388)
If (Form event code:C388=On Clicked:K2:4)
	UTI_WinCenter(400; 350; 8; "IP Ranges")
	DIALOG:C40([WEBSETUP_4D:129]; "IPRanges")
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:WebLog,bIPRanges"; $_t_oldMethodName)

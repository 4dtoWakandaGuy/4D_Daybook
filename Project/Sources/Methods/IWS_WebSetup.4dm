//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_WebSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:32
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
	C_LONGINT:C283($_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>IWS_t_LogProcess; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_WebSetup")
If (Process number:C372(<>IWS_t_LogProcess)>0)
	ALERT:C41("The settings cannot be changed while the web server is running!")
Else 
	If (Records in table:C83([WEBSETUP_4D:129])=0)
		IWS_InitWebSetup
	End if 
	READ WRITE:C146([WEBSETUP_4D:129])
	ALL RECORDS:C47([WEBSETUP_4D:129])
	UTI_WinCenter(700; 420; 0; "Web Server Setup")
	FORM SET INPUT:C55([WEBSETUP_4D:129]; "Input")
	MODIFY RECORD:C57([WEBSETUP_4D:129]; *)
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	IWS_ReadWebSetup
End if 
ERR_MethodTrackerReturn("IWS_WebSetup"; $_t_oldMethodName)
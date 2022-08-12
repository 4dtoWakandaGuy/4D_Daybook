//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_LogArrayInfo
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
	//ARRAY TEXT(<>IWS_at_ProcessName;0)
	//ARRAY TEXT(LOG_at_MethodNames;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_WindowReferenceRow; $ProcessNumber; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; LOG_s_ProcessName; LOG_s_ProcessState)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_LogArrayInfo")
Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		LOG_s_ProcessName:=<>IWS_at_ProcessName{<>IWS_at_ProcessName}
		$ProcessNumber:=Process number:C372(LOG_s_ProcessName)
		GET PROCESS VARIABLE:C371($ProcessNumber; LOG_at_MethodNames; LOG_at_MethodNames)
		LOG_s_ProcessState:=UTI_ProcessState($ProcessNumber)
		UTI_WinCenter(350; 300; 1)
		DIALOG:C40([WEBSETUP_4D:129]; "WebLogDetail_d")
		CLOSE WINDOW:C154
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		// ALERT($_t_Alert)
End case 
ERR_MethodTrackerReturn("IWS_LogArrayInfo"; $_t_oldMethodName)
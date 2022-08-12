//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_ReleaseStream
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 10:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>IWS_al_StreamListenMS;0)
	//ARRAY LONGINT(<>IWS_al_StreamListens;0)
	C_BOOLEAN:C305(<>IWS_bo_ConnectLogging; <>IWS_bo_StreamLogging; $_bo_Locked)
	C_LONGINT:C283(<>IWS_l_BadReleases; <>IWS_l_Releases; $_l_Error; $_l_StreamRow; $0; $1; IWS_l_Count; IWS_l_Stream)
	C_TEXT:C284(<>STR_t_CR; <>STR_t_LF; <>Web_t_ServerHandler; $_t_Message; $_t_oldMethodName; $_t_Semaphore)
	C_TIME:C306(<>IWS_ti_StreamDoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_ReleaseStream")
//LOG_SetMethod ("IWS_ReleaseStream")
//******************************************************************************
//
//Method: IWS_ReleaseStream
//
//Written by  John Moore on 11/5/98
//
//Purpose: Releases a stream

//******************************************************************************


Case of 
	: (<>Web_t_ServerHandler="ITK")
		
		
		IWS_l_Stream:=$1
		$_bo_Locked:=False:C215
		If (<>IWS_bo_StreamLogging)
			$_t_Semaphore:="$_l_Stream"
			If (UTI_Semaphore($_t_Semaphore))
				$_bo_Locked:=True:C214
			Else 
				$_bo_Locked:=False:C215
			End if 
		End if 
		If (Not:C34($_bo_Locked))
			//$_l_Error:=ITK_TCPRelease (IWS_l_Stream))ITK OUT AUgust 2009
			If (<>IWS_bo_StreamLogging)
				$_l_StreamRow:=UTI_ArraySearch(-><>IWS_al_StreamListens; ->IWS_l_Stream; ->IWS_l_Count)
				If ($_l_StreamRow>0)
					If (IWS_l_Count>1)
						If (<>IWS_ti_StreamDoc#?00:00:00?)
							$_t_Message:="RELEASING: There were already "+String:C10(IWS_l_Count)+" streams with the number "+String:C10(IWS_l_Stream)+" ("+UTI_ProcessName+")"
							SEND PACKET:C103(<>IWS_ti_StreamDoc; $_t_Message+<>STR_t_CR+<>STR_t_LF)
						End if 
					End if 
					DELETE FROM ARRAY:C228(<>IWS_al_StreamListens; $_l_StreamRow)
					DELETE FROM ARRAY:C228(<>IWS_al_StreamListenMS; $_l_StreamRow)
				Else 
					If (<>IWS_ti_StreamDoc#?00:00:00?)
						$_t_Message:="RELEASING: Could not find stream with the number "+String:C10(IWS_l_Stream)+" ("+UTI_ProcessName+")"
						SEND PACKET:C103(<>IWS_ti_StreamDoc; $_t_Message+<>STR_t_CR+<>STR_t_LF)
					End if 
				End if 
				If ($_t_Semaphore#"")
					UTI_ClearSemaphore($_t_Semaphore)
				End if 
			End if 
			
			If ($_l_Error=0)
				<>IWS_l_Releases:=<>IWS_l_Releases+1
			Else 
				<>IWS_l_BadReleases:=<>IWS_l_BadReleases+1
			End if 
			$0:=$_l_Error
			
			If (<>IWS_bo_ConnectLogging)
				IWS_RecordRelease(IWS_l_Stream)
			End if 
		End if 
		
		
	: (<>Web_t_ServerHandler="NTK")
		
		Gen_Alert("Developer error. Method 'IWS_ReleaseSream' is unsupported (and shouldn't be requi"+"r"+"ed to be call"+"ed) by NTK. Please reportthis error to a developer.")
		
		$0:=0
		
	Else 
		
		$0:=0
End case 


//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_ReleaseStream"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_ListenStream
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>IWS_al_StreamListenMS;0)
	//ARRAY LONGINT(<>IWS_al_StreamListens;0)
	C_BOOLEAN:C305(<>IWS_bo_StreamLogging; $_bo_Locked)
	C_LONGINT:C283(<>IWS_l_BadListens; <>IWS_l_Listens; $_l_Position; $0; IWS_l_Count; IWS_l_Stream)
	C_TEXT:C284(<>STR_t_CR; <>STR_t_LF; <>Web_t_ServerHandler; $_t_Message; $_t_oldMethodName; $_t_Semaphore)
	C_TIME:C306(<>IWS_ti_StreamDoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_ListenStream")


Case of 
	: (<>Web_t_ServerHandler="ITK")
		
		//C_INTEGER(◊IWS_l_BadListens)
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
			//IWS_l_Stream:=ITK_TCPListen (0;0;◊IWS_l_WebPort;0;0;0;◊IWS_l_LocalAddress)  `changed by John to listen on a particular addressITK OUT
			
			If (<>IWS_bo_StreamLogging)
				$_l_Position:=UTI_ArraySearch(-><>IWS_al_StreamListens; ->IWS_l_Stream; ->IWS_l_Count)
				
				If ($_l_Position>0)
					If (IWS_l_Count>1) & (<>IWS_ti_StreamDoc#?00:00:00?)
						$_t_Message:="There are already "+String:C10(IWS_l_Count)+" streams with the number "+String:C10(IWS_l_Stream)
					Else 
						$_t_Message:="There is already a stream with the number "+String:C10(IWS_l_Stream)
					End if 
					SEND PACKET:C103(<>IWS_ti_StreamDoc; $_t_Message+<>STR_t_CR+<>STR_t_LF)
				End if 
				$_l_Position:=Abs:C99($_l_Position)
				UTI_ArrayInsertElements($_l_Position; 1; -><>IWS_al_StreamListens; -><>IWS_al_StreamListenMS)
				
				<>IWS_al_StreamListens{$_l_Position}:=IWS_l_Stream
				<>IWS_al_StreamListenMS{$_l_Position}:=0  //Milliseconds
				If ($_t_Semaphore#"")
					UTI_ClearSemaphore($_t_Semaphore)
				End if 
			End if 
			
			If (IWS_l_Stream>0)
				<>IWS_l_Listens:=<>IWS_l_Listens+1
			Else 
				<>IWS_l_BadListens:=<>IWS_l_BadListens+1
			End if 
			$0:=IWS_l_Stream
			
		End if 
		
		
	: (<>Web_t_ServerHandler="NTK")
		
		Gen_Alert("Developer error. Method 'IWS_ListenSream' is unsupported (and shouldn't be requir"+"ed to be call"+"ed) by NTK. Please reportthis error to a developer.")
		
		$0:=0
	Else 
		$0:=0
		
End case 
ERR_MethodTrackerReturn("IWS_ListenStream"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 16/11/2009 11:14:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 16/11/2009 11:14:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 16/11/2009 11:14:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 16/11/2009 11:14:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 16/11/2009 11:14:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 16/11/2009 11:14:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 16/11/2009 11:14:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 16/11/2009 11:14:41If (False)// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 16/11/2009 11:14:41//Method Name: ERR_MethodTrackerReturn
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
End if 
If (False:C215)  //in V18 we no longer need this because we can always get the stack
	If (True:C214)  //This method is getting disabled for V11 to speed the programme up
		C_TEXT:C284($1; $2)
		C_BOOLEAN:C305(DB_bo_ERR_TrackstackOnExit)  //added call chain recording/reporting 18/10/07 -kmw
		If (Not:C34(<>DB_Bo_ERRTrackerInited))
			C_BOOLEAN:C305(<>Err_bo_PrefShowChainInErrorMess)  //added -kmw, 25/10/07
			C_BOOLEAN:C305(<>Err_bo_PrefShowChainInErrorEmai)  //added 26/10/07 -kmw
		End if 
		//NG June 2004
		//This method should be called at the end of every method to return the current method name to what it was
		
		If (Count parameters:C259>=2)
			
			If ((<>Err_bo_PrefShowChainInErrorMess) | (<>Err_bo_PrefShowChainInErrorEmai))  //added call chain recording/reporting 18/10/7-kmw
				
				DB_bo_ERR_TrackstackOnExit:=True:C214  //added call chain recording/reporting 18/10/7-kmw
			End if 
			
			
			C_BOOLEAN:C305(SYS_bo_NoTrack)
			If (Not:C34(SYS_bo_NoTrack))
				
				If ($1#"")
					If ($2#$1)
						If ($2#"")
						Else 
							$Nul:=ERR_MethodTracker("End "+$1)
						End if 
						If ($2#"")
							$Nul:=ERR_MethodTracker($2)
						End if 
					End if 
				End if 
			End if 
			If (<>Err_bo_PrefShowChainInErrorMess) | (<>Err_bo_PrefShowChainInErrorEmai) & (Count parameters:C259>0)
				DB_bo_ERR_TrackstackOnExit:=False:C215
				
			End if 
			
			
		End if 
	End if 
End if 
If (Count parameters:C259>=2)
	//LOG_SimpleLog($1; "Return to :"+$2)
Else 
	//LOG_SimpleLog($1; "EndMethod")
End if 

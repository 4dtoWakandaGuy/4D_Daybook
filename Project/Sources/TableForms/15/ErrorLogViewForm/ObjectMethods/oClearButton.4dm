If (False:C215)
	//object Name: [USER]ErrorLogViewForm.oClearButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/03/2013 14:58
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_NoTrack; SYS_bo_NoTrack)
	C_LONGINT:C283(<>DB_l_LocalLog; <>DB_l_TrackPath; <>Err_l_DebugLogStatus)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]ErrorLogViewForm.oClearButton"; Form event code:C388)


//$_t_oldMethodName:=ERR_MethodTracker ("OBJ [USER].ErrorLogViewForm.oClearButton";Form event)
If (Form event code:C388=On Clicked:K2:4)
	
	Case of 
		: (<>Err_l_DebugLogStatus=0)  //should never be
			CANCEL:C270
		: (<>Err_l_DebugLogStatus=1) | (<>DB_l_TrackPath=1)
			
			$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
			SYS_bo_NoTrack:=True:C214
			Gen_Confirm("Continue writing to log file"; "Yes"; "No")
			SYS_bo_NoTrack:=$_bo_NoTrack  //11/03/09 v631b120p -kmw
			
			If (OK=0)
				//TRACE
				<>DB_l_LocalLog:=0
				<>DB_l_TrackPath:=0
				<>Err_l_DebugLogStatus:=0
			Else 
				//TRACE
				<>DB_l_LocalLog:=1
				<>DB_l_TrackPath:=1
				<>Err_l_DebugLogStatus:=1
			End if 
			CANCEL:C270
		: (<>Err_l_DebugLogStatus=2)
			If (<>DB_l_TrackPath=1)
				$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
				SYS_bo_NoTrack:=True:C214  //11/03/09 v631b120p -kmw
				Gen_Confirm("Continue writing to log file"; "Yes"; "No")
				SYS_bo_NoTrack:=$_bo_NoTrack  //11/03/09 v631b120p -kmw
				
				If (OK=0)
					//TRACE
					<>DB_l_LocalLog:=0
					<>DB_l_TrackPath:=0
					<>Err_l_DebugLogStatus:=0
				Else 
					//TRACE
					<>DB_l_LocalLog:=1
					<>DB_l_TrackPath:=1
					<>Err_l_DebugLogStatus:=1
				End if 
				CANCEL:C270
				
			Else 
				
				<>Err_l_DebugLogStatus:=0
				CANCEL:C270
			End if 
		Else 
			//TRACE
			<>Err_l_DebugLogStatus:=0
	End case 
	
End if 
//
ERR_MethodTrackerReturn("OBJ [USER].ErrorLogViewForm.oClearButton"; $_t_oldMethodName)
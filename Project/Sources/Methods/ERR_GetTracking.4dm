//%attributes = {}
If (False:C215)
	
	
	// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 10/12/2010 16:43
	//Method Name: ERR_GetTracking
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
End if 
//$_t_oldMethodName:=ERR_MethodTracker ("ERR_GetTracking")
C_TEXT:C284(DB_t_TrackingMethodName)

C_LONGINT:C283(<>DB_l_TrackPath; <>DB_l_LocalLog; <>DB_l_GenerateLogOnServer; DB_l_TrackingEvent; DB_l_TrackPath)
C_TEXT:C284($0; $_t_ErrorText)
$0:=""
If (<>DB_l_TrackPath>0)
	//
	//Following semapahore creation block commented out 12/12/08 v631b120l / v631b120h_4 -kmw (why was this here? - it does it later anyway)
	
	//While (Semaphore("$Upderrtrack"))
	//IDLE
	//DelayTicks (2)
	//  `beep
	//
	//End while
	
	
	$_t_ErrorText:=""
	$_t_ErrorText:="METHOD"+Char:C90(9)+"FORM"+Char:C90(9)+"TRIGGER"+Char:C90(9)+"OBJECT"+Char:C90(9)+"EVENT"+Char:C90(9)+"DATA"+Char:C90(9)+"Process_Name"+Char:C90(9)+"Process Identity"+Char:C90(9)+"Process Origin"+Char:C90(9)+"Millisecond"+Char:C90(13)
	
	While (Semaphore:C143("$Upderrtrack"))
		
		DelayTicks(2)
	End while 
	
	For ($_l_Index; 1; Size of array:C274(<>DB_al_TrackingEvent))
		$_t_ErrorText:=$_t_ErrorText+<>DB_at_TrackMethodName{$_l_Index}+Char:C90(9)+<>DB_at_TrackFormName{$_l_Index}+Char:C90(9)+<>DB_at_TrackTriggerName{$_l_Index}+Char:C90(9)+<>DB_at_TrackObjectName{$_l_Index}+Char:C90(9)+String:C10(<>DB_al_TrackingEvent{$_l_Index})+Char:C90(9)+<>DB_at_TrackingData{$_l_Index}+Char:C90(9)
		$_t_ErrorText:=$_t_ErrorText+<>DB_at_TrackProcessName{$_l_Index}+Char:C90(9)+String:C10(<>DB_al_TrackingProcessID{$_l_Index})+Char:C90(9)+<>DB_at_TrackProcessOrigin{$_l_Index}+Char:C90(9)+Char:C90(13)
	End for 
	
	C_BOOLEAN:C305(DB_Bo_DontReleaseUpderrtrackSem)  //Added 12/12/08 v631b120l / v631b120h_4 -kmw (we don't want to release this semaphore if we already had control of it when we arrived....that would be premature)
	If (DB_Bo_DontReleaseUpderrtrackSem=False:C215)  //Added 12/12/08 v631b120l / v631b120h_4 -kmw (we don't want to release this semaphore if we already had control of it when we arrived....that would be premature)
		CLEAR SEMAPHORE:C144("$Upderrtrack")
	End if   //Added 12/12/08 v631b120l / v631b120h_4 -kmw (we don't want to release this semaphore if we already had control of it when we arrived....that would be premature)
	
	$0:=$_t_ErrorText
	
Else 
	If (DB_l_TrackingEvent>0)
		$0:=DB_t_TrackingMethodName+" :"+String:C10(DB_l_TrackingEvent)
	Else 
		$0:=DB_t_TrackingMethodName
	End if 
	
	
	//Following semapahore clearance line commented out 12/12/08 v631b120l / v631b120h_4 -kmw (why was this here...semaphore shouldn't be set anyway...and if it is it should proabbly stay that way)
	
	//CLEAR SEMAPHORE("$Upderrtrack")
End if 


//ERR_MethodTrackerReturn ("ERR_GetTracking";$_t_oldMethodName)
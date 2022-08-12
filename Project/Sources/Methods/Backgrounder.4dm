//%attributes = {}

If (False:C215)
	//Project Method Name:      Backgrounder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_DelayedCopyofBackup; <>SYS_bo_QuitCalled; SYS_bo_BackupEnabled)
	C_LONGINT:C283(<>SYS_bo_ReloadBackupPrefs; $_l_CurrentTime; $_l_Retries; $_l_ServiceProcess; $_l_Timer; SYS_l_DelaySeconds)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Backgrounder")
//NG Modified 28/09/2009 to remove not needed call to get licence version
$_l_Retries:=0
While (Test semaphore:C652("$DuringLogin"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*(1+$_l_Retries))
End while 

If (Application type:C494#4D Remote mode:K5:5)
	$_l_ServiceProcess:=New process:C317("DB_DATACHECKER"; 256000; "Data Index Checker"; *)
End if 
Licence_Init  //bsw 11/12/03

SYS_l_DelaySeconds:=60*60*5  //By default

BP_LoadPrefs  //BSW 29/01/03 BP_LoadPrefs - Declare variables to start with
$_l_Timer:=Current time:C178*1

Case of 
	: (Application type:C494=4D Server:K5:6)
		$_l_ServiceProcess:=New process:C317("ProcessServices"; 256*1024; "Service Process"; *)  // 12/02/03 BSW only starts if Process_Not running
		
	: (ApplicationType_isSingleUser)
		$_l_ServiceProcess:=New process:C317("ProcessServices"; 256*1024; "Service Process"; *)
		
	Else 
		//Do nothing
End case 
If (<>SYS_bo_DelayedCopyofBackup)
	//NG MArch 2004...this is not needed now as the copy documents is moved to the Backup shutdown so copy can happen every time
	//unless it is delayed
	
	Repeat 
		IDLE:C311
		Case of 
			: (Application type:C494=4D Server:K5:6)
				$_l_ServiceProcess:=New process:C317("ProcessServices"; 256*1024; "Service Process"; *)  // 12/02/03 BSW only starts if Process_Not running
				
			: (ApplicationType_isSingleUser)
				$_l_ServiceProcess:=New process:C317("ProcessServices"; 256*1024; "Service Process"; *)
				
			Else 
				//Do nothing
		End case 
		
		$_l_CurrentTime:=Current time:C178*1
		
		Case of 
			: (<>SYS_bo_ReloadBackupPrefs>0)
				BP_LoadPrefs  //BSW Load the prefs again in case updated since last load
				<>SYS_bo_ReloadBackupPrefs:=0
				
			: ($_l_CurrentTime>($_l_Timer+300))  //Reload prefs every 10 mins
				BP_LoadPrefs  //BSW Load the prefs again in case updated since last load
				$_l_Timer:=Current time:C178*1
		End case 
		
		If (SYS_bo_BackupEnabled)  //If backup pref is enabled than go ahead
			$_l_Retries:=0
			While (Test semaphore:C652("BackupinProgress"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*(1+$_l_Retries))
			End while 
			BP_SyncBackup
			
			BP_LoadPrefs  //Refresh date variable otherwise backup keeps happening
		End if 
		Case of 
			: (Application type:C494=4D Server:K5:6)
				$_l_ServiceProcess:=New process:C317("ProcessServices"; 256*1024; "Service Process"; *)  // 12/02/03 BSW only starts if Process_Not running
				
			: (ApplicationType_isSingleUser)
				$_l_ServiceProcess:=New process:C317("ProcessServices"; 256*1024; "Service Process"; *)
				
			Else 
				//Do nothing
		End case 
		
		DelayTicks(SYS_l_DelaySeconds)
		
	Until ((Process aborted:C672) | (<>SYS_bo_QuitCalled)) | (<>SYS_bo_DelayedCopyofBackup=False:C215)
Else 
	
	
End if 
ERR_MethodTrackerReturn("Backgrounder"; $_t_oldMethodName)

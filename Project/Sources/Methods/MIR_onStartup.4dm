//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_onStartup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Mir_f_Quit; MIR_bo_SoapPresent)
	C_LONGINT:C283(<>MIR_l_MainProcess; $_l_DocumentLength; $LProcessID)
	C_REAL:C285(<>LogFileID)
	C_TEXT:C284($_t_LogFIle; $_t_oldMethodName)
	C_TIME:C306(<>Mir_ti_Time; <>Mir_ti_TimeInterval)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_onStartup")


// Declare local variables
<>MIR_l_MainProcess:=Current process:C322
// Log file integrity
//NG what does this get on Client?

$_t_LogFIle:=Log file:C928
If ($_t_LogFIle#"")
	$_l_DocumentLength:=Length:C16($_t_LogFIle)
	<>LogFileID:=Num:C11(Substring:C12($_t_LogFIle; $_l_DocumentLength-8; 4))
End if 

If (Application type:C494=4D Server:K5:6)
	If (Not:C34(Is compiled mode:C492))
		COMPILER_MIR
	End if 
	<>Mir_f_Quit:=False:C215
	<>Mir_ti_Time:=?00:00:00?
	<>Mir_ti_TimeInterval:=?00:00:00?
	$LProcessID:=New process:C317("MIR_P_MirrorProcess"; 256000; "MirroringProcess")
End if 
//End of method
ERR_MethodTrackerReturn("MIR_onStartup"; $_t_oldMethodName)

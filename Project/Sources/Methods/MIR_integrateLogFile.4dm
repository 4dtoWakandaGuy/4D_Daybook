//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_integrateLogFile
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
	C_BOOLEAN:C305(<>doneintegre; $_bo_Semaphore)
	C_LONGINT:C283(MIR_l_SOAP_LErrorNumber)
	C_REAL:C285(<>ErrInt)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_integrateLogFile")

MIR_l_SOAP_LErrorNumber:=0
//Get the current handler here first
ON ERR CALL:C155("MIR_OnErrHandler")
$_bo_Semaphore:=Semaphore:C143("integrationinprogress")
//_O_INTEGRATE LOG FILE($1)
//INTEGRATE MIRROR LOG FILE($1;-2;1)


<>doneintegre:=True:C214
ON ERR CALL:C155("")
<>ErrInt:=MIR_l_SOAP_LErrorNumber
CLEAR SEMAPHORE:C144("integrationinprogress")
ERR_MethodTrackerReturn("MIR_integrateLogFile"; $_t_oldMethodName)
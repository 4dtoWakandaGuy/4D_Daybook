//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_LOGThis
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($iDifference; $iDiffFromStart; $iMS)
	C_REAL:C285(iLogMS; iLogMSStart)
	C_TEXT:C284(<>CR; $_t_oldMethodName; $1)
	C_TIME:C306(<>LogDoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_LOGThis")
//IWS_LOGThis

//If (◊bLog)

If (iLogMS=0)
	
	//iLogMS:=0`Milliseconds
	iLogMSStart:=iLogMS
	SEND PACKET:C103(<>LogDoc; $1+<>CR)
	
Else 
	
	$iMS:=0  //Milliseconds
	$iDifference:=$iMS-iLogMS
	$iDiffFromStart:=$iMS-iLogMSStart
	iLogMS:=$iMS
	
	SEND PACKET:C103(<>LogDoc; String:C10($iDifference)+" - "+String:C10($iDiffFromStart)+" - "+$1+<>CR)
	
End if 

//End if
ERR_MethodTrackerReturn("IWS_LOGThis"; $_t_oldMethodName)
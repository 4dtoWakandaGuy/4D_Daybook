//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_LocalIPAddress
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
	C_LONGINT:C283(<>IWS_l_Webport)
	C_TEXT:C284(<>IWS_t_LocalAddress; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_LocalIPAddress")
//$Result:=ITK_TCPInfos ($LocalIP;$Version1;$Version2;$ITKVersion)

If (<>IWS_l_Webport#80)
	$0:=<>IWS_t_LocalAddress+":"+String:C10(<>IWS_l_Webport)  //IWS_DottedIPAddress ($LocalIP)
Else 
	$0:=<>IWS_t_LocalAddress
End if 
ERR_MethodTrackerReturn("IWS_LocalIPAddress"; $_t_oldMethodName)
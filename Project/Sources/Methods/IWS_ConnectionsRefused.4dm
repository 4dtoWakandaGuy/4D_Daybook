//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_ConnectionsRefused
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
	C_BOOLEAN:C305($0)
	C_LONGINT:C283(<>IWS_l_RefuseConnections)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_ConnectionsRefused")
//******************************************************************************
//
//Method: IWS_ConnectionsRefused
//
//Written by  John on 18/09/98
//
//Purpose:
//
//$0 - boolean, are connections refused or not

//******************************************************************************

If (<>IWS_l_RefuseConnections=1)  //set in WebLog form
	$0:=True:C214
Else 
	$0:=False:C215
End if 

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_ConnectionsRefused"; $_t_oldMethodName)
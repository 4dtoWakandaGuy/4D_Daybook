//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetTCPInfo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 19:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>IWS_l_AllStreams; <>IWS_l_ConnectsAborted; <>IWS_l_ConnectsAccepted; <>IWS_l_ConnectsAttempted; <>IWS_l_ConnectsClosed; <>IWS_l_ConnectsOpened; <>IWS_l_MaxConnections; <>IWS_l_ServerSocket)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_oldMethodName; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetTCPInfo")
//******************************************************************************
//
//Method: IWS_GetTCPInfo
//
//Written by  John Moore on 11/4/98
//
//Purpose: Returns a bunch of figures about how TCP is doing

//
IWS_t_CurrentMethodName:="IWS_GetTCPInfo"
//
//C_INTEGER(◊IWS_l_AllStreams)
//******************************************************************************

Case of 
	: (<>Web_t_ServerHandler="ITK")
		
		//◊IWS_l_MaxConnections:=ITK_TCPGlobInfo (5) ITK OUT
		//◊IWS_l_ConnectsAttempted:=ITK_TCPGlobInfo (6)ITK OUT
		//◊IWS_l_ConnectsOpened:=ITK_TCPGlobInfo (7)ITK OUT
		//◊IWS_l_ConnectsAccepted:=ITK_TCPGlobInfo (8)ITK OUT
		//◊IWS_l_ConnectsClosed:=ITK_TCPGlobInfo (9)ITK OUT
		//◊IWS_l_ConnectsAborted:=ITK_TCPGlobInfo (10)ITK OUT
		//◊IWS_l_AllStreams:=ITK_TCPGetStrm (0)ITK OUT
		ERR_MethodTrackerReturn("IWS_GetTCPInfo"; $_t_oldMethodName)
		
	: (<>Web_t_ServerHandler="NTK")
		If (TCP Get State(<>IWS_l_ServerSocket)=TCP Listening)
			
			<>IWS_l_MaxConnections:=TCP Get Statistics(<>IWS_l_ServerSocket; TCP Maximum Connections)
			<>IWS_l_ConnectsAttempted:=TCP Get Statistics(<>IWS_l_ServerSocket; TCP Attempted Connections)
			<>IWS_l_ConnectsOpened:=TCP Get Statistics(<>IWS_l_ServerSocket; TCP Accepted Connections)
			<>IWS_l_ConnectsAccepted:=TCP Get Statistics(<>IWS_l_ServerSocket; TCP Accepted Connections)
			<>IWS_l_ConnectsClosed:=TCP Get Statistics(<>IWS_l_ServerSocket; TCP Closed Connections)
			<>IWS_l_ConnectsAborted:=TCP Get Statistics(<>IWS_l_ServerSocket; TCP Aborted Connections)
			<>IWS_l_AllStreams:=TCP Get Statistics(<>IWS_l_ServerSocket; TCP Active Connections)
			
		End if 
	Else 
End case 
ERR_MethodTrackerReturn("IWS_GetTCPInfo"; $_t_oldMethodName)
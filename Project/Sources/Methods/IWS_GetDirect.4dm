//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetDirect
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
	C_LONGINT:C283($_l_CharPosition)
	C_TEXT:C284($_t_oldMethodName; $_t_OutputString; $0; IWS_t_Request)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetDirect")
//******************************************************************************
//
//Method: IWS_GetDirect
//
//Written by  Rollo on 8/26/98
//
//Purpose:
//
//$0 - string - return just the page - or Direct variable - from IWS_t_Request

//******************************************************************************



Case of 
	: (IWS_t_Request="GET /@")
		$_t_OutputString:=Substring:C12(IWS_t_Request; 6)
	: (IWS_t_Request="POST /@")
		$_t_OutputString:=Substring:C12(IWS_t_Request; 7)
	Else 
		$_t_OutputString:=IWS_t_Request
End case 
$_l_CharPosition:=Position:C15("?"; $_t_OutputString)
If ($_l_CharPosition=0)
	$_l_CharPosition:=Position:C15("HTTP"; $_t_OutputString)
	$_t_OutputString:=Substring:C12($_t_OutputString; 1; $_l_CharPosition-2)
Else 
	$_t_OutputString:=Substring:C12($_t_OutputString; 1; $_l_CharPosition-1)
End if 
$0:=$_t_OutputString
ERR_MethodTrackerReturn("IWS_GetDirect"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      SYS_SetWebServer
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
	C_TEXT:C284(<>SYS_s_WebServer; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SYS_SetWebServer")
//******************************************************************************
//
//Method: SYS_SetWebServer
//
//Written by  Rollo on 8/25/98
//
//Purpose:
//
//$1 - string -web server type
//
//******************************************************************************

<>SYS_s_WebServer:=$1
ERR_MethodTrackerReturn("SYS_SetWebServer"; $_t_oldMethodName)
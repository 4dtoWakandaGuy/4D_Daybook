//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetFilename
	//------------------ Method Notes ------------------
	//
	//Method: IWS_GetFilename
	//
	//Written by  John on 14/09/98
	//
	//Purpose: Gets filename from HTTP request
	//
	//$0 - text, filename to return
	
	//Dependent on IWS_t_GetURL having been called first
	//
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_StartPosition)
	C_TEXT:C284(<>IWS_t_StaticFolder; <>IWS_t_StaticPrefix; <>STR_s_Sep; $_t_oldMethodName; $_t_URL; $0; IWS_t_URL)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetFilename")

If (IWS_t_URL=(<>IWS_t_StaticPrefix+"/@"))
	$_l_StartPosition:=Length:C16(<>IWS_t_StaticPrefix+"/")+1
	$_t_URL:=Substring:C12(IWS_t_URL; $_l_StartPosition)
	If (($_t_URL="/") | ($_t_URL=""))
		$0:=<>IWS_t_StaticFolder+Folder separator:K24:12+"index.html"
	Else 
		$0:=<>IWS_t_StaticFolder+Folder separator:K24:12+Replace string:C233($_t_URL; "/"; Folder separator:K24:12)
	End if 
	$0:=Replace string:C233($0; Folder separator:K24:12+Folder separator:K24:12; Folder separator:K24:12)
Else 
	$0:=""  //we're going to serve up a dynamic page
End if 
ERR_MethodTrackerReturn("IWS_GetFilename"; $_t_oldMethodName)
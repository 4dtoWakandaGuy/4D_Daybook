//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_ParamHTTP
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
	C_LONGINT:C283($3; $_l_Mode)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2; IWS_t_Request; IWS_t_URL)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_ParamHTTP")
// web_ParamHTTP
// retrieve parameter from request


$_l_Mode:=1  // set default value for mode
If (Count parameters:C259=3)
	$_l_Mode:=$3  // or take
End if 

Case of 
	: ($_l_Mode=1)  // url, then form
		$0:=IWS_ParamURL(IWS_t_URL; $1; $2)
		If ($0=$2)
			$0:=IWS_ParamFORM(IWS_t_Request; $1; $2)
		End if 
	: ($_l_Mode=2)  // form, then url
		$0:=IWS_ParamFORM(IWS_t_Request; $1; $2)
		If ($0=$2)
			$0:=IWS_ParamURL(IWS_t_URL; $1; $2)
		End if 
	: ($_l_Mode=3)  // url only
		$0:=IWS_ParamURL(IWS_t_URL; $1; $2)
	: ($_l_Mode=4)  // form only
		$0:=IWS_ParamFORM(IWS_t_Request; $1; $2)
End case 
ERR_MethodTrackerReturn("IWS_ParamHTTP"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      ApplicationType_isSingleUser
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2009 19:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ApplicationType; $0)
	C_LONGINT:C283($_l_ApplicationType)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ApplicationType_isSingleUser")

//©daybook.co.uk Mon, Feb 26, 2007 balinderwalia
//returns if the application is running as single user 4D, Engined or standard/developer edition


$_l_ApplicationType:=Application type:C494

$0:=$_l_ApplicationType=4D Volume desktop:K5:2

//$0:=(($_l_ApplicationType=_O_4D Desktop ) | ($0))
$0:=(($_l_ApplicationType=4D Local mode:K5:1) | ($0))

$_t_oldMethodName:=ERR_MethodTracker("ApplicationType_isSingleUser"+String:C10($0))
ERR_MethodTrackerReturn("ApplicationType_isSingleUser"; $_t_oldMethodName)
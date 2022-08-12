//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_Message
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  07/09/2011 09:49 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_MessageFormName; $_t_oldMethodName; $1; $2; DBWS_t_Message; DBWS_t_MessageTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_Message")


DBWS_t_MessageTitle:=$1
DBWS_t_Message:=$2
$_t_MessageFormName:=DBWS_GetWSForm("Message")
DBWS_SetPage(""; $_t_MessageFormName)
ERR_MethodTrackerReturn("DBWS_Message"; $_t_oldMethodName)
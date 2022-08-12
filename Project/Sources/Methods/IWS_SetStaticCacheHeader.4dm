//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SetStaticCacheHeader
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_SetStaticCacheHeader")
//Method:  IWS_SetStaticCacheHeader
//Created: 5/30/00 By Ron/Rollo
IWS_SetResponseHeader(200; "Wed, 01 Dec 2020 12:00:00 GMT")

//Rollo 4/25/2001 - was already being set by the above
//IWS_AddToResponseHeader ("Date";ITK_Secs2RFC (
//ITK_Date2Secs (Current date;Current time;1);1))

IWS_AddToResponseHeader("Cache-Control"; "public")
ERR_MethodTrackerReturn("IWS_SetStaticCacheHeader"; $_t_oldMethodName)
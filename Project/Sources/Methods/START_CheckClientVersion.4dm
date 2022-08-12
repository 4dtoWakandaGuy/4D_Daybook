//%attributes = {}
If (False:C215)
	//Project Method Name:      START_CheckClientVersion
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
	C_TEXT:C284(<>DB_t_SERVERVERSION; $_t_CLIENTVERSION; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("START_CheckClientVersion")

//This method is called at startup to test if the client version is different to the server version
If (Application type:C494=4D Remote mode:K5:5)  //If 4D CLIENT check version on server is same as this client
	//And in here set the client time out too
	If ((Get database parameter:C643(14))<15)
		SET DATABASE PARAMETER:C642(14; 15)
	End if 
	
	$_t_CLIENTVERSION:=DB_GetClientVersion
	If ($_t_CLIENTVERSION#"")
		GET PROCESS VARIABLE:C371(-1; <>DB_t_SERVERVERSION; <>DB_t_SERVERVERSION)
		If ($_t_CLIENTVERSION#<>DB_t_SERVERVERSION) & (<>DB_t_SERVERVERSION#"")
			Gen_Alert("This Client version("+$_t_CLIENTVERSION+"), Does not match your server."+" It is recommended that you obtain the correct client version")
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("START_CheckClientVersion"; $_t_oldMethodName)

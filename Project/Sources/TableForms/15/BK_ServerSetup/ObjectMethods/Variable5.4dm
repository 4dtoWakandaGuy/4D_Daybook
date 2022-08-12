If (False:C215)
	//object Name: [USER]BK_ServerSetup.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_Result)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ServerSetup.Variable5"; Form event code:C388)
//$Session:=4DBKC_SessionNew (DM_t_BKServerIP;DM_l_BKServerPort)
//$x_res:=4DBKC_Execute ($Session;"")
//$_t_Result:=BLOB to text($x_res;Text without length )
$_t_Result:=""
Case of 
	: ($_t_Result="[Err=SRV_MIS]")
		Gen_Alert("The IP address of the 4DBK server was not specified.")
	: ($_t_Result="[Err=COM_BRK]")
		Gen_Alert("communication with the 4DBK server cannot be"+"  established(server does not respond, networ"+"k connection failure, etc"+Char:C90(13)+"The server may need restarting")
	: ($_t_Result="[Err=BAD_IP]")
		Gen_Alert("The IP address specified for the 4DBK server is incorrect")
		
	Else 
		If ($_t_Result="")
			Gen_Alert("Success! The IP and port reveive a valid respond from the business kit")
		Else 
			Gen_Alert("Failure, the following was the response"+$_t_Result)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].BK_ServerSetup.Variable5"; $_t_oldMethodName)

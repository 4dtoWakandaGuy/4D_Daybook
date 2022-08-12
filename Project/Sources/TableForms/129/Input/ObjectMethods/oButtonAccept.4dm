If (False:C215)
	//object Name: [WEBSETUP_4D]Input.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].Input.Variable4"; Form event code:C388)
If (Form event code:C388=On Clicked:K2:4)
	Case of 
		: ([WEBSETUP_4D:129]Handlers:1<3)
			BEEP:C151
			ALERT:C41("You have set an invalid max number of handlers!")
			GOTO OBJECT:C206([WEBSETUP_4D:129]Handlers:1)
		: ([WEBSETUP_4D:129]UseLoadInformer:26) & ([WEBSETUP_4D:129]LoadInformerAddress:31="")
			BEEP:C151
			ALERT:C41("You need to set an address for the logging machine !")
			GOTO OBJECT:C206([WEBSETUP_4D:129]LoadInformerAddress:31)
		: ([WEBSETUP_4D:129]UseLoadInformer:26) & ([WEBSETUP_4D:129]LoadInformerPort:32=0)
			BEEP:C151
			ALERT:C41("You need to set a port for the logging machine !")
			GOTO OBJECT:C206([WEBSETUP_4D:129]LoadInformerPort:32)
			
		Else 
			ACCEPT:C269
	End case 
End if 
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].Input.Variable4"; $_t_oldMethodName)

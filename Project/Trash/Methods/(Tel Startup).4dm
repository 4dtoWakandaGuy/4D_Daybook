//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Tel Startup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>TelRec; <>TelServer)
	C_LONGINT:C283($_l_telephoneProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel Startup")
//Tel Startup
If ((DB_GetModuleSettingByNUM(32))>1)
	If (Is macOS:C1572)
		<>TelRec:=False:C215
		$_l_telephoneProcess:=New process:C317("Tel_StartupP"; DB_ProcessMemoryinit(1); "$TelStart")
		$_l_telephoneProcess:=1
		While ((<>TelRec=False:C215) & ($_l_telephoneProcess<50000))
			IDLE:C311
			$_l_telephoneProcess:=$_l_telephoneProcess+1
		End while 
	Else 
		<>TelServer:=False:C215
	End if 
End if 
ERR_MethodTrackerReturn("Tel Startup"; $_t_oldMethodName)

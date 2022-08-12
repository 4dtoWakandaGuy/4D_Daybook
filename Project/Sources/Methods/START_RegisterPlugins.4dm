//%attributes = {}
If (False:C215)
	//Project Method Name:      START_RegisterPlugins
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 09:30`Method: START_RegisterPlugins
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>EtransInited; $0)
	C_LONGINT:C283($_l_PDFRegistrationResult; $_l_RegistrationResult)
	C_TEXT:C284($_t_LicencesPath; $_t_LicencesText; $_t_oldMethodName; $_t_SRPLicencePath)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("START_RegisterPlugins")
$0:=False:C215
If (False:C215)
	//$_l_Sr_Reg_Result:=SR Register("OvHipP-166215-652289-334141")
	//$_l_Sr_Reg_Result:=SR Register("xDiCTw-049256-750407-254025")
	//$_l_Sr_Reg_Result:=SR Register("bOfYmT-052153-105799-154037")
Else 
	//TRACE
	
	//SRP3.license4Dplugin
	$_t_LicencesPath:=Get 4D folder:C485(Licenses folder:K5:11)
	$_t_SRPLicencePath:=$_t_LicencesPath+"SRP3.license4Dplugin"
	If (Test path name:C476($_t_SRPLicencePath)=Is a document:K24:1)
	Else 
		//$_l_RegistrationResult:=SR_Register ("004614-PARTNER CLEARDAY-4Ud1QmwtUbVdHPMah5JqvfWWem8joYYp")
		If (Is compiled mode:C492)
			$_l_RegistrationResult:=SR_Register("")
			$0:=True:C214
		Else 
			
			$0:=False:C215
		End if 
	End if 
	
End if 

$_l_PDFRegistrationResult:=PLUGCALL_PDFRegister


If (False:C215)  //Change this to on;y init if used
	If (Not:C34(<>EtransInited))
		
		//INIT_BashWrapper   `Supposed to get around the 2004 version problem..we will see!
		//INIT_TCPd(TCPd_ITK_v25x_Plugin;"ITKP06118058100000014A";"";"oordQIPaojwssX3gEspn0jjED+GtKC5n";1)
		//INIT_HTTPcd
		//INIT_ETRANS("c7jSgr0fMi+Kgwt/fxMXF0QzJochrtty")
	End if 
End if 
ERR_MethodTrackerReturn("START_RegisterPlugins"; $_t_oldMethodName)

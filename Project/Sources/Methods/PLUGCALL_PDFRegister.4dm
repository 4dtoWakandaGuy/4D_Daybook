//%attributes = {}
If (False:C215)
	//Project Method Name:      PLUGCALL_PDFRegister
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 16:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_PDFRegistrationResult; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PLUGCALL_PDFRegister")
//in order to facilitate the conversion to 2003 this call has replaced
//the direct call to register the pdf writer
// this can then be modified to suit whatever we are using
//$_l_PDFRegistrationResult:=PD_Register ("Daybook";"RQOGZBK072403ENG";"PLWIETF072403ENG")  ` 05/04/04 pb

$0:=$_l_PDFRegistrationResult
ERR_MethodTrackerReturn("PLUGCALL_PDFRegister"; $_t_oldMethodName)
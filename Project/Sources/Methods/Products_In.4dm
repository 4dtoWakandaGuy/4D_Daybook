//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_In
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
	C_LONGINT:C283(SD_l_ParentProcess)
	C_TEXT:C284($_t_oldMethodName; $_t_WinCurrentInputForm; $_t_WinCurrentOutputForm; $1; $2; $3; $4; SD_t_CallingCompanyCode; SD_t_CallingContactCode; SD_t_InputFormName; WIN_t_CurrentInputForm)
	C_TEXT:C284(WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_In")

Start_Process
$_t_WinCurrentInputForm:=WIN_t_CurrentInputForm
$_t_WinCurrentOutputForm:=WIN_t_CurrentOutputform

If (Count parameters:C259>=1)
	SD_l_ParentProcess:=Num:C11($1)
End if 
If (Count parameters:C259>=2)
	SD_t_CallingCompanyCode:=$2  //note this is a supplier code
End if 
If (Count parameters:C259>=3)
	SD_t_CallingContactCode:=$3
End if 
If (Count parameters:C259>=4)
	SD_t_InputFormName:=$4
End if 

Products_File
If (SD_t_InputFormName#"")
	FORM SET INPUT:C55([PRODUCTS:9]; SD_t_InputFormName)
	WIN_t_CurrentInputForm:=SD_t_InputFormName
End if 

Gen_InMid("Enter Products"; "Master"; ->[PRODUCTS:9])
Process_End
WIN_t_CurrentInputForm:=$_t_WinCurrentInputForm
WIN_t_CurrentOutputform:=$_t_WinCurrentOutputForm
ERR_MethodTrackerReturn("Products_In"; $_t_oldMethodName)

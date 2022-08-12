//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(SD_l_ParentProcess)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4; SD_t_CallingCompanyCode; SD_t_CallingContactCode; SD_t_InputFormName; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs In")
Start_Process
If (Count parameters:C259>=1)
	SD_l_ParentProcess:=Num:C11($1)
End if 
If (Count parameters:C259>=2)
	SD_t_CallingCompanyCode:=$2
End if 
If (Count parameters:C259>=3)
	SD_t_CallingContactCode:=$3
End if 
If (Count parameters:C259>=4)
	SD_t_InputFormName:=$4
End if 

If (Jobs_File)
	If (SD_t_InputFormName#"")
		FORM SET INPUT:C55([JOBS:26]; SD_t_InputFormName)
		WIN_t_CurrentInputForm:=SD_t_InputFormName
	End if 
	
	Gen_InMid("Enter Jobs"; "JMaster"; ->[JOBS:26])
End if 
Process_End
ERR_MethodTrackerReturn("Jobs In"; $_t_oldMethodName)
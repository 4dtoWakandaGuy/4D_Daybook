//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contracts In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("Contracts In")
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
If (Contracts_File)  // modified NG June 2004
	If (SD_t_InputFormName#"")
		FORM SET INPUT:C55([CONTRACTS:17]; SD_t_InputFormName)
		WIN_t_CurrentInputForm:=SD_t_InputFormName
	End if 
	Gen_InMid("Enter Contracts"; "Master"; ->[CONTRACTS:17])
End if 

Process_End
ERR_MethodTrackerReturn("Contracts In"; $_t_oldMethodName)
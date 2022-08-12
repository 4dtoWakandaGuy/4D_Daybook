//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/08/2012 17:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_LONGINT:C283(SD_l_ParentProcess; vAdd)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4; $5; $6; SD_t_CallingCompanyCode; SD_t_CallingContactCode; SD_t_InputFormName; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InE")
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
vAdd:=1
OrdersV_File
If (SD_t_InputFormName#"")
	FORM SET INPUT:C55([ORDERS:24]; SD_t_InputFormName)
	WIN_t_CurrentInputForm:=SD_t_InputFormName
End if 
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If (Size of array:C274(<>SYS_at_RecStateCodes{24})>0)
	If (<>SYS_al_RecStateRestriction{24}{1}%2=1)
		Gen_InMidLay("Enter "+Substring:C12(<>SYS_at_RecStateNames{24}{1}; 1; 35); "OrMaster"; ->[ORDERS:24]; "InEAdd")
		Orders_Unload
	Else 
		Gen_Alert("You do not have access to this Record State"; "Cancel")
	End if 
Else 
	Gen_Alert("Suitable Record States have not been defined"; "Cancel")
End if 
Process_End
ERR_MethodTrackerReturn("Orders_InE"; $_t_oldMethodName)
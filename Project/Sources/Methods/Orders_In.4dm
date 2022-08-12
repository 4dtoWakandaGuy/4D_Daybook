//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_In
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
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>StatesLoaded; ORD_bo_IsRevision)
	C_LONGINT:C283(<>MENU_l_BarModule; $_l_AddMode; ORD_l_OrderRevision; SD_l_ParentProcess; Vadd; vOrd)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4; $5; $6; ORD_t_OrderCode; SD_t_CallingCompanyCode; SD_t_InputFormName; SD_t_CallingContactCode)
	C_TEXT:C284(WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Order_In")

If (Count parameters:C259>=5)
	ORD_t_OrderCode:=$5
	If (Count parameters:C259>=6)
		ORD_l_OrderRevision:=Num:C11($6)
	End if 
	ORD_bo_IsRevision:=True:C214
	StartTransaction
End if 
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
$_l_AddMode:=Vadd
vAdd:=1
Orders_File
If (SD_t_InputFormName#"")
	FORM SET INPUT:C55([ORDERS:24]; SD_t_InputFormName)
	WIN_t_CurrentInputForm:=SD_t_InputFormName
End if 
If (vOrd=1)
	If (Not:C34(<>StatesLoaded))
		States_Load
	End if 
	If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
		If (<>SYS_al_RecStateRestriction{24}{3}%2=1)
			If (<>MENU_l_BarModule=10)
				Gen_InMid("Enter Event Orders"; "OrMaster"; ->[ORDERS:24])
			Else 
				Gen_InMid("Enter Sales Orders"; "OrMaster"; ->[ORDERS:24])
			End if 
			Orders_Unload
		Else 
			Gen_Alert("You do not have access to this Record State"; "Cancel")
		End if 
	Else 
		Gen_Alert("Suitable Record States have not been defined"; "Cancel")
	End if 
End if 
Vadd:=$_l_AddMode
Process_End
If (ORD_bo_IsRevision)
	//CANCEL TRANSACTION
	Transact_End(False:C215)
End if 
ERR_MethodTrackerReturn("Order_In"; $_t_oldMethodName)
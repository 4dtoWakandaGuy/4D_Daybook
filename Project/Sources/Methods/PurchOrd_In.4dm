//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/06/2010 06:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; vFromIn)
	C_LONGINT:C283($_l_AddMode; SD_l_ParentProcess; Vadd)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4; DB_t_CallOnCloseorSave; SD_t_CallingCompanyCode; SD_t_InputFormName; SD_t_CallingContactCode; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_In")
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

$_bo_OK:=PurchOrd_File
If ($_bo_OK)
	If (SD_t_InputFormName#"")
		FORM SET INPUT:C55([PURCHASE_ORDERS:57]; SD_t_InputFormName)
		WIN_t_CurrentInputForm:=SD_t_InputFormName
	End if 
	If (In_Allowed("Enter Purchase Orders"; ->[PURCHASE_ORDERS:57]))
		CREATE SET:C116([PURCHASE_ORDERS:57]; "PMaster")
		REDUCE SELECTION:C351([PURCHASE_ORDERS:57]; 0)
		OK:=1
		Open_Pro_Window("Enter Purchase Orders"; 0; 2; ->[PURCHASE_ORDERS:57]; WIN_t_CurrentInputForm)
		While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
			$_l_AddMode:=Vadd
			vAdd:=1
			vFromIn:=False:C215
			//  START TRANSACTION
			StartTransaction  // 13/05/02 pb
			
			ADD RECORD:C56([PURCHASE_ORDERS:57]; *)
			If (OK=1)
				//     VALIDATE TRANSACTION
				Transact_End  // 13/05/02 pb
				ADD TO SET:C119([PURCHASE_ORDERS:57]; "PMaster")
			Else 
				//     CANCEL TRANSACTION
				Transact_End  // 13/05/02 pb
			End if 
			
			Gen_InOne
			Vadd:=$_l_AddMode
		End while 
		Close_ProWin(Table name:C256(->[PURCHASE_ORDERS:57])+"_"+WIN_t_CurrentInputForm)
		
	End if 
End if 

Orders_Unload
Process_End
ERR_MethodTrackerReturn("PurchOrd_In"; $_t_oldMethodName)
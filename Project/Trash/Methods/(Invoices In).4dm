//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices In
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
	C_BOOLEAN:C305($_bo_Stop; INV_bo_PeriodSet; vFromIn)
	C_LONGINT:C283($_l_PeriodID; $_l_RecordNumber; SD_l_ParentProcess; vAdd; vIn)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; $1; $2; $3; $4; DB_t_CallOnCloseorSave; INV_t_SetPeriodCode; SD_t_CallingCompanyCode; SD_t_CallingContactCode; SD_t_InputFormName)
	C_TEXT:C284(WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices In")
//Invoices In
INV_t_SetPeriodCode:=""
$_t_WindowTitle:="Enter Adhoc Invoices"
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

If (Invoices_File)
	If (SD_t_InputFormName#"")
		FORM SET INPUT:C55([INVOICES:39]; SD_t_InputFormName)
		WIN_t_CurrentInputForm:=SD_t_InputFormName
	End if 
	If (vIn=1)
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
		$_l_RecordNumber:=Record number:C243([TRANSACTION_TYPES:31])
		If ((DB_GetLedgerTRANSINVpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
			If (In_Allowed($_t_WindowTitle; ->[INVOICES:39]))
				CREATE SET:C116([INVOICES:39]; "IMaster")
				REDUCE SELECTION:C351([INVOICES:39]; 0)
				OK:=1
				Open_Pro_Window($_t_WindowTitle; 0; 2; ->[INVOICES:39]; WIN_t_CurrentInputForm)  //NG may 2004 added form references
				While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
					
					vAdd:=1
					vFromIn:=False:C215
					GOTO RECORD:C242([TRANSACTION_TYPES:31]; $_l_RecordNumber)
					StartTransaction  // 13/05/02 pb
					Repeat 
						$_bo_Stop:=False:C215
						$_l_PeriodID:=Check_Period(Current date:C33(*))
						Check_PerCloseI
						INV_bo_PeriodSet:=True:C214
						INV_t_SetPeriodCode:=[PERIODS:33]Period_Code:1
						If (INV_t_SetPeriodCode="")
							Gen_Confirm("You cannot enter an invoice with no accounting period"; "Retry"; "Stop")
							If (OK=0)
								$_bo_Stop:=True:C214
							End if 
						End if 
					Until (INV_t_SetPeriodCode#"") | ($_bo_Stop)
					
					Check_PerCloseI
					INV_bo_PeriodSet:=True:C214
					INV_t_SetPeriodCode:=[PERIODS:33]Period_Code:1
					If (INV_t_SetPeriodCode#"")
						ADD RECORD:C56([INVOICES:39]; *)  //NG may 2004 added table
						If (OK=1)
							Transact_End  // 13/05/02 pb
							ADD TO SET:C119([INVOICES:39]; "IMaster")
						Else 
							Transact_End  // 13/05/02 pb
						End if 
					Else 
						DB_t_CallOnCloseorSave:="Close"
					End if 
					Gen_InOne
				End while 
				Close_ProWin(Table name:C256(->[INVOICES:39])+"_"+WIN_t_CurrentInputForm)  //NG may 2004 addded form reference
				vAdd:=0
			End if 
		Else 
			Gen_Alert("Required Setups have not been completed"; "")
		End if 
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Invoices In"; $_t_oldMethodName)
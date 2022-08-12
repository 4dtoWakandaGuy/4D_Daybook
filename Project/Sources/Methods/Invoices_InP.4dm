//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_InP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Posted)
	C_LONGINT:C283($4; DB_l_ButtonClickedFunction; INV_l_AssignedrecordID; INV_l_AssignedTable; vAdd; vIn)
	C_REAL:C285(INV_R_Depositmaxamt)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; $1; $2; $3; $5; $6; $7; INV_t_AssignedCode; INV_t_RecordCode; SD_t_CallingCompanyCode)
	C_TEXT:C284(SD_t_CallingContactCode; WIN_t_CurrentInputForm)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Invoices_InP")
//Invoices_InP (Deposits)
If (Count parameters:C259>=5)
	INV_t_RecordCode:=$5
End if 
If (Count parameters:C259>=6)
	SD_t_CallingCompanyCode:=$6
End if 
If (Count parameters:C259>=7)
	SD_t_CallingContactCode:=$7
End if 

INV_R_Depositmaxamt:=0
If (Count parameters:C259>=3)
	INV_R_Depositmaxamt:=Num:C11($3)
End if 

$_t_WindowTitle:="Deposit Receipt"
Start_Process
If (Invoices_File)
	
	If (vIn=1)
		
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSDeposit)
		
		If ((DB_GetLedgerTRANSDeposit#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
			
			If (In_Allowed($_t_WindowTitle; ->[INVOICES:39]))
				
				If (Count parameters:C259>=1)
					INV_l_AssignedTable:=Num:C11($1)
					INV_l_AssignedrecordID:=Num:C11($2)
				End if 
				
				FORM SET INPUT:C55([INVOICES:39]; "Invoice_inP")  //NG April 2004 removed reference to ◊screen
				WIN_t_CurrentInputForm:="Invoice_inP"  //Added NG May 2004
				CREATE SET:C116([INVOICES:39]; "IMaster")
				REDUCE SELECTION:C351([INVOICES:39]; 0)
				vAdd:=1
				OK:=1
				
				Open_Pro_Window($_t_WindowTitle; 0; 2; ->[INVOICES:39]; WIN_t_CurrentInputForm)
				//  START TRANSACTION
				
				StartTransaction  // 13/05/02 pb
				
				ADD RECORD:C56([INVOICES:39]; *)  //Added NG May 2004
				If ((OK=1) & ([INVOICES:39]Posted_Date:8=!00-00-00!) & ([INVOICES:39]Invoice_Date:4>!00-00-00!) & ([INVOICES:39]Period_Code:13#"") & ([INVOICES:39]Total_Paid:6#0))
					$_bo_Posted:=Inv_DepPost
					If ($_bo_Posted)
						Transact_End
					Else 
						Gen_Alert("Creating this deposit has been cancelled")
						Transact_End(False:C215)
					End if 
				Else 
					OK:=0
					//        CANCEL TRANSACTION
					Transact_End  // 13/05/02 pb
				End if 
				If (Count parameters:C259>=4)
					If ($4>0)
						SET PROCESS VARIABLE:C370($4; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Auto Print"))
						
						POST OUTSIDE CALL:C329($4)
					End if 
				End if 
				
				Close_ProWin(Table name:C256(->[INVOICES:39])+"_"+WIN_t_CurrentInputForm)
				
			End if 
		Else 
			Gen_Alert("Required Setups have not been completed"; "")
		End if 
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Invoices_InP"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/11/2010 11:02
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vAB)
	//C_UNKNOWN(vAccName)
	//C_UNKNOWN(vNo)
	//C_UNKNOWN(vTitle)
	//C_UNKNOWN(vTotal)
	C_LONGINT:C283(vAB; vNo; $_l_OK)
	C_REAL:C285(vTotal; vBalance)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vAccName; vTitle; WIN_t_CurrentOutputform; $_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
	C_TEXT:C284(WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Acc_BalList")
//Acc_BalList
// Now augemented/Replace with ACC_PrintBalances

$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
ACC_BalFile
READ ONLY:C145([ACCOUNT_BALANCES:34])

While (vAB=1)
	// 03/04/03 pb
	If ((DB_t_CurrentFormUsage#"P&L") & (DB_t_CurrentFormUsage#"BS"))
		DB_t_CurrentFormUsage:=""
		vTitle:="ACCOUNT BALANCES"
	End if 
	DB_t_CurrentFormUsage2:="NCS"
	ACC_BalSelect
	If (vAB=1)
		If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
			
			//vNo:=Records in selection([ACC BALANCES])
			//ORDER BY([ACC BALANCES];[ACC BALANCES]Account Code;>;[ACC BALANCES]Period Code;>)
			//DB_t_CurrentFormUsage:="Print"
			//Open_Pro_Window ("List Balances";0;1;->[ACC BALANCES];WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[ACC BALANCES];WIN_t_CurrentOutputform)
			//DISPLAY SELECTION([ACC BALANCES];*)
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[ACCOUNT_BALANCES:34])))
			If ((OK=1) & (Records in selection:C76([ACCOUNT_BALANCES:34])>0))
				If (Not:C34(SR_ReportOK("AccBalList")))
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; "PL_Detail")
					If ($_l_OK>=0)  //Either the print setting was not displayed in PRINT_Setsize OR the settings were OK'd
						If ($_l_OK=1)  //if COntinue=0 the print settings were displayed in Print_SetSize
							PRINT SETTINGS:C106
							$_l_OK:=OK
						Else 
							$_l_OK:=1
						End if 
						If ($_l_OK=1)
							vNo:=Records in selection:C76([ACCOUNT_BALANCES:34])
							ORDER BY:C49([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2; >; [ACCOUNT_BALANCES:34]Period_Code:4; >)
							ACC_BalPrintHeader
							ACC_CalculateBalance("P")
							ACC_BalPrintBlank
							vAccName:="TOTAL"
							vBalance:=vTotal
							Print form:C5([ACCOUNT_BALANCES:34]; "PL_Detail"; Form detail:K43:1)
							
							PAGE BREAK:C6
							PRT_SetPrinterPaperOptions("PL_Detail")
						End if 
					End if 
				End if 
			End if 
			//Close_ProWin
			vAB:=0
		Else 
			Gen_None("Balances"; ->vAB)
		End if 
	End if 
End while 
Process_End

WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Acc_BalList"; $_t_oldMethodName)

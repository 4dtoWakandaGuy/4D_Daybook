//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAB)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Acc_BalReport")

//Acc_BalReport
Start_Process
ACC_BalFile
READ ONLY:C145([ACCOUNT_BALANCES:34])

While (vAB=1)
	//IDLE  ` 03/04/03 pb
	vTitle:="BALANCES SELECTION"
	DB_t_CurrentFormUsage2:="NCS"
	ACC_BalSelect
	Gen_ModMid("Balances Reports"; "Master"; ->[ACCOUNT_BALANCES:34]; ->vAB; "Balances"; "")
End while 
Process_End
ERR_MethodTrackerReturn("Acc_BalReport"; $_t_oldMethodName)

//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Movements Mod
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
	C_LONGINT:C283(SD_l_ParentProcess; STOCK_l_Context; vPu)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4; $5; $6; ORD_t_OrderCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movements Mod")
If (Count parameters:C259>=1)
	
	
	If (Count parameters:C259>=5)
		ORD_t_OrderCode:=$5
		
		STOCK_l_Context:=-1
		StartTransaction
	End if 
	SD_l_ParentProcess:=Num:C11($1)
	
End if 

Start_Process
Movements_File
While (vPu=1)
	Movements_Sel
	Gen_ModMid("View Movements"; "Master"; ->[STOCK_MOVEMENTS:40]; ->vPu; "Movements"; "")
End while 
If (STOCK_l_Context=-1)
	Transact_End(False:C215)
End if 
Process_End
ERR_MethodTrackerReturn("Movements Mod"; $_t_oldMethodName)

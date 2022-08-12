//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 06:39
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FirstTime; $_bo_UseSet; ORD_bo_IsRevision)
	C_LONGINT:C283(<>MENU_l_BarModule; ORD_l_OrderRevision; SD_l_ParentProcess; vOrd)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4; $5; $6; ORD_t_OrderCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders Mod")
If (Count parameters:C259>=1)
	If (Count parameters:C259>=5)
		ORD_t_OrderCode:=$5
		If (Count parameters:C259>=6)
			ORD_l_OrderRevision:=Num:C11($6)
		End if 
		ORD_bo_IsRevision:=True:C214
		StartTransaction
		
	End if 
	SD_l_ParentProcess:=Num:C11($1)
	
End if 

Start_Process
Orders_File
$_bo_FirstTime:=True:C214
While (vOrd=1)
	$_bo_UseSet:=False:C215
	If (Count parameters:C259>=2) & ($_bo_FirstTime)
		
		$_bo_UseSet:=($2="TRUE")
	End if 
	
	If ($_bo_UseSet)  //added NG Jan 2009  `not nice code:)-
		USE SET:C118("◊OrdersSet")
		CLEAR SET:C117("◊OrdersSet")
		
	Else 
		
		Orders_Sel
		
	End if 
	$_bo_FirstTime:=False:C215
	If (<>MENU_l_BarModule=10)
		Gen_ModMid("View Event Orders"; "OrMaster"; ->[ORDERS:24]; ->vOrd; "Event Orders"; "")
	Else 
		If (Not:C34(ORD_bo_IsRevision))
			Gen_ModMid("View Sales Orders"; "OrMaster"; ->[ORDERS:24]; ->vOrd; "Sales Orders"; "")
		Else 
			Gen_ModMid("Copy Sales Orders"; "OrMaster"; ->[ORDERS:24]; ->vOrd; "Copy Sales Order"; "")
			
		End if 
		
	End if 
End while 
Transact_End
Orders_Unload
Process_End
ERR_MethodTrackerReturn("Orders Mod"; $_t_oldMethodName)

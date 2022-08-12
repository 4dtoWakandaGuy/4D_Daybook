//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_SubLPLayer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 17:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; $_bo_UsePosition; $0)
	C_LONGINT:C283($_l_OBottom; $_l_OLeft; $_l_ORight; $_l_OTop; $8; $9; ACC_l_NextColumn)
	C_POINTER:C301($1; $2; $4; $6; $7)
	C_REAL:C285($3)
	C_TEXT:C284($_t_oldMethodName; $5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_SubLPLayer")
//Trans_SubLPLayer
If (Count parameters:C259>9)
	$_l_OLeft:=$8
	$_l_OTop:=$9
	$_l_ORight:=$_l_OLeft
	$_l_OBottom:=$_l_OTop
	$_bo_UsePosition:=True:C214
	
End if 
Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20)
If (OK=1)
	If (Count parameters:C259=0)
		If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
			Gen_Alert("You do not have access to Multi-Layers"; "Cancel")
			[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
		Else 
			If ($_bo_UsePosition)
				Check_MinorNC(->[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer"; "-1"; True:C214; $_l_OLeft; $_l_OTop)
				
			Else 
				Check_MinorNC(->[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer")
			End if 
			
			
			If ([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20#"")
				$_bo_Continue:=Trans_SubLPLayerCode(->[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; ->[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; 2)
				If ($_bo_Continue)
					$_bo_Continue:=Trans_SubLPLayerCode(->[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; ->[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; 2)
				End if 
			End if 
			If ([TRANSACTION_TYPES:31]Transaction_Type_Code:1#[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
				RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
			End if 
			Layer_Fill(->[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20)
			If ([PERIODS:33]Period_Code:1#[TRANSACTION_BATCH_ITEMS:155]Period_Code:11)
				RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Period_Code:11)
			End if 
			Trans_SubLPPer
		End if 
	Else 
		If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
			Gen_Alert("You do not have access to Multi-Layers"; "Cancel")
			
			$1->:=DB_GetLedgerActualLayer
			$0:=False:C215
		Else 
			If ($_bo_UsePosition)
				Check_MinorNC($1; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer"; "-1"; True:C214; $_l_OLeft; $_l_OTop)
				
				
			Else 
				Check_MinorNC($1; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer")
			End if 
			If ($1->#"")
				ACC_l_NextColumn:=0
				$_bo_Continue:=Trans_SubLPLayerCode($2; $1; -2; ->ACC_l_NextColumn)
				If ($_bo_Continue)
					$_bo_Continue:=Trans_SubLPLayerCode($4; $1; -2; ->ACC_l_NextColumn)
				End if 
			End if 
			If ([TRANSACTION_TYPES:31]Transaction_Type_Code:1#$5)
				QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=$5)
			End if 
			Layer_Fill($1)
			If ([PERIODS:33]Period_Code:1#$6->)
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$6->)
				
			End if 
			Trans_SubLPPer($1->; $6; $7)
			
			$0:=True:C214
		End if 
	End if 
	
Else 
	If (Count parameters:C259>0)
		$0:=False:C215
	End if 
	
End if 
ERR_MethodTrackerReturn("Trans_SubLPLayer"; $_t_oldMethodName)

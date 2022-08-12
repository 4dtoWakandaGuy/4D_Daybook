//%attributes = {}
If (False:C215)
	//Project Method Name:      StockAss_In
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
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_AddMode; $_r_CanBuildQuantity; Vadd; vSNo; vSt; vStockLevel; vStockUA)
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_AssMovementTypeStockSubtract; $_t_oldMethodName; $_t_WindowTitle; ACC_t_CurrencyCode; DB_t_CallOnCloseorSave; vAnalysis; vCallCode; vLayer; vProdCode; vTitleL; vType_)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_In")
$_t_WindowTitle:="Enter Assembly"
Start_Process
StockAss_File
If (vSt=1)
	
	If (In_Allowed($_t_WindowTitle; ->[STOCK_MOVEMENTS:40]))
		$_l_AddMode:=Vadd
		OK:=1
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Assembly_Type:23=True:C214)
		If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
			$_t_AssMovementTypeStockSubtract:=[MOVEMENT_TYPES:60]Stock_Minus:4
			Open_Pro_Window($_t_WindowTitle)
			While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
				$_l_AddMode:=Vadd
				vAdd:=1
				vTitleL:="ASSEMBLY REQUIREMENTS"
				vSNo:=0
				
				READ WRITE:C146([STOCK_MOVEMENTS:40])
				//  START TRANSACTION
				StartTransaction  // 13/05/02 pb
				
				CREATE RECORD:C68([STOCK_MOVEMENTS:40])
				[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
				[STOCK_MOVEMENTS:40]Movement_Date:5:=<>DB_d_CurrentDate
				Move_InLPBDef
				Move_InType
				ADD RECORD:C56([STOCK_MOVEMENT_ITEMS:27]; *)
				If (OK=1)
					vQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					If ((OK=1) & (vQuantity>0) & (vSNo>0))
						
						vType_:=[STOCK_MOVEMENTS:40]Movement_Type:6
						vProdCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
						vAnalysis:=[STOCK_MOVEMENTS:40]Analysis_Code:9
						ACC_t_CurrencyCode:=[STOCK_MOVEMENTS:40]Currency_Code:10
						vLayer:=[STOCK_MOVEMENTS:40]Layer_Code:11
						vDate:=[STOCK_MOVEMENTS:40]Movement_Date:5
						vStockLevel:=1
						vStockUA:=[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
						DELETE RECORD:C58([STOCK_MOVEMENT_ITEMS:27])
						vCallCode:=""
						
						QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=vProdCode)
						$_r_CanBuildQuantity:=StockAss_Movt(vQuantity; vProdCode)
						
					Else 
						OK:=0
					End if 
					
				End if 
				Transact_End
				Gen_InOne
				Vadd:=$_l_AddMode
			End while 
			Close_ProWin
		Else 
			Gen_Alert("No Movement Type has been specified as being used for Assembly/Disassembly"; "Cancel")
		End if 
		vAdd:=$_l_AddMode
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("StockAss_In"; $_t_oldMethodName)

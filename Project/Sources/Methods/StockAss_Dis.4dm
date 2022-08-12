//%attributes = {}
If (False:C215)
	//Project Method Name:      StockAss_Dis
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/04/2010 11:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY TEXT(SRDesc;0)
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRSerial;0)
	C_BOOLEAN:C305($_bo_Edits)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_AddMode; $_l_AssemblyQuantity; $_l_AssemblyQuantity2; $_l_AssemblyQuantity3; $_l_AssemblyQuantity4; $_l_LineIndex; $_l_MovementAtLevel; $_l_MovementsDone; $_r_ComponentProductQuantity; $_r_ComponentQuantityRemaining; $_r_DiscountQuantity)
	C_LONGINT:C283($_r_Quantity; $_r_QuantityP; ch1; s1; Vadd; vSNo; vSt; vStockLevel; vStockUA)
	C_REAL:C285($_r_Quantity1; $_r_QuantityFractiion; $_r_Total; vPrice; vQuantity)
	C_TEXT:C284($_t_AnalysisCode; $_t_ComponentProductCode; $_t_CurrencyCode; $_t_LayerCode; $_t_MovementCode; $_t_MovementTypeName; $_t_oldMethodName; ACC_t_CurrencyCode; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
	C_TEXT:C284(DB_t_CurrentFormUsage3; vAnalysis; vLayer; vProdCode; vSerialNo; vTitleL; vType_; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_Dis")

$_t_MovementTypeName:="Enter Disassembly"
Start_Process
StockAss_File
If (vSt=1)
	If (In_Allowed($_t_MovementTypeName; ->[STOCK_MOVEMENTS:40]))
		OK:=1
		$_l_AddMode:=Vadd
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Assembly_Type:23=True:C214)
		If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
			
			Open_Pro_Window($_t_MovementTypeName)
			While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
				vAdd:=1
				vTitleL:="DISASSEMBLY REQUIREMENTS"
				vSNo:=0
				FORM SET INPUT:C55([STOCK_MOVEMENT_ITEMS:27]; "StockAss_Disassemble")
				WIN_t_CurrentInputForm:="StockAss_Disassemble"
				READ WRITE:C146([STOCK_MOVEMENTS:40])
				//START TRANSACTION
				StartTransaction
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
						vSerialNo:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
						vAnalysis:=[STOCK_MOVEMENTS:40]Analysis_Code:9
						ACC_t_CurrencyCode:=[STOCK_MOVEMENTS:40]Currency_Code:10
						vLayer:=[STOCK_MOVEMENTS:40]Layer_Code:11
						vDate:=[STOCK_MOVEMENTS:40]Movement_Date:5
						vPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
						vStockLevel:=1
						vStockUA:=[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
						DELETE RECORD:C58([STOCK_MOVEMENT_ITEMS:27])
						DELETE RECORD:C58([STOCK_MOVEMENTS:40])
						USE NAMED SELECTION:C332("Movts")
						
						$_l_LineIndex:=0
						Form_SRArray($_l_LineIndex)
						FIRST RECORD:C50([STOCK_MOVEMENTS:40])
						$_t_MovementCode:=[STOCK_MOVEMENTS:40]Movement_Code:1
						$_l_AssemblyQuantity:=Num:C11(Substring:C12([STOCK_MOVEMENTS:40]Assembly_Reference:12; 10; 2))
						$_l_AssemblyQuantity2:=$_l_AssemblyQuantity
						$_l_AssemblyQuantity3:=$_l_AssemblyQuantity2-$_l_AssemblyQuantity+1
						$_r_Total:=0
						$_r_Quantity:=0
						$_r_Quantity1:=0
						$_r_DiscountQuantity:=vQuantity
						$_l_MovementAtLevel:=0
						$_l_MovementsDone:=0
						
						While ((Not:C34(End selection:C36([STOCK_MOVEMENTS:40]))) & ($_l_AssemblyQuantity3<=vStockUA))
							
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
							If ($_r_Quantity1=0)
								If ([CURRENT_STOCK:62]Serial_Number:2#"")
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4=vSerialNo; *)
								Else 
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=vPrice; *)
								End if 
							End if 
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Company_To:2="*PLUS")
							$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14
							If ($_r_Quantity1=0)
								$_r_QuantityFractiion:=$_r_DiscountQuantity/$_r_Quantity
								$_r_Quantity1:=$_r_Quantity
							End if 
							If (($_r_Quantity<=0) | (($_l_MovementAtLevel>0) & ($_l_MovementsDone>=$_l_MovementAtLevel)))
							Else 
								$_l_LineIndex:=$_l_LineIndex+1
								StockAss_DisIns($_l_LineIndex)
								SRProdCode{$_l_LineIndex}:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
								SRSerial{$_l_LineIndex}:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
								SRQtyT{$_l_LineIndex}:=[STOCK_MOVEMENT_ITEMS:27]Location:7
								SRPrice{$_l_LineIndex}:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
								If ([STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14=1)
									SRRate{$_l_LineIndex}:=[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14
								Else 
									SRRate{$_l_LineIndex}:=Int:C8([STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14*$_r_QuantityFractiion)
								End if 
								SRDesc{$_l_LineIndex}:="-MINUS"
								$_r_QuantityP:=SRRate{$_l_LineIndex}
								If ($_l_MovementAtLevel=0)
									$_l_MovementAtLevel:=Int:C8([STOCK_MOVEMENT_ITEMS:27]Component_Qty:15*($_r_DiscountQuantity/$_r_Quantity1))
									$_l_MovementsDone:=1
								Else 
									$_l_MovementsDone:=$_l_MovementsDone+1
								End if 
								[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14:=Int:C8([STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14-SRRate{$_l_LineIndex})
								If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
									[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								End if 
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
								AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Company_To:2="*MINUS")
								ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; >)
								FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
								While (Not:C34(End selection:C36([STOCK_MOVEMENT_ITEMS:27])))
									$_t_ComponentProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
									$_r_ComponentProductQuantity:=[STOCK_MOVEMENT_ITEMS:27]Component_Qty:15*$_r_QuantityP
									$_r_ComponentQuantityRemaining:=$_r_ComponentProductQuantity
									While ((Not:C34(End selection:C36([STOCK_MOVEMENT_ITEMS:27]))) & ($_t_ComponentProductCode=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1))
										If (($_r_ComponentQuantityRemaining>0) & ([STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14>0))
											$_l_LineIndex:=$_l_LineIndex+1
											StockAss_DisIns($_l_LineIndex)
											SRProdCode{$_l_LineIndex}:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
											SRSerial{$_l_LineIndex}:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
											SRQtyT{$_l_LineIndex}:=[STOCK_MOVEMENT_ITEMS:27]Location:7
											SRPrice{$_l_LineIndex}:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
											If (($_r_ComponentQuantityRemaining-[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14)>=0)
												SRRate{$_l_LineIndex}:=[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14
												$_r_ComponentQuantityRemaining:=$_r_ComponentQuantityRemaining-[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14
											Else 
												SRRate{$_l_LineIndex}:=$_r_ComponentQuantityRemaining
											End if 
											SRDesc{$_l_LineIndex}:="-PLUS"
											[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14:=[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14-SRRate{$_l_LineIndex}
											If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
												[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											End if 
											DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
											AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										End if 
										NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
									End while 
								End while 
								
							End if 
							//  [STOCK MOVEMENTS]Assembly Qty:=[STOCK MOVEMENTS]Assembly Qty-$_r_Quantity
							//  DB_SaveRecord(->[STOCK MOVEMENTS])
							NEXT RECORD:C51([STOCK_MOVEMENTS:40])
							$_l_AssemblyQuantity4:=$_l_AssemblyQuantity3
							$_l_AssemblyQuantity2:=Num:C11(Substring:C12([STOCK_MOVEMENTS:40]Assembly_Reference:12; 10; 2))
							$_l_AssemblyQuantity3:=$_l_AssemblyQuantity2-$_l_AssemblyQuantity+1
							If ($_l_AssemblyQuantity4#$_l_AssemblyQuantity3)
								$_l_MovementAtLevel:=0
							End if 
						End while 
						
						CREATE RECORD:C68([STOCK_MOVEMENTS:40])
						Movement_CodeT
						[STOCK_MOVEMENTS:40]Movement_Type:6:=vType_
						[STOCK_MOVEMENTS:40]Analysis_Code:9:=vAnalysis
						[STOCK_MOVEMENTS:40]Currency_Code:10:=ACC_t_CurrencyCode
						[STOCK_MOVEMENTS:40]Layer_Code:11:=vLayer
						[STOCK_MOVEMENTS:40]Movement_Date:5:=vDate
						[STOCK_MOVEMENTS:40]Type_Number:4:="TBA"
						[STOCK_MOVEMENTS:40]Assembly_Reference:12:="DIS/"+$_t_MovementCode
						[STOCK_MOVEMENTS:40]Assembly_Qty:13:=vStockUA
						
						$_l_LineIndex:=1
						While (($_l_LineIndex<=Size of array:C274(SRProdCode)) & (OK=1))
							CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
							$_bo_Edits:=STK_SetHeaderInfo
							[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
							[STOCK_MOVEMENT_ITEMS:27]Date_Received:5:=vDate
							[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=SRProdCode{$_l_LineIndex}
							[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=SRSerial{$_l_LineIndex}
							[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=SRDesc{$_l_LineIndex}
							[STOCK_MOVEMENT_ITEMS:27]Location:7:=SRQtyT{$_l_LineIndex}
							[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=SRPrice{$_l_LineIndex}
							[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=SRRate{$_l_LineIndex}
							[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
							If ([STOCK_MOVEMENT_ITEMS:27]Company_To:2="-PLUS")
								$_r_Total:=$_r_Total+[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
							Else 
								$_r_Total:=$_r_Total-[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
							End if 
							
							[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
							
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
							AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
							$_l_LineIndex:=$_l_LineIndex+1
						End while 
						
						[STOCK_MOVEMENTS:40]Total_Cost:8:=$_r_Total
						DB_SaveRecord(->[STOCK_MOVEMENTS:40])
						
						If (OK=1)
							$_t_AnalysisCode:=vAnalysis
							$_t_CurrencyCode:=ACC_t_CurrencyCode
							$_t_LayerCode:=vLayer
							If (s1=1)
								Movements_File
								vAdd:=1
								DB_t_CurrentFormUsage:="NoACL"
								Open_Pro_Window("Disassembly Movement"; 0; 2; ->[STOCK_MOVEMENTS:40]; WIN_t_CurrentInputForm)
								
								MODIFY RECORD:C57([STOCK_MOVEMENTS:40]; *)
								Close_ProWin(Table name:C256(->[STOCK_MOVEMENTS:40])+"_"+WIN_t_CurrentInputForm)
								
								If (OK=1)
									If (ch1=1)
										Gen_Confirm("Would you like to Print the Stock Movement?"; "Yes"; "No")
										If (OK=1)
											Movements_Prin2
										End if 
										OK:=1
									End if 
								Else 
									DELETE RECORD:C58([STOCK_MOVEMENTS:40])
								End if 
							Else 
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
								Movement_CodeUp
								If (OK=1)
									Move_InLPAPost
									If (OK=1)
										DB_SaveRecord(->[STOCK_MOVEMENTS:40])
										If (ch1=1)
											Gen_Confirm("Would you like to Print the Stock Movement?"; "Yes"; "No")
											If (OK=1)
												Movements_Prin2
											End if 
											OK:=1
										End if 
									End if 
								Else 
									DELETE RECORD:C58([STOCK_MOVEMENTS:40])
								End if 
							End if 
							vAnalysis:=$_t_AnalysisCode
							ACC_t_CurrencyCode:=$_t_CurrencyCode
							vLayer:=$_t_LayerCode
							
						End if 
						
					Else 
						OK:=0
					End if 
				End if 
				
				Transact_End
				Gen_InOne
			End while 
			Close_ProWin
		Else 
			Gen_Alert("No Movement Type has been specified as being used for Assembly/Disassembly"; "Cancel")
		End if 
		vAdd:=$_l_AddMode
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("StockAss_Dis"; $_t_oldMethodName)

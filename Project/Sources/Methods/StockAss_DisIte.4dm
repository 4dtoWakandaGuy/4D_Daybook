//%attributes = {}
If (False:C215)
	//Project Method Name:      StockAss_DisIte
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
	C_BOOLEAN:C305(<>StockAnal; $_bo_Update)
	C_LONGINT:C283($_l_1; $_l_2; $_l_3; $_l_Index; $_l_Index2; $_l_ItemsRow; ch1; s1; s2; vNo; vSNo)
	C_REAL:C285($_r_Sum; vPrice)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AssemblyReference; $_t_MovementCode; $_t_oldMethodName; $_t_Title; ACC_t_CurrencyCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vAnalysis; vLayer)
	C_TEXT:C284(vProdCode; vSerialNo; vStatus; vTitleL; vType_)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_DisIte")
Menu_Record("StockAss_DisIte"; "Trial Assembly")

If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1="")
	Gen_Alert("Please first specify the Code of the Product to Disassemble"; "Try again")
	OK:=0
Else 
	
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3=[MOVEMENT_TYPES:60]Stock_Plus:3; *)
	If ([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4#"")
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Serial_Number:2=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; *)
	End if 
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; *)
	StockCurr_ACLSr
	
	If (Records in selection:C76([CURRENT_STOCK:62])#0)
		
		OK:=1
		If ((Records in selection:C76([CURRENT_STOCK:62])>1) | ([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4=""))
			vStatus:=[MOVEMENT_TYPES:60]Stock_Plus:3
			$_t_Title:="Select Disassembly Item"
			Gen_Confirm($_t_Title+Char:C90(13)+Char:C90(13)+"Please select an Item from "+Term_StoWT("Current Stock")+" to Disassemble")
			If (OK=1)
				//Userset_Empty (->[CURRENT STOCK])
				//OUTPUT FORM([CURRENT STOCK];"StockCurr_Out")
				//WIN_t_CurrentOutputform:="StockCurr_Out"
				//Open_Pro_Window ($_t_Title;0;1;->[CURRENT STOCK];WIN_t_CurrentOutputform)
				//DB_t_CurrentFormUsage:="Select"
				//vNo:=Records in selection([CURRENT STOCK])
				//FS_SetFormSort (WIN_t_CurrentOutputform)
				//WIn_SetFormSize (1;->[CURRENT STOCK];WIN_t_CurrentOutputform)
				//D`ISPLAY SELECTION([CURRENT STOCK];*)
				//Close_ProWin
				//If (OK=1)
				//Userset
				//End if
				
				DBI_MenuSelectRecords(Table name:C256(Table:C252(->[CURRENT_STOCK:62])); True:C214)
				
				
			End if 
			
		Else 
			
		End if 
		If (OK=1)
			$_r_Sum:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
			If ($_r_Sum<[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_Sum
			End if 
			FIRST RECORD:C50([CURRENT_STOCK:62])
			[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=[CURRENT_STOCK:62]Serial_Number:2
			[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[CURRENT_STOCK:62]Cost_Price:6
			If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
				[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			End if 
			
			DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
			AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			DB_SaveRecord(->[STOCK_MOVEMENTS:40])
			vType_:=[STOCK_MOVEMENTS:40]Movement_Type:6
			vProdCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
			vSerialNo:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
			vPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
			vAnalysis:=[STOCK_MOVEMENTS:40]Analysis_Code:9
			ACC_t_CurrencyCode:=[STOCK_MOVEMENTS:40]Currency_Code:10
			vLayer:=[STOCK_MOVEMENTS:40]Layer_Code:11
			CUT NAMED SELECTION:C334([STOCK_MOVEMENT_ITEMS:27]; "$SI")
			CUT NAMED SELECTION:C334([STOCK_MOVEMENTS:40]; "$SM")
			
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[CURRENT_STOCK:62]Product_Code:1; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Company_To:2="*PLUS"; *)
			If ([CURRENT_STOCK:62]Serial_Number:2#"")
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4=[CURRENT_STOCK:62]Serial_Number:2; *)
			Else 
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=[CURRENT_STOCK:62]Cost_Price:6; *)
			End if 
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14#0)
			
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])#0)
				
				Join_SelFast(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; ->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Movement_Code:1)
				QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Type:6=vType_; *)
				QUERY SELECTION:C341([STOCK_MOVEMENTS:40];  & ; [STOCK_MOVEMENTS:40]Assembly_Reference:12#""; *)
				QUERY SELECTION:C341([STOCK_MOVEMENTS:40];  & ; [STOCK_MOVEMENTS:40]Assembly_Reference:12#"DIS@")
				//SEARCH SELECTION([STOCK MOVEMENTS]; & ;[STOCK MOVEMENTS]Assembly Qty#0)
				If (<>StockAnal)
					QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Analysis_Code:9=[CURRENT_STOCK:62]Analysis_Code:10)
				End if 
				If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
					If ([STOCK_MOVEMENTS:40]Currency_Code:10=<>SYS_t_BaseCurrency)
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Currency_Code:10=[CURRENT_STOCK:62]Currency_Code:11; *)
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40];  | ; [STOCK_MOVEMENTS:40]Currency_Code:10="")
					Else 
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Currency_Code:10=[CURRENT_STOCK:62]Currency_Code:11)
					End if 
				End if 
				If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
					If ([STOCK_MOVEMENTS:40]Layer_Code:11=DB_GetLedgerActualLayer)
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Layer_Code:11=[CURRENT_STOCK:62]Layer_Code:12; *)
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40];  | ; [STOCK_MOVEMENTS:40]Layer_Code:11="")
					Else 
						QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Layer_Code:11=[CURRENT_STOCK:62]Layer_Code:12)
					End if 
				End if 
				
				If (Records in selection:C76([STOCK_MOVEMENTS:40])#0)
					
					If (Records in selection:C76([STOCK_MOVEMENTS:40])>1)
						vNo:=Records in selection:C76([STOCK_MOVEMENTS:40])
						Gen_Confirm("That Item could have been originally assembled by "+String:C10(vNo)+" Movements - please select the one most suitable for Disassembly"; "OK"; "Cancel")
						If (OK=1)
							//$_t_CurrentOutputform:=WIN_t_CurrentOutputform
							//$WinCurrentInput:=WIN_t_CurrentInputForm
							//INPUT FORM([STOCK MOVEMENTS];"Movements_in")  `NG April 2004 Removed ◊Screen
							//WIN_t_CurrentInputForm:="Movements_in"
							//OUTPUT FORM([STOCK MOVEMENTS];"Movements_out")
							//WIN_t_CurrentOutputform:="Movements_out"
							//v`Layout:="Select"
							//Userset_Empty (->[STOCK MOVEMENTS])
							//Open_Pro_Window ("Select a Movement";0;1;->[STOCK MOVEMENTS];WIN_t_CurrentOutputform)
							//FS_SetFormSort (WIN_t_CurrentOutputform)
							//WIn_SetFormSize (1;->[STOCK MOVEMENTS];WIN_t_CurrentOutputform)
							//D`ISPLAY SELECTION([STOCK MOVEMENTS];*)
							//WIN_t_CurrentOutputform:=$_t_CurrentOutputform
							//WIN_t_CurrentInputForm:=$WinCurrentInput
							//Close_ProWin
							//Userset
							
							DBI_MenuSelectRecords(Table name:C256(Table:C252(->[STOCK_MOVEMENTS:40])); True:C214)
							
							
						End if 
					End if 
					
					If (Records in selection:C76([STOCK_MOVEMENTS:40])>=1)
						FIRST RECORD:C50([STOCK_MOVEMENTS:40])
						$_t_AssemblyReference:=Substring:C12([STOCK_MOVEMENTS:40]Assembly_Reference:12; 1; 8)+"@"
						$_t_MovementCode:=[STOCK_MOVEMENTS:40]Movement_Code:1
						QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Assembly_Reference:12=$_t_AssemblyReference; *)
						QUERY:C277([STOCK_MOVEMENTS:40];  & ; [STOCK_MOVEMENTS:40]Movement_Code:1<=$_t_MovementCode)
						ORDER BY:C49([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Assembly_Reference:12; >)
						COPY NAMED SELECTION:C331([STOCK_MOVEMENTS:40]; "Movts")
						FIRST RECORD:C50([STOCK_MOVEMENTS:40])
						$_l_1:=Num:C11(Substring:C12([STOCK_MOVEMENTS:40]Assembly_Reference:12; 10; 2))
						LAST RECORD:C200([STOCK_MOVEMENTS:40])
						$_l_2:=Num:C11(Substring:C12([STOCK_MOVEMENTS:40]Assembly_Reference:12; 10; 2))
						vSNo:=$_l_2-$_l_1+1
						OBJECT SET FORMAT:C236(vSNo; "|Quantities")
						//_O_OBJECT SET COLOR(vSNo;-62211)
						UTIL_setObjectByColour(0; "vSNo"; -62211)
						
						OBJECT SET ENABLED:C1123(s1; True:C214)
						OBJECT SET ENABLED:C1123(s2; True:C214)
						OBJECT SET ENABLED:C1123(ch1; True:C214)
						If ((s1=0) & (s2=0))
							s2:=1
						End if 
						
						If (DB_t_CurrentFormUsage2="Display")
							Form_SRArray(0)
							FIRST RECORD:C50([STOCK_MOVEMENTS:40])
							$_l_ItemsRow:=0
							For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENTS:40]))
								//While (Not(End selection([STOCK_MOVEMENTS])))
								$_l_2:=Num:C11(Substring:C12([STOCK_MOVEMENTS:40]Assembly_Reference:12; 10; 2))
								$_l_3:=$_l_2-$_l_1+1
								
								$_bo_Update:=True:C214
								If ($_l_ItemsRow=0)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
									If ([CURRENT_STOCK:62]Serial_Number:2#"")
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4=[CURRENT_STOCK:62]Serial_Number:2; *)
									Else 
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=[CURRENT_STOCK:62]Cost_Price:6; *)
									End if 
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Company_To:2="*PLUS")
									If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
										$_bo_Update:=False:C215
									Else 
										$_l_ItemsRow:=$_l_ItemsRow+1
										StockAss_DisIns($_l_ItemsRow)
										SRSerial{$_l_ItemsRow}:=vProdCode
										SRProdCode{$_l_ItemsRow}:=vSerialNo
										QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=vProdCode)
										SRDesc{$_l_ItemsRow}:=Substring:C12([PRODUCTS:9]Product_Name:2; 1; 28)
										SRQtyT{$_l_ItemsRow}:="0"
										SRPrice{$_l_ItemsRow}:=[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14
										SRRate{$_l_ItemsRow}:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
									End if 
								End if 
								If ($_bo_Update)
									
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Company_To:2="*MINUS")
									FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
									For ($_l_Index2; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
										//While (Not(End selection([STOCK_MOVEMENT_ITEMS])))
										$_l_ItemsRow:=$_l_ItemsRow+1
										StockAss_DisIns($_l_ItemsRow)
										SRSerial{$_l_ItemsRow}:=("  "*$_l_3)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
										SRProdCode{$_l_ItemsRow}:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
										QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
										SRDesc{$_l_ItemsRow}:=Substring:C12([PRODUCTS:9]Product_Name:2; 1; 28)
										SRQtyT{$_l_ItemsRow}:=String:C10($_l_3)
										SRPrice{$_l_ItemsRow}:=[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14
										SRRate{$_l_ItemsRow}:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
										NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
									End for 
								End if 
								
								NEXT RECORD:C51([STOCK_MOVEMENTS:40])
							End for 
						End if 
						
						vTitleL:="DISASSEMBLY AVAILABILITY"
						
					End if 
					
				Else 
					Gen_Alert("No Assembly Stock Movement has been found for that Current Stock Item"; "Try again")
					OK:=0
				End if 
			Else 
				Gen_Alert("No Assembly Stock Movement has been found for that Current Stock Item"; "Try again")
				OK:=0
			End if 
			
			USE NAMED SELECTION:C332("$SI")
			USE NAMED SELECTION:C332("$SM")
			[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=vSNo
			
		End if 
		
	Else 
		Gen_Alert("No Current Stock has been found in Stock Type "+[MOVEMENT_TYPES:60]Stock_Plus:3+" for that Product"; "Try again")
		OK:=0
	End if 
End if 
ERR_MethodTrackerReturn("StockAss_DisIte"; $_t_oldMethodName)

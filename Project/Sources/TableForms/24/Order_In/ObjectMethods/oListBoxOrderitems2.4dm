If (False:C215)
	//object Name: [ORDERS]Orders_In.oListBoxOrderitems2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2013 15:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ORD_lb_ArraySelection;0)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(ORD_at_ModeOrders;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdCode;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdName;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; ORD_bo_QuickAddMode; vAutoFind)
	C_LONGINT:C283($_l_Column; $_l_CurrentSortColumn; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; $_l_TableNumberRow; LB_l_ColumnNumber; LB_l_CurrentSortColumn; LB_l_LastRow; LB_l_RowNumber)
	C_LONGINT:C283(ORD_l_FurtherFieldsMod)
	C_POINTER:C301($_ptr_ListBoxSetup)
	C_REAL:C285(ORD_r_SubSelection)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; $_t_Product; $_t_VariableName; DB_t_CurrentFormUsage3; vT)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS]Orders_In.oListBoxOrderitems2"; Form event code:C388)

$_l_event:=Form event code:C388
If (True:C214)
	//TRACE
	Case of 
			
		: ($_l_event=On Header Click:K2:40)
			If (ORD_bo_QuickAddMode)
				$_l_TableNumberRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
				
				If ($_l_TableNumberRow>0)
					//$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableNumberRow}
					LB_l_LastRow:=0
					RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					$_l_Row:=Self:C308->
					$_l_CurrentSortColumn:=LB_GetColumn(->ORD_r_SubSelection; ""; $_t_VariableName)
					LB_l_CurrentSortColumn:=$_l_CurrentSortColumn
					
				End if 
			Else 
				Case of 
					: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
						RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
						$_l_Row:=Self:C308->
						LB_l_RowNumber:=$_l_Row
						
						LB_l_ColumnNumber:=LB_GetColumn(->ORD_lb_ArraySelection; $_t_VariableName)
						LISTBOX SORT COLUMNS:C916(ORD_lb_ArraySelection; LB_l_ColumnNumber)
						
					Else 
						$_l_TableNumberRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
						
						If ($_l_TableNumberRow>0)
							$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableNumberRow}
							LB_l_LastRow:=0
							RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							$_l_Row:=Self:C308->
							$_l_CurrentSortColumn:=LB_GetColumn(->ORD_r_SubSelection; ""; $_t_VariableName)
							LB_l_CurrentSortColumn:=$_l_CurrentSortColumn
							LBi_AreaScript($_ptr_ListBoxSetup; 0; [ORDERS:24]Order_Code:3; ->ORD_at_ModeOrders; $_l_Row; $_t_VariableName; "ORD_LBI_Items"; $_l_CurrentSortColumn)
						End if 
				End case 
			End if 
			
			//***********ends**********************************
			//``
		: ($_l_event=On Drag Over:K2:13)
			
		Else 
			
			Case of 
				: (ORD_bo_QuickAddMode)
					Case of 
						: ($_l_event=On Clicked:K2:4)
							RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							$_l_Row:=Self:C308->
							RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							LISTBOX GET CELL POSITION:C971(ORD_lb_ArraySelection; $_l_Column; $_l_Row)
							LB_l_RowNumber:=$_l_Row
							
							LB_l_ColumnNumber:=LB_GetColumn(->ORD_lb_ArraySelection; $_t_VariableName)
							If (LB_l_ColumnNumber=1) | (LB_l_ColumnNumber=2)
								//$_l_Row:=AL_GetLine (eALFurth)
								$_l_Row:=Self:C308->
								LB_SetEnterable(->ORD_lb_ArraySelection; True:C214; LB_l_ColumnNumber)
								EDIT ITEM:C870(Self:C308->; LB_l_RowNumber)
								
							End if 
						: ($_l_event=On Data Change:K2:15) | ($_l_event=On Losing Focus:K2:8)
							RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							$_l_Row:=Self:C308->
							LB_l_ColumnNumber:=LB_GetColumn(->ORD_lb_ArraySelection; $_t_VariableName)
							Case of 
								: (LB_l_ColumnNumber=1)
									$_t_Product:=ORD_AT_QuickAddProdCode{$_l_Row}
									Check_ProductNC(->$_t_Product; "")
									If ([PRODUCTS:9]Product_Name:2#"")
										ORD_AT_QuickAddProdCode{$_l_Row}:=[PRODUCTS:9]Product_Code:1
										ORD_AT_QuickAddProdName{$_l_Row}:=[PRODUCTS:9]Product_Name:2
									Else 
										ORD_AT_QuickAddProdCode{$_l_Row}:=""
									End if 
								: (LB_l_ColumnNumber=2)
									
								: (LB_l_ColumnNumber=3)
									ORD_AT_QuickAddProdName{$_l_Row}:=Uppers2(ORD_AT_QuickAddProdName{$_l_Row})
							End case 
					End case 
				: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
					RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					$_l_Row:=Self:C308->
					RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					$_l_Row:=Self:C308->
					LB_l_RowNumber:=$_l_Row
					
					LB_l_ColumnNumber:=LB_GetColumn(->ORD_lb_ArraySelection; $_t_VariableName)
					
					//$_l_Row:=AL_GetLine (eALFurth)
					$_l_Row:=Self:C308->
					If ($_l_Row>0)
						If (Length:C16(FUR_at_CustomFieldTypes{$_l_Row})=1)
							OBJECT SET ENTERABLE:C238(CUS_at_DisplayedData; True:C214)
							EDIT ITEM:C870(Self:C308->; $_l_Row)
							//  AL_SetScroll (eALFurth;$_l_Row;2)
						End if 
					End if 
					
					Case of 
						: ($_l_event=On Clicked:K2:4)
							RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							$_l_Row:=Self:C308->
							RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							$_l_Row:=Self:C308->
							LB_l_RowNumber:=$_l_Row
							
							LB_l_ColumnNumber:=LB_GetColumn(->ORD_lb_ArraySelection; $_t_VariableName)
							
							//$_l_Row:=AL_GetLine (eALFurth)
							$_l_Row:=Self:C308->
							If ($_l_Row>0)
								If (Length:C16(FUR_at_CustomFieldTypes{$_l_Row})=1)
									OBJECT SET ENTERABLE:C238(CUS_at_DisplayedData; True:C214)
									EDIT ITEM:C870(Self:C308->; $_l_Row)
									//  AL_SetScroll (eALFurth;$_l_Row;2)
								End if 
							End if 
							//: (ALProEvt=2)  `Double click
						: ($_l_event=On Double Clicked:K2:5)
							RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							$_l_Row:=Self:C308->
							LB_l_RowNumber:=$_l_Row
							
							LB_l_ColumnNumber:=LB_GetColumn(->ORD_lb_ArraySelection; $_t_VariableName)
							
							//$_l_Row:=AL_GetLine (eALFurth)
							$_l_Row:=Self:C308->
							
							If ($_l_Row>0)
								If (Length:C16(FUR_at_CustomFieldTypes{$_l_Row})=1)
									Case of 
										: ((FUR_at_CustomFieldTypes{$_l_Row}="T") & (vAutoFind))  //text field
											vT:=CUS_at_DisplayedData{$_l_Row}
											Text_Expand(->vT; FUR_at_CustomFieldNames{$_l_Row})
											If (OK=1)
												CUS_at_DisplayedData{$_l_Row}:=vT
												//AL_UpdateArrays (eALFurth;-1)
												DB_bo_RecordModified:=True:C214
											End if 
										: ((FUR_at_CustomFieldFormat{$_l_Row}="Pictures") & (vAutoFind))  //virtual Picture field
											If (CUS_at_DisplayedData{$_l_Row}="")
												CUS_at_DisplayedData{$_l_Row}:="@"
												$_t_CurrentFormUsage:=DB_t_CurrentFormUsage3
												DB_t_CurrentFormUsage3:="FurthFld: "+FUR_at_CustomFieldNames{LB_l_RowNumber}
												Check_Minor(->CUS_at_DisplayedData{$_l_Row}; ""; ->[PICTURES:85]; ->[PICTURES:85]Picture_Code:1; ->[PICTURES:85]Picture_Name:2; "Pictures In"; "Picture")
												DB_t_CurrentFormUsage3:=$_t_CurrentFormUsage
											Else 
												QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=CUS_at_DisplayedData{$_l_Row})
											End if 
											If (Records in selection:C76([PICTURES:85])>0)
												DBI_DisplayRecord(-Current process:C322; Table:C252(->[PICTURES:85]); ""; [PICTURES:85]Picture_Code:1)
												DB_bo_RecordModified:=True:C214
												
											End if 
											READ ONLY:C145([PICTURES:85])
										Else 
											
											EDIT ITEM:C870(Self:C308->; $_l_Row)
											//  AL_SetScroll (eALFurth;$_l_Row;2)
									End case 
								End if 
							End if 
							// : (ALProEvt=-3)  `Resized columns
							// : (ALProEvt=-4)  `Changed column lock
							// : (ALProEvt=-7)  `column dragged
							// : ((ALProEvt=-5) | (ALProEvt=-1))  `Sort button or Row dragged
						: (Form event code:C388=On Before Keystroke:K2:6)
							
							If (LB_l_ColumnNumber=2)
								If (Length:C16(FUR_at_CustomFieldTypes{LB_l_RowNumber})>1)
									
									GOTO OBJECT:C206(FUR_at_CustomFieldTypes)  // not sure if this is correct!
								End if 
							End if 
							
						: (Form event code:C388=On Data Change:K2:15)
							RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							$_l_Column:=LB_GetColumn(->ORD_r_SubSelection; $_t_VariableName)
							$_l_Row:=Self:C308->
							Furth_LBI_Mod(->ORD_r_SubSelection; $_l_Column; $_l_Row)
							ORD_l_FurtherFieldsMod:=ORD_l_FurtherFieldsMod+1  //Gets reset to 0 when loading a record or in LPA
					End case 
					
				Else 
					$_l_TableNumberRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
					
					If ($_l_TableNumberRow>0)
						$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableNumberRow}
						Case of 
							: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
								LBi_AreaScript($_ptr_ListBoxSetup; 0; [ORDERS:24]Order_Code:3; ->ORD_at_ModeOrders; $_l_Row; $_t_VariableName; "ORD_LBI_Items")
							Else 
								//Open diary items, Invoices_In a seperate process
								LBi_AreaScript($_ptr_ListBoxSetup; 1; [ORDERS:24]Order_Code:3; ->ORD_at_ModeOrders; $_l_Row; $_t_VariableName; "ORD_LBI_Items")
						End case 
					End if 
					
			End case 
			
	End case 
End if 
ERR_MethodTrackerReturn("OBJ:Orders_In,ORD_r_SubSelection"; $_t_oldMethodName)

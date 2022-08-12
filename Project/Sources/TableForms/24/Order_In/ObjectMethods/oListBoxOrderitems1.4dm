If (False:C215)
	//object Name: [ORDERS]Orders_In.oListBoxOrderitems1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2013 00:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(ORD_at_ModeOrders;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(DB_bo_MouseActive; DB_bo_RecordModified; vAutoFind)
	C_LONGINT:C283($_l_Column; $_l_CurrentSortColumn; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; $_l_TableRow; LB_l_ColumnNumber; LB_l_CurrentSortColumn; LB_l_LastRow; LB_l_RowNumber)
	C_LONGINT:C283(ORD_l_FurtherFieldsMod)
	C_POINTER:C301($_ptr_ListBoxSetup)
	C_REAL:C285(ORD_r_SubSelection)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; $_t_VariableName; DB_t_CurrentFormUsage3; vT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.oListBoxOrderitems1"; Form event code:C388)
$_l_event:=Form event code:C388
If (True:C214)
	
	Case of 
			
		: ($_l_event=On Header Click:K2:40)
			DB_bo_MouseActive:=False:C215
			$_l_TableRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
			
			If ($_l_TableRow>0)
				$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableRow}
				LB_l_LastRow:=0
				RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
				$_l_Row:=Self:C308->
				$_l_CurrentSortColumn:=LB_GetColumn(->ORD_r_SubSelection; ""; $_t_VariableName)
				LB_l_CurrentSortColumn:=$_l_CurrentSortColumn
				LBi_AreaScript($_ptr_ListBoxSetup; 0; [ORDERS:24]Order_Code:3; ->ORD_at_ModeOrders; $_l_Row; $_t_VariableName; "ORD_LBI_Items"; $_l_CurrentSortColumn)
			End if 
			//***********ends**********************************
			//``
		: ($_l_event=On Drag Over:K2:13)
		Else 
			
			Case of 
				: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
					Case of 
						: ($_l_event=On Clicked:K2:4)
							RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							$_l_Row:=Self:C308->
							LB_l_RowNumber:=$_l_Row
							LB_l_ColumnNumber:=LB_GetColumn(->ORD_r_SubSelection; $_t_VariableName)
							
							//$_l_Row:=AL_GetLine (eALFurth)
							
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
							
							LB_l_ColumnNumber:=LB_GetColumn(->ORD_r_SubSelection; $_t_VariableName)
							
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
					
				: ($_l_event=On Mouse Enter:K2:33)
					DB_bo_MouseActive:=True:C214
					$_l_TableRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					
					If ($_l_TableRow>0)
						$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableRow}
						LBI_HandleRollover(DB_bo_MouseActive; "oListBoxOrderitems1"; ->ORD_al_ViewTableToTable; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}; $_ptr_ListBoxSetup)
					End if 
				: ($_l_event=On Mouse Leave:K2:34)
					DB_bo_MouseActive:=False:C215
				: ($_l_event=On Mouse Move:K2:35)
					$_l_TableRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					
					If ($_l_TableRow>0)
						$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableRow}
						
						LBI_HandleRollover(DB_bo_MouseActive; "oListBoxOrderitems1"; ->ORD_al_ViewTableToTable; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}; $_ptr_ListBoxSetup)
					End if 
				Else 
					DB_bo_MouseActive:=False:C215
					RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					LISTBOX GET CELL POSITION:C971(ORD_r_SubSelection; $_l_Column; $_l_Row)
					
					//$_l_Row:=Self->
					
					$_l_TableRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
					
					If ($_l_TableRow>0)
						$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableRow}
						
						Case of 
							: (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
								LBi_AreaScript($_ptr_ListBoxSetup; 0; [ORDERS:24]Order_Code:3; ->ORD_at_ModeOrders; $_l_Row; $_t_VariableName; "ORD_LBI_Items"; 0; "ORDI_RejectCells")
								
								
							Else 
								//Open diary items, Invoices_In a seperate process
								LBi_AreaScript($_ptr_ListBoxSetup; 1; [ORDERS:24]Order_Code:3; ->ORD_at_ModeOrders; $_l_Row; $_t_VariableName; "ORD_LBI_Items")
						End case 
						If ($_l_event=On Double Clicked:K2:5) | ($_l_event=On Data Change:K2:15)
							DB_SaveRecord(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}))
							
							GET HIGHLIGHTED RECORDS:C902(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$ORD_SelectedRelated")
							COPY NAMED SELECTION:C331(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$CurrentSelection")
							REDUCE SELECTION:C351(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; 0)
							USE NAMED SELECTION:C332("$CurrentSelection")
							HIGHLIGHT RECORDS:C656(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$ORD_SelectedRelated")
						End if 
					End if 
					
			End case 
			
	End case 
End if 
ERR_MethodTrackerReturn("OBJ:Orders_In,ORD_r_SubSelection"; $_t_oldMethodName)

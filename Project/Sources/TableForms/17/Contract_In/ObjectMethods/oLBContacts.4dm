If (False:C215)
	//object Name: [CONTRACTS]Contract_in.oLBContractitems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/07/2012 19:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SVS_lb_ItemsSetup;0)
	//ARRAY LONGINT(CONT_al_ViewTableToTable;0)
	//ARRAY POINTER(ORD_aPtr_OrderItemsSetup;0)
	//ARRAY POINTER(SVS_aptr_ListboxSetup;0)
	//ARRAY POINTER(SVS_aPtr_OrderItemsSetup;0)
	//ARRAY TEXT(CON_at_EditMode;0)
	//ARRAY TEXT(CONT_at_ViewTabsLabels;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; vAutoFind)
	C_LONGINT:C283($_l_Column; $_l_CurrentColumn; $_l_event; $_l_FieldNumber; $_l_Row; $_l_SelectedRow; $_l_TableNumber; CONT_l_FurtherFieldsMod; LB_l_ColumnNumber; LB_l_RowNumber)
	C_TEXT:C284($_t_CurrentFormUsage3; $_t_oldMethodName; $_t_VariableName; DB_t_CurrentFormUsage3; vT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contract_in.oLBContractitems"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentColumn:=LB_GetColumn(->SVS_lb_ItemsSetup; ""; $_t_VariableName)
		LBi_AreaScript(->SVS_aptr_ListboxSetup; 0; [CONTRACTS:17]Contract_Code:3; ->CON_at_EditMode; $_l_Row; $_t_VariableName; "CONT_LBI_OrderItems"; $_l_CurrentColumn)
		
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
		
	Else 
		Case of 
			: (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
				Case of 
					: ($_l_event=On Clicked:K2:4)
						RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
						$_l_SelectedRow:=Self:C308->
						LB_l_RowNumber:=$_l_SelectedRow
						
						LB_l_ColumnNumber:=LB_GetColumn(->SVS_lb_ItemsSetup; $_t_VariableName)
						
						//$_l_SelectedRow:=AL_GetLine (eALFurth)
						$_l_SelectedRow:=Self:C308->
						If ($_l_SelectedRow>0)
							If (Length:C16(FUR_at_CustomFieldTypes{$_l_SelectedRow})=1)
								OBJECT SET ENTERABLE:C238(CUS_at_DisplayedData; True:C214)
								EDIT ITEM:C870(Self:C308->; $_l_SelectedRow)
								//  AL_SetScroll (eALFurth;$_l_SelectedRow;2)
							End if 
						End if 
						//: (ALProEvt=2)  `Double click
					: ($_l_event=On Double Clicked:K2:5)
						RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
						$_l_SelectedRow:=Self:C308->
						LB_l_RowNumber:=$_l_SelectedRow
						
						LB_l_ColumnNumber:=LB_GetColumn(->SVS_lb_ItemsSetup; $_t_VariableName)
						
						//$_l_SelectedRow:=AL_GetLine (eALFurth)
						$_l_SelectedRow:=Self:C308->
						
						If ($_l_SelectedRow>0)
							If (Length:C16(FUR_at_CustomFieldTypes{$_l_SelectedRow})=1)
								Case of 
									: ((FUR_at_CustomFieldTypes{$_l_SelectedRow}="T") & (vAutoFind))  //text field
										vT:=CUS_at_DisplayedData{$_l_SelectedRow}
										Text_Expand(->vT; FUR_at_CustomFieldNames{$_l_SelectedRow})
										If (OK=1)
											CUS_at_DisplayedData{$_l_SelectedRow}:=vT
											//AL_UpdateArrays (eALFurth;-1)
											DB_bo_RecordModified:=True:C214
										End if 
									: ((FUR_at_CustomFieldFormat{$_l_SelectedRow}="Pictures") & (vAutoFind))  //virtual Picture field
										If (CUS_at_DisplayedData{$_l_SelectedRow}="")
											CUS_at_DisplayedData{$_l_SelectedRow}:="@"
											$_t_CurrentFormUsage3:=DB_t_CurrentFormUsage3
											DB_t_CurrentFormUsage3:="FurthFld: "+FUR_at_CustomFieldNames{LB_l_RowNumber}
											Check_Minor(->CUS_at_DisplayedData{$_l_SelectedRow}; ""; ->[PICTURES:85]; ->[PICTURES:85]Picture_Code:1; ->[PICTURES:85]Picture_Name:2; "Pictures In"; "Picture")
											DB_t_CurrentFormUsage3:=$_t_CurrentFormUsage3
										Else 
											QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=CUS_at_DisplayedData{$_l_SelectedRow})
										End if 
										If (Records in selection:C76([PICTURES:85])>0)
											DBI_DisplayRecord(-Current process:C322; Table:C252(->[PICTURES:85]); ""; [PICTURES:85]Picture_Code:1)
											DB_bo_RecordModified:=True:C214
										End if 
										READ ONLY:C145([PICTURES:85])
									Else 
										
										EDIT ITEM:C870(Self:C308->; $_l_SelectedRow)
										//  AL_SetScroll (eALFurth;$_l_SelectedRow;2)
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
						$_l_Column:=LB_GetColumn(->SVS_lb_ItemsSetup; $_t_VariableName)
						$_l_Row:=Self:C308->
						Furth_LBI_Mod(->SVS_lb_ItemsSetup; $_l_Column; $_l_Row)
						CONT_l_FurtherFieldsMod:=CONT_l_FurtherFieldsMod+1  //Gets reset to 0 when loading a record or in LPA
				End case 
				
			Else 
				RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
				$_l_Row:=Self:C308->
				LBi_AreaScript(->ORD_aPtr_OrderItemsSetup; 0; [CONTRACTS:17]Contract_Code:3; ->CON_at_EditMode; $_l_Row; $_t_VariableName; "CONT_LBI_OrderItems")
		End case 
End case 
ERR_MethodTrackerReturn("OBJ:Contract_in,SVS_lb_ItemsSetup"; $_t_oldMethodName)

If (False:C215)
	//object Name: [ORDER_ITEMS]Items_in.oOrderIRelated
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2010 10:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ORDI_LB_RelatedData;0)
	//ARRAY LONGINT(ORDI_al_ViewTableToTable;0)
	//ARRAY LONGINT(ORDI_al_ViewsTableToTable;0)
	//ARRAY LONGINT(ORDI_al_ViewTabsSettings;0)
	//ARRAY POINTER(ORDI_aptr_ListBoxPointers;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(ORDI_at_ModeOrders;0)
	//ARRAY TEXT(ORDI_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; vAutoFind)
	C_LONGINT:C283($_l_Column; $_l_CurrentSortColumn; $_l_event; $_l_FieldNumber; $_l_Row; $_l_RowLB_l_ColumnNumber; $_l_TableNumber; LB_l_ColumnNumber; LB_l_LastRow; LB_l_RowNumber; ORDI_l_FurtherFieldsMod)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; $_t_VariableName; DB_t_CurrentFormUsage3; vT)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].Items_in.oOrderIRelated"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
		
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->ORDI_LB_RelatedData; ""; $_t_VariableName)
		LBi_AreaScript(->ORDI_aptr_ListBoxPointers; ORDI_al_ViewTabsSettings{ORDI_at_ViewTabsLabels}; String:C10([ORDER_ITEMS:25]Item_Number:27); ->ORDI_at_ModeOrders; $_l_Row; $_t_VariableName; ""; $_l_CurrentSortColumn)
		
	Else 
		
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		
		
		Case of 
			: (ORDI_al_ViewTableToTable{ORDI_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
				Case of 
					: ($_l_event=On Clicked:K2:4)
						LB_l_ColumnNumber:=LB_GetColumn(->ORDI_LB_RelatedData; $_t_VariableName)
						
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
						LB_l_ColumnNumber:=LB_GetColumn(->ORDI_LB_RelatedData; $_t_VariableName)
						
						
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
						$_l_Column:=LB_GetColumn(->ORDI_LB_RelatedData; $_t_VariableName)
						$_l_Row:=Self:C308->
						Furth_LBI_Mod(->ORDI_LB_RelatedData; $_l_Column; $_l_Row)
						ORDI_l_FurtherFieldsMod:=ORDI_l_FurtherFieldsMod+1  //Gets reset to 0 when loading a record or in LPA
				End case 
				
			Else 
				LBi_AreaScript(->ORDI_aptr_ListBoxPointers; 1; String:C10([ORDER_ITEMS:25]Item_Number:27); ->ORDI_at_ModeOrders; $_l_Row; $_t_VariableName; "")
				
				
		End case 
		
		//***********ends**********************************
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].Items_in.oOrderIRelated"; $_t_oldMethodName)

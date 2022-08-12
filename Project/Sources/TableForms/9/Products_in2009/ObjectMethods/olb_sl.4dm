If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.olb_sl
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vAutoFind)
	//C_UNKNOWN(vT)
	//ARRAY BOOLEAN(PRD_lb_ProductItems;0)
	//ARRAY LONGINT(PRD_al_ViewTabletoTable;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(PRD_at_ModeSupplier;0)
	//ARRAY TEXT(PRD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(vAutoFind; DB_bo_RecordModified)
	C_LONGINT:C283($_l_CurrentSortColumn; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; LB_l_ColumnNumber; LB_l_LastRow; LB_l_RowNumber; $_l_Column; $_l_CurrentSortColumn; $_l_event)
	C_LONGINT:C283($_l_FieldNumber; $_l_Row; $_l_TableNumber; LB_l_ColumnNumber; LB_l_RowNumber; PRD_l_FurtherFieldsMod)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; DB_t_CurrentFormUsage3; vT; $_t_CurrentFormUsage; $_t_oldMethodName; $_t_VariableName; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.olb_sl"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->PRD_lb_ProductItems; ""; $_t_VariableName)  //Changed 11/11/08 v631b120f -kmw (needs to be passed the actual list box)
		LBi_AreaScript(->PRD_aPtr_RelatedConfiguration; 0; [PRODUCTS:9]Product_Code:1; ->PRD_at_ModeSupplier; $_l_Row; $_t_VariableName; "PROD_LBI_SUppliers"; $_l_CurrentSortColumn)
		
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
	Else 
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		Case of 
			: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
				Case of 
					: ($_l_event=On Clicked:K2:4)
						LB_l_RowNumber:=$_l_Row
						LB_l_ColumnNumber:=LB_GetColumn(->PRD_aPtr_RelatedConfiguration; $_t_VariableName)
						If ($_l_Row>0)
							If (Length:C16(FUR_at_CustomFieldTypes{$_l_Row})=1)
								OBJECT SET ENTERABLE:C238(CUS_at_DisplayedData; True:C214)
								EDIT ITEM:C870(Self:C308->; $_l_Row)
								//  AL_SetScroll (eALFurth;$_l_Row;2)
							End if 
						End if 
						//: (ALProEvt=2)  `Double click
					: ($_l_event=On Double Clicked:K2:5)
						LB_l_RowNumber:=$_l_Row
						
						LB_l_ColumnNumber:=LB_GetColumn(->PRD_aPtr_RelatedConfiguration; $_t_VariableName)
						
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
						$_l_Column:=LB_GetColumn(->PRD_aPtr_RelatedConfiguration; $_t_VariableName)
						Furth_LBI_Mod(->PRD_aPtr_RelatedConfiguration; $_l_Column; $_l_Row)
						PRD_l_FurtherFieldsMod:=PRD_l_FurtherFieldsMod+1  //Gets reset to 0 when loading a record or in LPA
				End case 
				
			Else 
				
				
				Case of 
					: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[PRODUCTS:9]))
						
						
						LBi_AreaScript(->PRD_aPtr_RelatedConfiguration; 0; [PRODUCTS:9]Product_Code:1; ->PRD_at_ModeSupplier; $_l_Row; $_t_VariableName; "PROD_LBI_SUppliers")
					: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[PRICE_TABLE:28]))
						
						LBi_AreaScript(->PRD_aPtr_RelatedConfiguration; 0; [PRODUCTS:9]Product_Code:1; ->PRD_at_ModeSupplier; $_l_Row; $_t_VariableName; "PROD_LBI_PriceTable")
					Else 
						LBi_AreaScript(->PRD_aPtr_RelatedConfiguration; 1; [PRODUCTS:9]Product_Code:1; ->PRD_at_ModeSupplier; $_l_Row; $_t_VariableName; "PROD_LBI_SUppliers")
				End case 
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.olb_sl"; $_t_oldMethodName)

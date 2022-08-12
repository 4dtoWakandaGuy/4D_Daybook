If (False:C215)
	//object Name: [CONTACTS]Contact_In.oContactsRelated
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CON_LB_RelatedData;0)
	//ARRAY LONGINT(CON_al_ViewTableToTable;0)
	//ARRAY LONGINT(CON_al_ViewTabsSettings;0)
	//ARRAY POINTER(CON_aptr_LBSetup;0)
	//ARRAY TEXT(CON_at_editMode;0)
	//ARRAY TEXT(CON_at_ViewTabsLabels;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; vAutoFind)
	C_LONGINT:C283($_l_Column; $_l_CurrentSortColumn; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; CON_l_CurrentSubArea; CON_l_FurtherFieldsMod; CON_l_ParentProcess; LB_l_ColumnNumber; LB_l_LastRow)
	C_LONGINT:C283(LB_l_RowNumber)
	C_TEXT:C284($_t_CurrentFormUsage3; $_t_oldMethodName; $_t_VariableName; CON_t_ContactCode; CON_t_CurrentFocus; DB_t_CurrentFormUsage3; vT)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.oContactsRelated"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
		CON_l_CurrentSubArea:=2
		SET PROCESS VARIABLE:C370(CON_l_ParentProcess; CON_l_CurrentSubArea; CON_l_CurrentSubArea)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->CON_LB_RelatedData; ""; $_t_VariableName)
		LBi_AreaScript(->CON_aptr_LBSetup; CON_al_ViewTabsSettings{CON_at_ViewTabsLabels}; CON_t_ContactCode; ->CON_at_editMode; $_l_Row; $_t_VariableName; "COM_LBI_Items"; $_l_CurrentSortColumn)
		
	Else 
		CON_l_CurrentSubArea:=2
		SET PROCESS VARIABLE:C370(CON_l_ParentProcess; CON_l_CurrentSubArea; CON_l_CurrentSubArea)
		
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		
		
		Case of 
			: (CON_al_ViewTableToTable{CON_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
				Case of 
					: ($_l_event=On Clicked:K2:4)
						CON_t_CurrentFocus:=""
						SET PROCESS VARIABLE:C370(CON_l_ParentProcess; CON_t_CurrentFocus; CON_t_CurrentFocus)
						LB_l_RowNumber:=$_l_Row
						
						LB_l_ColumnNumber:=LB_GetColumn(->CON_LB_RelatedData; $_t_VariableName)
						
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
						
						LB_l_RowNumber:=$_l_Row
						
						LB_l_ColumnNumber:=LB_GetColumn(->CON_LB_RelatedData; $_t_VariableName)
						
						//$_l_Row:=AL_GetLine (eALFurth)
						
						
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
											$_t_CurrentFormUsage3:=DB_t_CurrentFormUsage3
											DB_t_CurrentFormUsage3:="FurthFld: "+FUR_at_CustomFieldNames{LB_l_RowNumber}
											Check_Minor(->CUS_at_DisplayedData{$_l_Row}; ""; ->[PICTURES:85]; ->[PICTURES:85]Picture_Code:1; ->[PICTURES:85]Picture_Name:2; "Pictures In"; "Picture")
											DB_t_CurrentFormUsage3:=$_t_CurrentFormUsage3
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
						$_l_Column:=LB_GetColumn(->CON_LB_RelatedData; $_t_VariableName)
						
						Furth_LBI_Mod(->CON_LB_RelatedData; $_l_Column; $_l_Row)
						CON_l_FurtherFieldsMod:=CON_l_FurtherFieldsMod+1  //Gets reset to 0 when loading a record or in LPA
				End case 
				
			Else 
				LBi_AreaScript(->CON_aptr_LBSetup; 1; [CONTACTS:1]Contact_Code:2; ->CON_at_editMode; $_l_Row; $_t_VariableName; "CON_LBI_Items")
				
				
		End case 
		
		//***********ends**********************************
End case 
ERR_MethodTrackerReturn("OBJ [CONTACTS].Contact_In.oContactsRelated"; $_t_oldMethodName)

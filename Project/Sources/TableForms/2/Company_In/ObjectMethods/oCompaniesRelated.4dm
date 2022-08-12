If (False:C215)
	//object Name: [COMPANIES]Company_In.oCompaniesRelated
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 10:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	//ARRAY LONGINT(CO_al_ViewTableToTable;0)
	//ARRAY LONGINT(CO_al_ViewTabsSettings;0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY TEXT(CO_at_ViewTabsLabels;0)
	//ARRAY TEXT(COM_at_editMode;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305(Co_bo_addingSubentity; DB_bo_MouseActive; DB_bo_RecordModified; LB_bo_SomethingTotest; LB_bo_SomethingTotestMore; vAutoFind)
	C_LONGINT:C283($_l_Column; $_l_CurrentSortColumn; $_l_event; $_l_FieldNumber; $_l_KeyPosition; $_l_Row; $_l_TableNumber; CO_l_FurtherFieldsMod; LB_l_ColumnNumber; LB_l_LastRow; LB_l_RowNumber)
	C_LONGINT:C283(vCT)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_KeyField; $_Ptr_ThisColumnArray)
	C_TEXT:C284($_t_FormUsage3; $_t_oldMethodName; $_t_VariableName; CO_t_RelatedContact; DB_t_CurrentFormUsage3; vT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.oCompaniesRelated"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
		DB_bo_MouseActive:=False:C215
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->GEN_lb_ItemsArea; ""; $_t_VariableName)
		LBi_AreaScript(->COM_aptr_LBItemsSetup; CO_al_ViewTabsSettings{CO_at_ViewTabsLabels}; [COMPANIES:2]Company_Code:1; ->COM_at_editMode; $_l_Row; $_t_VariableName; "COM_LBI_Items"; $_l_CurrentSortColumn)
		
	Else 
		
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		
		Case of 
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
				DB_bo_MouseActive:=False:C215
				Case of 
					: ($_l_event=On Clicked:K2:4)
						LB_l_RowNumber:=$_l_Row
						
						LB_l_ColumnNumber:=LB_GetColumn(->GEN_lb_ItemsArea; $_t_VariableName)
						
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
						
						LB_l_ColumnNumber:=LB_GetColumn(->GEN_lb_ItemsArea; $_t_VariableName)
						
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
											$_t_FormUsage3:=DB_t_CurrentFormUsage3
											DB_t_CurrentFormUsage3:="FurthFld: "+FUR_at_CustomFieldNames{LB_l_RowNumber}
											Check_Minor(->CUS_at_DisplayedData{$_l_Row}; ""; ->[PICTURES:85]; ->[PICTURES:85]Picture_Code:1; ->[PICTURES:85]Picture_Name:2; "Pictures In"; "Picture")
											DB_t_CurrentFormUsage3:=$_t_FormUsage3
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
						$_l_Column:=LB_GetColumn(->GEN_lb_ItemsArea; $_t_VariableName)
						
						Furth_LBI_Mod(->GEN_lb_ItemsArea; $_l_Column; $_l_Row)
						CO_l_FurtherFieldsMod:=CO_l_FurtherFieldsMod+1  //Gets reset to 0 when loading a record or in LPA
				End case 
				
				
			: ($_l_event=On Mouse Enter:K2:33)
				If (Not:C34(Co_bo_addingSubentity))
					DB_bo_MouseActive:=True:C214
					LBI_HandleRollover(DB_bo_MouseActive; "oCompaniesRelated"; ->CO_al_ViewTableToTable; CO_al_ViewTableToTable{CO_at_ViewTabsLabels}; ->COM_aptr_LBItemsSetup)
				End if 
			: ($_l_event=On Mouse Leave:K2:34)
				
				DB_bo_MouseActive:=False:C215
				
			: ($_l_event=On Mouse Move:K2:35)
				If (Not:C34(Co_bo_addingSubentity))
					LBI_HandleRollover(DB_bo_MouseActive; "oCompaniesRelated"; ->CO_al_ViewTableToTable; CO_al_ViewTableToTable{CO_at_ViewTabsLabels}; ->COM_aptr_LBItemsSetup)
				End if 
			Else 
				DB_bo_MouseActive:=False:C215
				LBi_AreaScript(->COM_aptr_LBItemsSetup; 1; [COMPANIES:2]Company_Code:1; ->COM_at_editMode; $_l_Row; $_t_VariableName; "COM_LBI_Items")
				
				If ($_l_event=On Data Change:K2:15)
					If (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CONTACTS:1]))  //Contacts
						If ($_l_Row>0)
							$_Ptr_KeyField:=COM_aptr_LBItemsSetup{8}
							$_ptr_ArrayFieldPointers:=COM_aptr_LBItemsSetup{2}
							$_l_KeyPosition:=Find in array:C230(COM_aptr_LBItemsSetup{2}->; COM_aptr_LBItemsSetup{8})
							If ($_l_KeyPosition>0)
								$_Ptr_ThisColumnArray:=COM_aptr_LBItemsSetup{3}->{$_l_KeyPosition}
								If ($_l_Row<=Size of array:C274($_Ptr_ThisColumnArray->))  //Error here corrected March 2004
									CO_t_RelatedContact:=$_Ptr_ThisColumnArray->{$_l_Row}
								Else 
									LB_l_RowNumber:=0
									CO_t_RelatedContact:=""
								End if 
							End if 
							
							
						End if 
						
						
					End if 
					
					vCT:=0
				End if 
		End case 
		
		//***********ends**********************************
End case 
ERR_MethodTrackerReturn("OBJ:Company_In,GEN_lb_ItemsArea"; $_t_oldMethodName)

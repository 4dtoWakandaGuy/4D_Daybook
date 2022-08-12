If (False:C215)
	//object Name: [ACTIONS]Action_In.oMultiRecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_LB_Autos;0)
	//ARRAY LONGINT(SD2_al_RelationRestS;0)
	//ARRAY LONGINT(SD2_al_RelationTablesS;0)
	//ARRAY LONGINT(SD2_al_RelationType;0)
	//ARRAY LONGINT(SD2_al_RelationTypesS;0)
	//ARRAY LONGINT(SD2_al_SelectableTables;0)
	//ARRAY TEXT(SD2_at_pop;0)
	//ARRAY TEXT(SD2_at_POP2;0)
	//ARRAY TEXT(SD2_at_RelationRest;0)
	//ARRAY TEXT(SD2_at_RelationTablesS;0)
	//ARRAY TEXT(SD2_at_RelationTypes;0)
	//ARRAY TEXT(SD2_at_RelationTypesS;0)
	//ARRAY TEXT(SD2_at_SelectableTables;0)
	C_LONGINT:C283($_l_CharacterPosition; $_l_event; $_l_FieldNumber; $_l_FoundAt; $_l_Index; $_l_Number; $_l_RelationTypeRow; $_l_Row; $_l_TableNumber; BMrClear; BmrModify)
	C_LONGINT:C283(SD2_l_MultiModify; SD2_l_SelectedMulti)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $_t_Text; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.oStats1"; Form event code:C388)
$_l_event:=Form event code:C388

RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
$_l_Row:=Self:C308->

Case of 
	: ($_l_event=On Clicked:K2:4)
		If ($_t_VariableName="SD2_at_RelationRest")
			EDIT ITEM:C870(Self:C308->)
		End if 
	: ($_l_event=On After Keystroke:K2:26)
		$_t_Text:=Get edited text:C655
		Case of 
			: ($_t_VariableName="SD2_at_RelationTypesS")
				$_l_FoundAt:=0
				For ($_l_Index; 1; Size of array:C274(SD2_at_RelationTypes))
					If (Position:C15($_t_Text; SD2_at_RelationTypes{$_l_Index})=1)
						$_l_FoundAt:=$_l_Index
						$_l_Index:=99999
					End if 
				End for 
				If ($_l_FoundAt=0)
					SD2_at_RelationTypesS{$_l_Row}:=Substring:C12($_t_Text; 1; Length:C16($_t_Text)-1)
				End if 
			: ($_t_VariableName="SD2_at_RelationTablesS")
				$_l_FoundAt:=0
				For ($_l_Index; 1; Size of array:C274(SD2_at_SelectableTables))
					If (Position:C15($_t_Text; SD2_at_SelectableTables{$_l_Index})=1)
						$_l_FoundAt:=$_l_Index
						$_l_Index:=99999
					End if 
				End for 
				If ($_l_FoundAt=0)
					SD2_at_RelationTablesS{$_l_Row}:=Substring:C12($_t_Text; 1; Length:C16($_t_Text)-1)
				End if 
			: ($_t_VariableName="SD2_at_RelationRest")
				$_l_Number:=Num:C11($_t_Text)
				If ($_l_Number=0)
					$_l_CharacterPosition:=Position:C15($_t_Text; "Unlimited")
					If ($_l_CharacterPosition>0)
						SD2_at_RelationRest{$_l_Row}:=Substring:C12("Unlimited"; 1; Length:C16($_t_Text))
					Else 
						SD2_at_RelationRest{$_l_Row}:=Substring:C12($_t_Text; 1; Length:C16($_t_Text)-1)
					End if 
				Else 
				End if 
		End case 
	: ($_l_event=On Data Change:K2:15)
		Case of 
				
			: (SD2_l_MultiModify=0)  //Button is modify
				
				If ($_l_Row>0)
					
					OBJECT SET TITLE:C194(BmrModify; "Edit")
					OBJECT SET VISIBLE:C603(*; "oMultiAdd@"; True:C214)
					SD2_l_MultiModify:=-2
				End if 
			: (SD2_l_MultiModify=1)  //Button is save
				If (False:C215)
					If (SD2_at_RelationTablesS{1}#"") & (SD2_at_RelationTypesS{1}#"")
						$_ptr_Table:=Get pointer:C304("["+SD2_at_RelationTablesS{1}+"]")
						
						SD2_al_RelationTablesS{1}:=Table:C252($_ptr_Table)
						$_l_RelationTypeRow:=Find in array:C230(SD2_at_RelationTypes; SD2_at_RelationTypesS{1})
						If ($_l_RelationTypeRow>0)
							SD2_al_RelationTypesS{1}:=SD2_al_RelationType{$_l_RelationTypeRow}
						Else 
							SD2_at_RelationTypesS{1}:=""
						End if 
						If (SD2_at_RelationRest{1}#"")
							If (SD2_at_RelationRest{1}="Unlimited")
								SD2_al_RelationRestS{1}:=0
							Else 
								SD2_al_RelationRestS{1}:=Num:C11(SD2_at_RelationRest{1})
							End if 
						End if 
						OBJECT SET TITLE:C194(BmrModify; "Modify")
						OBJECT SET TITLE:C194(BMrClear; "Clear")
						OBJECT SET VISIBLE:C603(*; "oMultiAdd@"; False:C215)
						SD2_l_MultiModify:=0
						LB_SetEnterable(->SD2_LB_Autos; False:C215; 1; "")
						LB_SetEnterable(->SD2_LB_Autos; False:C215; 2; "")
					Else 
						Gen_Alert("You must select a field and code, or clear")
					End if 
				End if 
			: (SD2_l_MultiModify=-1)  //Button is save(existing item)
				
			: (SD2_l_MultiModify=-2)
				//Ready to edit
		End case 
End case 
ERR_MethodTrackerReturn("OBJ:Action_In,SD2_LB_Autos"; $_t_oldMethodName)

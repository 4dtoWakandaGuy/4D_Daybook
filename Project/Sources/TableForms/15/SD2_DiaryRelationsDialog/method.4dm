If (False:C215)
	//Table Form Method Name: [USER]SD2_DiaryRelationsDialog
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/09/2010 12:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_DiaryRelations;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordClass;0)
	//ARRAY LONGINT(SD2_al_RelationshipFields;0)
	//ARRAY LONGINT(SD2_al_RelationshipIDS;0)
	//ARRAY LONGINT(SD2_al_RelationshipTables;0)
	//ARRAY LONGINT(SD2_al_RelationSubClass;0)
	//ARRAY TEXT(SD2_at_RelatedRecordCode;0)
	//ARRAY TEXT(SD2_at_RelatedRecordNames;0)
	//ARRAY TEXT(SD2_at_RelationshipCodes;0)
	//ARRAY TEXT(SD2_at_RelationShipnames;0)
	//ARRAY TEXT(SD2_at_RelationShipnamesOLD;0)
	//ARRAY TEXT(SD2_at_RelatedRecordNames;0)
	C_BOOLEAN:C305($_bo_LookUp; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_Index; SD2_l_BUT1; SD2_l_But2; SD2_l_BUT3; SD2_l_BUT4; SD2_l_BUT5; SD2_l_BUT6; SD2_l_BUT7; SD2_l_BUT8; SD2_l_BUT9)
	C_POINTER:C301($_ptr_Field; $_ptr_table)
	C_TEXT:C284($_t_oldMethodName; SD2_t_COL1; SD2_t_COL2; SD2_t_COL3; SD2_t_COL4; SD2_t_COL5; SD2_t_COL6; SD2_t_COL7; SD2_t_COL8; SD2_t_COL9; SD2_t_HED1)
	C_TEXT:C284(SD2_t_HED2; SD2_t_HED3; SD2_t_HED4; SD2_t_HED5; SD2_t_HED6; SD2_t_HED7; SD2_t_HED8; SD2_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD2_DiaryRelationsDialog"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(SD2_at_RelatedRecordNames; Size of array:C274(SD2_at_RelatedRecordCode))
		ARRAY TEXT:C222(SD2_at_RelationShipnamesOLD; 0)
		ARRAY LONGINT:C221(SD2_al_RelatedRecordClass; Size of array:C274(SD2_at_RelatedRecordCode))
		ARRAY LONGINT:C221(SD2_al_RelationSubClass; Size of array:C274(SD2_at_RelatedRecordCode))
		COPY ARRAY:C226(SD2_at_RelationShipnames; SD2_at_RelationShipnamesOLD)  // This is needed so we can detect changes from the pop-up
		For ($_l_Index; 1; Size of array:C274(SD2_at_RelationshipCodes))
			$_bo_LookUp:=False:C215
			If (SD2_at_RelatedRecordCode{$_l_Index}#"")
				$_ptr_table:=Table:C252(SD2_al_RelationshipTables{$_l_Index})
				$_ptr_Field:=Field:C253(SD2_al_RelationshipTables{$_l_Index}; SD2_al_RelationshipFields{$_l_Index})
				If (Type:C295($_ptr_Field->)=Is alpha field:K8:1)
					QUERY:C277($_ptr_table->; $_ptr_Field->=SD2_at_RelationshipCodes{$_l_Index})
					$_bo_LookUp:=True:C214
				Else 
					If (SD2_al_RelationshipIDS{$_l_Index}#0)
						QUERY:C277($_ptr_table->; $_ptr_Field->=SD2_al_RelationshipIDS{$_l_Index})
						$_bo_LookUp:=True:C214
					End if 
				End if 
			Else 
				If (SD2_al_RelationshipIDS{$_l_Index}#0)
					$_ptr_table:=Table:C252(SD2_al_RelationshipTables{$_l_Index})
					$_ptr_Field:=Field:C253(SD2_al_RelationshipTables{$_l_Index}; SD2_al_RelationshipFields{$_l_Index})
					If (Not:C34(Type:C295($_ptr_Field->)=Is alpha field:K8:1))
						QUERY:C277($_ptr_table->; $_ptr_Field->=SD2_al_RelationshipIDS{$_l_Index})
						$_bo_LookUp:=True:C214
					End if 
				Else 
					$_ptr_table:=Table:C252(SD2_al_RelationshipTables{$_l_Index})
					REDUCE SELECTION:C351($_ptr_table->; 0)
				End if 
				
			End if 
			If ($_bo_LookUp)  // we are pointing at a record
				If (Records in selection:C76($_ptr_table->)>0)
					SD2_at_RelatedRecordNames{$_l_Index}:=SD2_GetRecordName($_ptr_table)
					
				End if 
			End if 
		End for 
		LB_SetupListbox(->SD2_lb_DiaryRelations; "SD2_t"; "SD2_L"; 1; ->SD2_at_RelationShipnames; ->SD2_at_RelationshipCodes; ->SD2_at_RelatedRecordNames; ->SD2_al_RelationshipTables; ->SD2_al_RelationshipFields; ->SD2_al_RelationshipIDS)
		
		
		LB_SetColumnHeaders(->SD2_lb_DiaryRelations; "SD2_L"; 1; "Linked To"; "Record ID"; "Name"; ""; ""; "")
		
		LB_SetColumnWidths(->SD2_lb_DiaryRelations; "SD2_t"; 1; 80; 95; 355; 0; 0; 0)
		
		LB_SetEnterable(->SD2_lb_DiaryRelations; False:C215; 0)
		
		LB_SetScroll(->SD2_lb_DiaryRelations; -3; -2)
		LB_StyleSettings(->SD2_lb_DiaryRelations; "Black"; 9; "SD2_t"; ->[DIARY:12])
End case 
ERR_MethodTrackerReturn("FM [USER].SD2_DiaryRelationsDialog"; $_t_oldMethodName)

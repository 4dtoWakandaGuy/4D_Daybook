If (False:C215)
	//object Name: [EW_ExportProjects]Entry.oDE3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2010 09:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(EW_lb_RelatedData;0)
	//ARRAY BOOLEAN(EW_lb_StepDetails;0)
	//ARRAY INTEGER(EW_ai_StepDetailOrder;0)
	//ARRAY LONGINT(EW_al_DBFieldNumbers;0)
	//ARRAY LONGINT(EW_al_DBTableNumbers;0)
	//ARRAY LONGINT(EW_al_ExportFieldNumbers;0)
	//ARRAY LONGINT(EW_al_StepDetailRecordnos;0)
	//ARRAY TEXT(EW_at_DBFieldNames;0)
	//ARRAY TEXT(EW_at_ExportActions;0)
	//ARRAY TEXT(EW_at_ExportFields;0)
	//ARRAY TEXT(EW_at_OutputLabels;0)
	C_BOOLEAN:C305(EW_bo_ModifiedStep)
	C_LONGINT:C283($_l_DestinationRow; $_l_FormEvent; $_l_SourceColumn; $_l_SourceRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.oDE3"; Form event code:C388)
// eALFieldList

$_l_FormEvent:=Form event code:C388
Case of 
		
		// : ($_l_FormEvent=-5)  ` a row was dragged
	: ($_l_FormEvent=On Double Clicked:K2:5)  // double-click
		LISTBOX GET CELL POSITION:C971(EW_lb_RelatedData; $_l_SourceColumn; $_l_SourceRow)
		
		//$_l_SourceRow:=LB_GetLine (->EW_lb_RelatedData)
		//    EW_DropEvent (Self->)
		$_l_DestinationRow:=Size of array:C274(EW_at_ExportFields)+1
		Case of 
			: ([EW_ExportSteps:118]CatalogueExport:9=True:C214) & ([EW_ExportTables:120]Order:4=1)
				EW_InsertElements("EW_lb_StepDetails"; "Field Data"; Table:C252(->[PRODUCTS:9]); EW_al_DBFieldNumbers{$_l_SourceRow}; 0; EW_at_DBFieldNames{$_l_SourceRow}; 0; 0; $_l_DestinationRow)
				
			: ([EW_ExportTables:120]SubFieldNumber:7>0)  // it is for a subtable
				EW_InsertElements("EW_lb_StepDetails"; "Field Data"; EW_al_DBTableNumbers{$_l_SourceRow}; [EW_ExportTables:120]SubFieldNumber:7; EW_al_DBFieldNumbers{$_l_SourceRow}; EW_at_DBFieldNames{$_l_SourceRow}; 0; 0; $_l_DestinationRow)
			Else 
				EW_InsertElements("EW_lb_StepDetails"; "Field Data"; EW_al_DBTableNumbers{$_l_SourceRow}; EW_al_DBFieldNumbers{$_l_SourceRow}; 0; EW_at_DBFieldNames{$_l_SourceRow}; 0; 0; $_l_DestinationRow)
		End case 
		EW_bo_ModifiedStep:=True:C214
		SORT ARRAY:C229(EW_ai_StepDetailOrder; EW_at_ExportFields; EW_al_ExportFieldNumbers; EW_at_ExportActions; EW_al_StepDetailRecordnos; EW_at_OutputLabels)
		EW_LBI_Setup(->EW_lb_StepDetails; "EWDetails"; 3; ->EW_at_ExportFields; ->EW_at_OutputLabels; ->EW_at_ExportActions; ->EW_al_ExportFieldNumbers; ->EW_al_StepDetailRecordnos; ->EW_ai_StepDetailOrder)
		//AL_UpdateArrays (eALStepDetails;-1)
End case 
ERR_MethodTrackerReturn("OBJ:Entry,EW_lb_FieldList"; $_t_oldMethodName)

If (False:C215)
	//object Name: [EW_ExportProjects]Entry.EXScrollable Area1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(EW_lb_StepDetails;0)
	//ARRAY INTEGER(EW_ai_StepDetailOrder;0)
	//ARRAY LONGINT(EW_al_ExportFieldNumbers;0)
	//ARRAY LONGINT(EW_al_NumericFieldNums;0)
	//ARRAY LONGINT(EW_al_NumericFieldTablenums;0)
	//ARRAY LONGINT(EW_al_StepDetailRecordnos;0)
	//ARRAY TEXT(EW_at_BKFieldNames;0)
	//ARRAY TEXT(EW_at_ExportActions;0)
	//ARRAY TEXT(EW_at_ExportFields;0)
	//ARRAY TEXT(EW_at_NumericFields;0)
	//ARRAY TEXT(EW_at_OutputLabels;0)
	//ARRAY TEXT(EW_at_ScriptDataExportCodes;0)
	//ARRAY TEXT(EW_at_ScriptDataExportNames;0)
	C_BOOLEAN:C305($_bo_Added; EW_bo_Modified; EW_bo_ModifiedStep)
	C_LONGINT:C283($_l_WindowReference)
	C_REAL:C285($_l_CurrentFieldRow; EW_r_DiscountPercentage; EW_r_DisplayedDiscountPercent; EW_r_MarkupPercentage; EW_r_PricePercentage; EW_r_StartNum)
	C_TEXT:C284($_t_ExportScript; $_t_ExportText; $_t_oldMethodName; $_t_PricingAction; EW_t_PricingAction)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.EXScrollable Area1"; Form event code:C388)
$_bo_Added:=False:C215
Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		Case of 
			: (Self:C308->{Self:C308->}="calculation")  // calculation
				Case of 
					: (Size of array:C274(EW_at_NumericFields)=0)
						//          ALERT("There are no numeric fields in this table.")
						Gen_Alert("There are no numeric fields in this table.")
					Else 
						//          iFieldNo:=0
						EW_r_DiscountPercentage:=0
						EW_r_MarkupPercentage:=0
						EW_r_PricePercentage:=0
						EW_t_PricingAction:=""
						EW_bo_Modified:=False:C215
						$_l_WindowReference:=Open form window:C675([EW_ExportProjects:117]; "Calculation"; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4; *)
						DIALOG:C40([EW_ExportProjects:117]; "Calculation")
						CLOSE WINDOW:C154
						If (OK=1) & (EW_bo_Modified)
							If ((EW_t_PricingAction="discount") | (EW_t_PricingAction="markup") | (EW_t_PricingAction="percentage"))
								$_t_PricingAction:=EW_t_PricingAction+" "+String:C10(EW_r_DisplayedDiscountPercent)+"%"
							Else   // must be record number
								$_t_PricingAction:=EW_t_PricingAction+" ("+String:C10(EW_r_StartNum)+")"
							End if 
							//           EW_InsertElements ($DestArea;$_l_SourceRow;$_l_DestinationRow;
							//"Calculation";$_t_PricingAction;iFieldNo)
							$_l_CurrentFieldRow:=EW_at_NumericFields
							If ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
								$_t_ExportScript:=EW_at_BKFieldNames{EW_at_BKFieldNames}
							Else 
								$_t_ExportScript:=""
							End if 
							EW_InsertElements("EW_lb_StepDetails"; "Calculation"; EW_al_NumericFieldTablenums{$_l_CurrentFieldRow}; EW_al_NumericFieldNums{$_l_CurrentFieldRow}; 0; $_t_PricingAction; 0; 0; Size of array:C274(EW_at_ExportFields)+1; $_t_ExportScript)
							$_bo_Added:=True:C214
						End if 
				End case   // no numeric fields
				
			: (Self:C308->{Self:C308->}="static text")  // static text
				$_t_ExportText:=""
				If ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
					$_l_WindowReference:=Open form window:C675([EW_ExportProjects:117]; "StaticTextBK"; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4; *)
					DIALOG:C40([EW_ExportProjects:117]; "StaticTextBK")
					CLOSE WINDOW:C154
				Else 
					$_t_ExportText:=Request:C163("Text to export:")
				End if 
				If ((OK=1) & ($_t_ExportText#""))
					//         EW_InsertElements ($DestArea;$_l_SourceRow;$_l_DestinationRow;"Static text";$_t_PricingAction)
					If ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
						$_t_ExportScript:=EW_at_BKFieldNames{EW_at_BKFieldNames}
					Else 
						$_t_ExportScript:=""
					End if 
					EW_InsertElements("EW_lb_StepDetails"; "Static text"; 0; 0; 0; $_t_ExportText; 0; 0; Size of array:C274(EW_at_ExportFields)+1; $_t_ExportScript)
					EW_bo_ModifiedStep:=True:C214
					$_bo_Added:=True:C214
				End if 
				
			: (Self:C308->{Self:C308->}="macro")  // Macro
				If (Size of array:C274(EW_at_ScriptDataExportNames)<1)
					//         ALERT("There are no Data Export macros set up in the database.")
					Gen_Alert("There are no Data Export macros set up in the database.")
				Else 
					$_l_WindowReference:=Open form window:C675([EW_ExportProjects:117]; "MacroSelect"; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4; *)
					DIALOG:C40([EW_ExportProjects:117]; "MacroSelect")
					CLOSE WINDOW:C154
					If (OK=1)
						$_t_ExportScript:=EW_at_ScriptDataExportCodes{EW_at_ScriptDataExportNames}
						$_t_PricingAction:=EW_at_ScriptDataExportNames{EW_at_ScriptDataExportNames}
						EW_InsertElements("EW_lb_StepDetails"; "Macro"; 0; 0; 0; Substring:C12($_t_PricingAction; 1; 31); 0; 0; Size of array:C274(EW_at_ExportFields)+1; $_t_ExportScript)
						$_bo_Added:=True:C214
					End if 
				End if 
		End case 
		
		If ($_bo_Added)
			EW_LBI_Setup(->EW_lb_StepDetails; "EWDetails"; 3; ->EW_at_ExportFields; ->EW_at_OutputLabels; ->EW_at_ExportActions; ->EW_al_ExportFieldNumbers; ->EW_al_StepDetailRecordnos; ->EW_ai_StepDetailOrder)
			
			UNLOAD RECORD:C212([EW_StepActions:119])
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.EXScrollable Area1"; $_t_oldMethodName)

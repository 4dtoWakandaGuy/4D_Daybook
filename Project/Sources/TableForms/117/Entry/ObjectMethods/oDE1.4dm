If (False:C215)
	//object Name: [EW_ExportProjects]Entry.oDE1
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
	//ARRAY BOOLEAN(EW_lb_StepDetails;0)
	//ARRAY INTEGER(EW_ai_StepDetailOrder;0)
	//ARRAY LONGINT(EW_al_ExportFieldNumbers;0)
	//ARRAY LONGINT(EW_al_StepDetailRecordnos;0)
	//ARRAY TEXT(EW_at_ExportActions;0)
	//ARRAY TEXT(EW_at_ExportFields;0)
	C_BOOLEAN:C305(EW_bo_Modified; EW_bo_ModifiedStep)
	C_LONGINT:C283($_l_Charposition; $_l_FormEvent; $_l_Index; $_l_SourceRow; $_l_WIndowReference; $_l_Column; EW_l_DIsplayFieldNo)
	C_REAL:C285(EW_r_DiscountPercentage; EW_r_DisplayedDiscountPercent; EW_r_MarkupPercentage; EW_r_StartNum)
	C_TEXT:C284($_t_oldMethodName; $_t_PricingAction; $_t_SearchText; EW_t_PricingAction)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.oDE1"; Form event code:C388)
// eALStepDetails

$_l_FormEvent:=Form event code:C388
LISTBOX GET CELL POSITION:C971(EW_lb_StepDetails; $_l_Column; $_l_SourceRow)

//$_l_SourceRow:=LB_GetLine (->EW_lb_StepDetails)
CREATE SET:C116([EW_StepActions:119]; "use")
Case of 
	: ($_l_FormEvent=-5)  // a row was dragged
		For ($_l_Index; 1; Size of array:C274(EW_ai_StepDetailOrder))
			EW_ai_StepDetailOrder{$_l_Index}:=$_l_Index
		End for 
		//AL_UpdateArrays (eALStepDetails;-1)
		
	: ($_l_FormEvent=On Double Clicked:K2:5)  // double-click
		//   $_l_SourceRow:=AL_GetLine (eALStepDetails)
		Case of 
			: (EW_at_ExportActions{$_l_SourceRow}="Static text")
				$_t_SearchText:=EW_at_ExportFields{$_l_SourceRow}
				If ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
					$_l_WIndowReference:=Open form window:C675([EW_ExportProjects:117]; "StaticTextBK"; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4; *)
					DIALOG:C40([EW_ExportProjects:117]; "StaticTextBK")
					CLOSE WINDOW:C154
					
				Else 
					$_t_SearchText:=Request:C163("Text to export:"; EW_at_ExportFields{$_l_SourceRow})
				End if 
				If ((OK=1) & ($_t_SearchText#EW_at_ExportFields{$_l_SourceRow}))
					EW_at_ExportFields{$_l_SourceRow}:=$_t_SearchText
					QUERY:C277([EW_StepActions:119]; [EW_StepActions:119]RecordNumber:2=EW_al_StepDetailRecordnos{$_l_SourceRow})
					[EW_StepActions:119]WhatDataToExport:4:=$_t_SearchText
					SAVE RECORD:C53([EW_StepActions:119])
					USE SET:C118("use")
				End if 
				
			: (EW_at_ExportActions{$_l_SourceRow}="Calculation")
				EW_l_DIsplayFieldNo:=EW_al_ExportFieldNumbers{$_l_SourceRow}
				$_l_Charposition:=Position:C15(" "; EW_at_ExportFields{$_l_SourceRow})
				EW_t_PricingAction:=Substring:C12(EW_at_ExportFields{$_l_SourceRow}; 1; $_l_Charposition-1)
				QUERY:C277([EW_StepActions:119]; [EW_StepActions:119]RecordNumber:2=EW_al_StepDetailRecordnos{$_l_SourceRow})
				Case of 
					: (EW_t_PricingAction="markup")
						EW_r_MarkupPercentage:=Num:C11(Substring:C12(EW_at_ExportFields{$_l_SourceRow}; $_l_Charposition+1))
						EW_r_DiscountPercentage:=0
						EW_r_StartNum:=0
						
					: (EW_t_PricingAction="discount")
						EW_r_DiscountPercentage:=Num:C11(Substring:C12(EW_at_ExportFields{$_l_SourceRow}; $_l_Charposition+1))
						EW_r_MarkupPercentage:=0
						EW_r_StartNum:=0
						
					: (EW_t_PricingAction="recordno.")
						EW_r_StartNum:=Num:C11(Substring:C12(EW_at_ExportFields{$_l_SourceRow}; $_l_Charposition+1))
						EW_r_MarkupPercentage:=0
						EW_r_DiscountPercentage:=0
				End case 
				EW_bo_Modified:=False:C215
				$_l_WIndowReference:=Open form window:C675([EW_ExportProjects:117]; "Calculation"; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4; *)
				DIALOG:C40([EW_ExportProjects:117]; "Calculation")
				CLOSE WINDOW:C154
				If (OK=1) & (EW_bo_Modified)
					$_t_PricingAction:=EW_t_PricingAction+" "+String:C10(EW_r_DisplayedDiscountPercent)
					If ((EW_t_PricingAction="discount") | (EW_t_PricingAction="markup"))
						$_t_PricingAction:=$_t_PricingAction+"%"
					End if 
					EW_at_ExportFields{$_l_SourceRow}:=$_t_PricingAction
					[EW_StepActions:119]WhatDataToExport:4:=$_t_PricingAction
					SAVE RECORD:C53([EW_StepActions:119])
				End if 
				//    End case   ` no numeric fields
				USE SET:C118("use")
				
			: (EW_at_ExportActions{$_l_SourceRow}="Macro")
				
				USE SET:C118("use")
				
			Else   // it's a field
				
				
		End case 
		
		
End case 
EW_bo_ModifiedStep:=True:C214
ERR_MethodTrackerReturn("OBJ:Entry,EW_lb_StepDetails"; $_t_oldMethodName)
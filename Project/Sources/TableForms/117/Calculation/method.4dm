If (False:C215)
	//Table Form Method Name: [EW_ExportProjects]Calculation
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
	//ARRAY LONGINT(EW_al_NumericFieldNums;0)
	//ARRAY TEXT(EW_at_BKFieldNames;0)
	//ARRAY TEXT(EW_at_NumericFields;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(EW_l_DIsplayFieldNo; r1; r2; r3; r4)
	C_REAL:C285(EW_r_DisplayedDiscountPercent)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [EW_ExportProjects].Calculation"; Form event code:C388)
// Export Wizard Calculation
// 16/07/02 pb



Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[EW_ExportProjects:117]); "Calculation")
		
		Case of 
			: ([EW_StepActions:119]WhatDataToExport:4="discount@")
				r1:=1
				EW_r_DisplayedDiscountPercent:=[EW_StepActions:119]CalculationPercent:8
				EW_at_NumericFields:=Find in array:C230(EW_al_NumericFieldNums; EW_l_DIsplayFieldNo)
				
			: ([EW_StepActions:119]WhatDataToExport:4="Markup@")
				r2:=1
				EW_r_DisplayedDiscountPercent:=[EW_StepActions:119]CalculationPercent:8
				EW_at_NumericFields:=Find in array:C230(EW_al_NumericFieldNums; EW_l_DIsplayFieldNo)
				
			: ([EW_StepActions:119]WhatDataToExport:4="Percent@")
				r4:=1
				EW_r_DisplayedDiscountPercent:=[EW_StepActions:119]CalculationPercent:8
				EW_at_NumericFields:=Find in array:C230(EW_al_NumericFieldNums; EW_l_DIsplayFieldNo)
				
			: ([EW_StepActions:119]WhatDataToExport:4="Record No.@")
				r3:=1
			Else   // it must be a new record
				r1:=1
		End case 
		If ([EW_ExportSteps:118]BKModelName:8#"")  // 11/11/02
			EW_BKFieldMapArrays(0; [EW_ExportSteps:118]BKModelName:8; "BK")
			OBJECT SET VISIBLE:C603(*; "BK@"; True:C214)
			If ([EW_StepActions:119]OutputLabel:13#"")
				EW_at_BKFieldNames:=Find in array:C230(EW_at_BKFieldNames; [EW_StepActions:119]OutputLabel:13)
			End if 
		Else 
			OBJECT SET VISIBLE:C603(*; "BK@"; False:C215)
		End if 
		EW_CalcButtonsSet
		INT_SetDialog
		
		//    aiFldNums:=Find in array(aiFldNums;[EW_StepActions]FieldNumber)
		
		//  End if
End case 
ERR_MethodTrackerReturn("FM [EW_ExportProjects].Calculation"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_ExportNowSteps
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($_ptr_Field)
	C_REAL:C285($_l_CharacterPosition; $_r_Value; lRecordCount)
	C_TEXT:C284($_t_oldMethodName; $0; EW_t_ExportValue; s3FieldDelimiter)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_ExportNowSteps")
// EW_ExportNowSteps
// This method handles the exporting of the various types of data
// 02/08/02 pb

Case of 
	: ([EW_StepActions:119]Action:7="Field Data")
		If ([EW_ExportTables:120]SubFieldNumber:7>0)  // it is subfield data
			$0:=EW_ExportSubfields
		Else 
			$_ptr_Field:=Field:C253([EW_StepActions:119]TableNumber:9; [EW_StepActions:119]FieldNumber:6)
			//     $0:=FieldDataToText ($_ptr_Field)
			$0:=Replace string:C233(FieldDataToText($_ptr_Field); s3FieldDelimiter; [EW_ExportProjects:117]DelimiterReplaceChar:16)
			Case of   // 16/09/03 pb
				: ([EW_StepActions:119]TableNumber:9=2) & ([EW_StepActions:119]FieldNumber:6=Field:C253(->[COMPANIES:2]Address_Line_one:3))
					Case of 
						: ($0#"") & ([COMPANIES:2]Address_Line_two:4#"")
							$0:=$0+"^r"+[COMPANIES:2]Address_Line_two:4
						: ($0="") & ([COMPANIES:2]Address_Line_two:4#"")
							$0:=[COMPANIES:2]Address_Line_two:4
					End case 
					
				: ([EW_StepActions:119]TableNumber:9=2) & ([EW_StepActions:119]FieldNumber:6=Field:C253(->[COMPANIES:2]Invoice_Address_Line_One:18))
					Case of 
						: ($0#"") & ([COMPANIES:2]Invoice_Address_Line_Two:19#"")
							$0:=$0+"^r"+[COMPANIES:2]Invoice_Address_Line_Two:19
						: ($0="") & ([COMPANIES:2]Invoice_Address_Line_Two:19#"")
							$0:=[COMPANIES:2]Address_Line_two:4
					End case 
			End case 
		End if   // subfield
		
	: ([EW_StepActions:119]Action:7="Static text")
		$0:=[EW_StepActions:119]WhatDataToExport:4
		
	: ([EW_StepActions:119]Action:7="Calculation")
		$_l_CharacterPosition:=Position:C15("("; [EW_StepActions:119]WhatDataToExport:4)
		If ($_l_CharacterPosition<1)
			$_l_CharacterPosition:=Position:C15(" "; [EW_StepActions:119]WhatDataToExport:4)
		End if 
		$_r_Value:=Num:C11(Substring:C12([EW_StepActions:119]WhatDataToExport:4; $_l_CharacterPosition+1))
		$_ptr_Field:=Field:C253([EW_StepActions:119]TableNumber:9; [EW_StepActions:119]FieldNumber:6)
		Case of 
			: ([EW_StepActions:119]WhatDataToExport:4="discount@")
				//    $_ptr_Field:=Field([EW_ExportSteps]BaseTablenumber;[EW_StepActions]FieldNumber)
				$0:=String:C10(Round:C94($_ptr_Field->-(($_r_Value/100)*$_ptr_Field->); 2))
			: ([EW_StepActions:119]WhatDataToExport:4="markup@")
				//      $_ptr_Field:=Field([EW_ExportSteps]BaseTablenumber;[EW_StepActions]FieldNumber)
				$0:=String:C10(Round:C94($_ptr_Field->+(($_r_Value/100)*$_ptr_Field->); 2))
			: ([EW_StepActions:119]WhatDataToExport:4="percentage@")
				//      $_ptr_Field:=Field([EW_ExportSteps]BaseTablenumber;[EW_StepActions]FieldNumber)
				$0:=String:C10(Round:C94($_ptr_Field->*($_r_Value/100); 2))
			: ([EW_StepActions:119]WhatDataToExport:4="Record No.@")
				If (lRecordCount=-1)
					lRecordCount:=$_r_Value
				Else 
					lRecordCount:=lRecordCount+1
				End if 
				$0:=String:C10(lRecordCount)
		End case 
		
	: ([EW_StepActions:119]Action:7="Macro")
		EW_t_ExportValue:=""
		Macro_AccType([EW_StepActions:119]MacroCode:14; True:C214)  // Macro must fill the variable EW_t_ExportValue
		ON ERR CALL:C155("EW_OnErr")  // ESSENTIAL!
		$0:=EW_t_ExportValue
End case 

// Check that there are no disallowed characters within the text
//$0:=Replace string($0;s3FieldDelimiter;[EW_ExportProjects]DelimiterReplaceChar)
ERR_MethodTrackerReturn("EW_ExportNowSteps"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_FieldHeadings2
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
	C_BOOLEAN:C305($_bo_AddBlankSubtableRows; EW_bo_HeadingsDone; yCatalogueExport)
	C_LONGINT:C283($_l_ActionsIndex; $_l_LevelsIndex; EW_FamilyLevels)
	C_POINTER:C301(ParentIDfieldPtr)
	C_TEXT:C284($_t_oldMethodName; EW_t_ModuleName; s2RecordDelimiter; s3FieldDelimiter; tBlankSubtableRows; tExportText; tFamilyHeadings; tHeadings; tRepeatData)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_FieldHeadings2")
// EW_fieldHeadings2
// 22/08/02 pb


//$0:=""

If (Records in selection:C76([EW_StepActions:119])>0) & (EW_bo_HeadingsDone=False:C215)
	ORDER BY:C49([EW_StepActions:119]; [EW_StepActions:119]ActionOrder:3)
	FIRST RECORD:C50([EW_StepActions:119])
	// $yAddBlankRows:=True
	$_bo_AddBlankSubtableRows:=False:C215
	For ($_l_ActionsIndex; 1; Records in selection:C76([EW_StepActions:119]))
		Case of 
			: (($_l_ActionsIndex=1) & ([EW_ExportTables:120]SubFieldNumber:7>0))  //it is subtable data
				// so the parent record's ID needs to be included
				EW_GetSubfieldData([EW_ExportSteps:118]BaseTablenumber:3; [EW_StepActions:119]FieldNumber:6; [EW_StepActions:119]SubfieldNumber:10)
				tHeadings:=tHeadings+"("+Table name:C256([EW_ExportTables:120]TableNumber:3)+")"+Field name:C257(ParentIDfieldPtr)+s3FieldDelimiter
				
			: (($_l_ActionsIndex=1) & (yCatalogueExport))  //it is export by catalogue
				For ($_l_LevelsIndex; 1; EW_FamilyLevels)
					tHeadings:=tHeadings+"Catalogue Level "+String:C10(EW_FamilyLevels)+s3FieldDelimiter
				End for 
				
		End case 
		Case of 
			: ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce") & (EW_t_ModuleName="itm") & ($_l_ActionsIndex=1) & ([EW_ExportProjects:117]BKDataModel:35#"")  // 14/01/03 pb
				tHeadings:=tHeadings+EW_FindFieldName("[C01,"+[EW_ExportProjects:117]BKDataModel:35+"]")+Char:C90(9)+EW_FindFieldName("[StActive]")+Char:C90(9)+tFamilyHeadings+EW_FindFieldName("["+[EW_StepActions:119]OutputLabel:13+"]")  // L01 is Family 1
			: ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce") & (EW_t_ModuleName="itm") & ($_l_ActionsIndex=1)  // 14/01/03 pb
				tHeadings:=tHeadings+EW_FindFieldName("[C01]")+Char:C90(9)+EW_FindFieldName("[StActive]")+Char:C90(9)+tFamilyHeadings+EW_FindFieldName("["+[EW_StepActions:119]OutputLabel:13+"]")  // L01 is Family 1
			: ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce") & (EW_t_ModuleName="cus") & ($_l_ActionsIndex=1)  // 14/01/03 pb
				tHeadings:=tHeadings+EW_FindFieldName("[CusCode]")+Char:C90(9)+EW_FindFieldName("["+[EW_StepActions:119]OutputLabel:13+"]")
				//      tHeadings:=tHeadings+"[CusCode]"
			: ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")  // 14/01/03 pb
				tHeadings:=tHeadings+EW_FindFieldName("["+[EW_StepActions:119]OutputLabel:13+"]")
			Else 
				tHeadings:=tHeadings+[EW_StepActions:119]OutputLabel:13
		End case 
		tHeadings:=tHeadings+s3FieldDelimiter
		//    If ($yAddBlankRows=True)
		If ([EW_ExportSteps:118]Order:2=1)  // it is the base table
			Case of 
				: ([EW_ExportProjects:117]IncludeParentRecordData:13=False:C215) & ([EW_ExportProjects:117]ExportToSeparatefiles:14=False:C215)
					tRepeatData:=tRepeatData+s3FieldDelimiter
					//       : ([EW_ExportProjects]IncludeParentRecordData=True) & ([EW_ExportProjects
					//        tRepeatData:=tRepeatData+[EW_StepActions]OutputLabel+s3FieldDelimiter
			End case 
		End if 
		If ($_bo_AddBlankSubtableRows)
			tBlankSubtableRows:=tBlankSubtableRows+s3FieldDelimiter
		End if 
		NEXT RECORD:C51([EW_StepActions:119])
	End for 
	If ([EW_ExportTables:120]Order:4=1) & (Records in selection:C76([EW_ExportTables:120])>1) & ([EW_ExportProjects:117]IncludeParentRecordData:13=True:C214)
		For ($_l_LevelsIndex; 1; Records in selection:C76([EW_ExportTables:120])-1)
			NEXT RECORD:C51([EW_ExportTables:120])
			QUERY:C277([EW_StepActions:119]; [EW_StepActions:119]StepTableRecordNumber:1=[EW_ExportTables:120]RecordNumber:2)
			ORDER BY:C49([EW_StepActions:119]; [EW_StepActions:119]ActionOrder:3)
			EW_FieldHeadings2
		End for 
		FIRST RECORD:C50([EW_ExportTables:120])
		QUERY:C277([EW_StepActions:119]; [EW_StepActions:119]StepTableRecordNumber:1=[EW_ExportTables:120]RecordNumber:2)
		ORDER BY:C49([EW_StepActions:119]; [EW_StepActions:119]ActionOrder:3)
	End if 
	EW_bo_HeadingsDone:=True:C214
	tExportText:=tExportText+tHeadings+s2RecordDelimiter
	
End if 
ERR_MethodTrackerReturn("EW_FieldHeadings2"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_ExportNowTables
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(EW_bo_HeadingsDone; yCatalogueExport)
	C_LONGINT:C283($_l_LastrunDateTimeStamp; lDatetime)
	C_POINTER:C301($_ptr_DataField; $_ptr_Field; $_ptr_ParentTable; $_ptr_Table)
	C_REAL:C285(EW_iIncrement; EW_irecordcount; EW_iThermcount)
	C_TEXT:C284($_t_DocumentPath2; $_t_oldMethodName; $_t_ParentSetName; $_t_SetName; tErrorMsg; tExportText; tFolderPath; tTableName)
	C_TIME:C306(Doc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_ExportNowTables")
// EW-ExportNowTables
// 26/11/02 pb

$_ptr_Table:=Table:C252([EW_ExportTables:120]TableNumber:3)
EW_bo_HeadingsDone:=False:C215  // 03/03/03
// first we need to create a set of records that are being exported from this tabl
// in case there is a related export
yCatalogueExport:=[EW_ExportSteps:118]CatalogueExport:9
Case of 
	: ([EW_ExportTables:120]Order:4=1)  // it is the base table export
		If (yCatalogueExport)
			$_ptr_Table:=->[CATALOGUE:108]
		End if 
		Case of 
			: (([EW_ExportProjects:117]Exportformat:7="daybook ecommerce") & ([EW_ExportTables:120]TableNumber:3=Table:C252(->[PRODUCTS:9])))  // export by catalogue
				READ WRITE:C146([Catalogue_ProductLink:109])
				If ([EW_ExportProjects:117]BKCatalogueID:37=0)  // All Catalogues
					ALL RECORDS:C47([Catalogue_ProductLink:109])
				Else 
					QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=[EW_ExportProjects:117]BKCatalogueID:37)
				End if 
				If (lDatetime>0)  // 25/11/03 pb
					//   QUERY SELECTION([Catalogue_ProductLink];[Catalogue_ProductLink]UpdatedInBK=Fa
					QUERY SELECTION:C341([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]TimeDateStamp:8>lDatetime)
				End if 
				$_ptr_Table:=->[Catalogue_ProductLink:109]  // 25/11/03 pb
				CREATE EMPTY SET:C140([Catalogue_ProductLink:109]; "deletes")
				
			: ([EW_ExportSteps:118]WhatDataToExport:4="All records in table")
				ALL RECORDS:C47($_ptr_Table->)
				
			: ([EW_ExportSteps:118]WhatDataToExport:4="Current selection")
				EW_CurrentSelection($_ptr_Table)
				
			: ([EW_ExportSteps:118]WhatDataToExport:4="Select by Macro")
				Macro_AccType([EW_ExportSteps:118]MacroCode:7; True:C214)
				ON ERR CALL:C155("EW_OnErr")  // ESSENTIAL!
				
			: ([EW_ExportSteps:118]WhatDataToExport:4="Saved Set")
				//     ALERT("Select by saved set is not currently working")
				Gen_Alert("Select by saved set is not currently working.")
				REDUCE SELECTION:C351($_ptr_Table->; 0)
				
			: ([EW_ExportSteps:118]WhatDataToExport:4="Modified since last export")  // 9/11/02 pb
				If ([EW_ExportProjects:117]LastRunDate:28=!00-00-00!)
					ALL RECORDS:C47($_ptr_Table->)
				Else 
					$_ptr_DataField:=EW_DateFieldPointer($_ptr_Table)
					$_l_LastrunDateTimeStamp:=GEN_TimeDateStamp([EW_ExportProjects:117]LastRunDate:28; [EW_ExportProjects:117]LastRunTime:29)
					QUERY:C277($_ptr_Table->; $_ptr_DataField->>$_l_LastrunDateTimeStamp)
				End if 
				
		End case 
		//      CREATE SET(pTablePtr->;"BaseTableRecords")
		$_t_SetName:="Set"+String:C10([EW_ExportTables:120]TableNumber:3)
		CREATE SET:C116($_ptr_Table->; $_t_SetName)
		
	: ([EW_ExportTables:120]SubFieldNumber:7>0)
		// different treatment ...
		//TRACE
	Else   // it is a related table
		// we need to create a set containing this export's records
		// and find the records to export for this table
		$_t_SetName:="Set"+String:C10([EW_ExportTables:120]TableNumber:3)
		$_t_ParentSetName:="set"+String:C10([EW_ExportTables:120]ParentTableNumber:6)
		If ([EW_ExportProjects:117]ExportToSeparatefiles:14) | ([EW_ExportTables:120]Order:4=1)  // 26/11/02 pb
			USE SET:C118($_t_ParentSetName)
		End if 
		$_ptr_ParentTable:=Table:C252([EW_ExportTables:120]ParentTableNumber:6)
		Case of 
			: ([EW_ExportTables:120]RelatedOnefieldNumber:8>0) & ([EW_ExportProjects:117]ExportToSeparatefiles:14=False:C215)
				RELATE ONE:C42($_ptr_ParentTable->)
				CREATE SET:C116($_ptr_Table->; $_t_SetName)
				
			: ([EW_ExportTables:120]RelatedOnefieldNumber:8>0)
				RELATE ONE SELECTION:C349($_ptr_ParentTable->; $_ptr_Table->)
				CREATE SET:C116($_ptr_Table->; $_t_SetName)
				
			: ([EW_ExportTables:120]RelatedManyfieldNumber:9>0) & ([EW_ExportProjects:117]ExportToSeparatefiles:14=False:C215)
				// only include the current parent table's related records here
				$_ptr_Field:=Field:C253([EW_ExportTables:120]ParentTableNumber:6; [EW_ExportTables:120]RelatedManyfieldNumber:9)
				RELATE MANY:C262($_ptr_Field->)
				CREATE SET:C116($_ptr_Table->; $_t_SetName)
				
			: ([EW_ExportTables:120]RelatedManyfieldNumber:9>0)
				$_ptr_Field:=Field:C253([EW_ExportTables:120]TableNumber:3; [EW_ExportTables:120]RelatedManyfieldNumber:9)
				RELATE MANY SELECTION:C340($_ptr_Field->)
				CREATE SET:C116($_ptr_Table->; $_t_SetName)
			Else 
				//BEEP
				//TRACE
		End case 
End case 

If (Records in selection:C76($_ptr_Table->)=0)  // 2/12/02
	tErrorMsg:=tErrorMsg+"There are no records to export."
	EW_ErrorHandling(True:C214)
Else 
	If ([EW_ExportProjects:117]Exportformat:7#"daybook ecommerce")
		If ([EW_ExportTables:120]Order:4=1) | ([EW_ExportProjects:117]ExportToSeparatefiles:14=True:C214)  // 26/11/02 pb
			$_t_DocumentPath2:=tFolderPath+[EW_ExportTables:120]FileName:5
			If (Test path name:C476($_t_DocumentPath2)=Is a document:K24:1)
				DELETE DOCUMENT:C159($_t_DocumentPath2)
				If (OK=0)
					tErrorMsg:=tErrorMsg+"The file "+[EW_ExportTables:120]FileName:5+" could not be created."+Char:C90(13)
					EW_ErrorHandling(True:C214)
				End if 
			End if 
			If (tErrorMsg="")
				Doc:=DB_CreateDocument($_t_DocumentPath2)
				If (OK#1)
					tErrorMsg:=tErrorMsg+"The file: "+[EW_ExportTables:120]FileName:5+" could not be created."+Char:C90(13)
					EW_ErrorHandling(True:C214)
				Else 
				End if 
			End if 
		End if 
	End if 
	
	If (tErrorMsg="")
		EW_iThermcount:=0
		If (yCatalogueExport) & ([EW_ExportTables:120]Order:4=1)
			tTableName:="Catalogue"
			EW_irecordcount:=Records in selection:C76([CATALOGUE:108])
			EW_iIncrement:=100/EW_irecordcount
			EW_ExportByCatalogue  // 01/03/03 pb
		Else 
			QUERY:C277([EW_StepActions:119]; [EW_StepActions:119]StepTableRecordNumber:1=[EW_ExportTables:120]RecordNumber:2)
			tTableName:=Table name:C256($_ptr_Table)
			EW_irecordcount:=Records in selection:C76($_ptr_Table->)
			EW_iIncrement:=100/EW_irecordcount
			EW_ExportDetails($_ptr_Table)
		End if 
		Case of 
			: ([EW_ExportProjects:117]Exportformat:7#"daybook ecommerce")
				If ([EW_ExportProjects:117]ExportToSeparatefiles:14=True:C214) | ((End selection:C36($_ptr_Table->)) & ([EW_ExportTables:120]Order:4=1))
					EW_SendPacket(->tExportText)
					CLOSE DOCUMENT:C267(Doc)
				End if 
				
			: (([EW_ExportProjects:117]Exportformat:7="daybook ecommerce") & ([EW_ExportTables:120]TableNumber:3=Table:C252(->[PRODUCTS:9])))  // export by catalogue
				//    APPLY TO SELECTION([Catalogue_ProductLink];[Catalogue_ProductLink]UpdatedInB
				APPLY TO SELECTION:C70([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]TimeDateStamp:8:=lDatetime)
				USE SET:C118("deletes")
				DELETE SELECTION:C66([Catalogue_ProductLink:109])
		End case 
	End if   //  End if
End if   // recs in sel=0
ERR_MethodTrackerReturn("EW_ExportNowTables"; $_t_oldMethodName)
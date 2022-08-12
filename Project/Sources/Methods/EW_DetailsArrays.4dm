//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_DetailsArrays
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
	//ARRAY TEXT(EW_at_ExportActions;0)
	//ARRAY TEXT(EW_at_ExportFields;0)
	//ARRAY BOOLEAN(EW_lb_StepDetails;0)
	//ARRAY INTEGER(EW_ai_StepDetailOrder;0)
	//ARRAY LONGINT(EW_al_ExportFieldNumbers;0)
	//ARRAY LONGINT(EW_al_StepDetailRecordnos;0)
	//ARRAY LONGINT(EW_al_CatalogueIDs;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	//ARRAY TEXT(EW_at_CataloguesNames;0)
	//ARRAY TEXT(EW_at_OutputLabels;0)
	C_BOOLEAN:C305(EW_bo_ModifiedStep)
	C_LONGINT:C283(rModify; rSelect)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_DetailsArrays")
// EW_DetailsArrays
// 05/07/02 pb
// Arrays of the Step Details for the Export Wizard
// Selection must be made in the EW_StepDetails table first

EW_ArraysSetup("details")  // initialises the arrays

SELECTION TO ARRAY:C260([EW_StepActions:119]ActionOrder:3; EW_ai_StepDetailOrder; [EW_StepActions:119]WhatDataToExport:4; EW_at_ExportFields; [EW_StepActions:119]FieldNumber:6; EW_al_ExportFieldNumbers; [EW_StepActions:119]Action:7; EW_at_ExportActions; [EW_StepActions:119]RecordNumber:2; EW_al_StepDetailRecordnos; [EW_StepActions:119]OutputLabel:13; EW_at_OutputLabels)
SORT ARRAY:C229(EW_ai_StepDetailOrder; EW_at_ExportFields; EW_al_ExportFieldNumbers; EW_at_ExportActions; EW_al_StepDetailRecordnos; EW_at_OutputLabels)
rSelect:=1
rModify:=0
EW_LBI_Setup(->EW_lb_StepDetails; "EWDetails"; 3; ->EW_at_ExportFields; ->EW_at_OutputLabels; ->EW_at_ExportActions; ->EW_al_ExportFieldNumbers; ->EW_al_StepDetailRecordnos; ->EW_ai_StepDetailOrder)

EW_EntryOptions(EW_lb_StepDetails; "select")
EW_bo_ModifiedStep:=False:C215

If ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")  // 28/08/03 pb
	If ([EW_ExportSteps:118]BKModelName:8="")
		DM_at_BKModelNames:=1  // "Select a store"
	Else 
		DM_at_BKModelNames:=Find in array:C230(DM_at_BKModelNames; [EW_ExportSteps:118]BKModelName:8)
	End if 
	// If ([EW_ExportSteps]BaseTablenumber=Table(->[PRODUCTS]))  ` 04/11/03 pb
	ALL RECORDS:C47([CATALOGUE:108])
	ARRAY TEXT:C222(EW_at_CataloguesNames; 0)
	ARRAY LONGINT:C221(EW_al_CatalogueIDs; 0)
	SELECTION TO ARRAY:C260([CATALOGUE:108]Catalogue_Name:2; EW_at_CataloguesNames; [CATALOGUE:108]x_ID:1; EW_al_CatalogueIDs)
	SORT ARRAY:C229(EW_at_CataloguesNames; EW_al_CatalogueIDs)
	INSERT IN ARRAY:C227(EW_at_CataloguesNames; 1)
	INSERT IN ARRAY:C227(EW_al_CatalogueIDs; 1)
	EW_at_CataloguesNames{1}:="All Catalogues"
	EW_at_CataloguesNames:=Find in array:C230(EW_al_CatalogueIDs; [EW_ExportProjects:117]BKCatalogueID:37)  // will default ot 0 for All Catalogues
	//  End if
End if 
ERR_MethodTrackerReturn("EW_DetailsArrays"; $_t_oldMethodName)
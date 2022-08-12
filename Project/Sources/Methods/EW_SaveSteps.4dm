//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_SaveSteps
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
	//ARRAY TEXT(EW_at_ExportFields;0)
	//array Text(EW_at_OutputLabels;0)
	//Array INTEGER(EW_ai_StepDetailOrder;0)
	//Array LONGINT(EW_al_StepDetailRecordnos;0)
	C_BOOLEAN:C305(EW_bo_ModifiedStep)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_SaveSteps")
// EW_SaveSteps
// 16/07/02 pb

Case of 
		
	: (Size of array:C274(EW_at_ExportFields)>0)
		READ WRITE:C146([EW_StepActions:119])
		QUERY:C277([EW_StepActions:119]; [EW_StepActions:119]StepTableRecordNumber:1=[EW_ExportTables:120]RecordNumber:2)
		SORT ARRAY:C229(EW_al_StepDetailRecordnos; EW_ai_StepDetailOrder; EW_at_OutputLabels)
		ORDER BY:C49([EW_StepActions:119]; [EW_StepActions:119]RecordNumber:2)
		ARRAY TO SELECTION:C261(EW_ai_StepDetailOrder; [EW_StepActions:119]ActionOrder:3; EW_at_OutputLabels; [EW_StepActions:119]OutputLabel:13)
		UNLOAD RECORD:C212([EW_StepActions:119])
		DB_SaveRecord(->[EW_ExportSteps:118])
		//  UNLOAD RECORD([EW_ExportSteps])
		
End case 
EW_bo_ModifiedStep:=False:C215
ERR_MethodTrackerReturn("EW_SaveSteps"; $_t_oldMethodName)
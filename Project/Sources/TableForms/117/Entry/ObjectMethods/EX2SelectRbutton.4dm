If (False:C215)
	//object Name: [EW_ExportProjects]Entry.EX2SelectRbutton
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
	//ARRAY TEXT(EW_at_ExportActions;0)
	//ARRAY TEXT(EW_at_ExportFields;0)
	//array Text(EW_at_OutputLabels;0)
	//ARRAY BOOLEAN(EW_lb_StepDetails;0)
	//ARRAY INTEGER(EW_ai_StepDetailOrder;0)
	//ARRAY LONGINT(EW_al_ExportFieldNumbers;0)
	//ARRAY LONGINT(EW_al_StepDetailRecordnos;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.EX2SelectRbutton"; Form event code:C388)
//If (rSelect=1)
//EW_EntryOptions (eALStepdetails;"select")
//End if
EW_LBI_Setup(->EW_lb_StepDetails; "EWDetails"; 3; ->EW_at_ExportFields; ->EW_at_OutputLabels; ->EW_at_ExportActions; ->EW_al_ExportFieldNumbers; ->EW_al_StepDetailRecordnos; ->EW_ai_StepDetailOrder)
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.EX2SelectRbutton"; $_t_oldMethodName)
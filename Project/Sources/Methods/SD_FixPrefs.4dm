//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_FixPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 12:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY INTEGER(SD_ai_ResultCodes;0)
	//ARRAY LONGINT(SD_al_ActionCodesOST;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_Actioncodesost;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	//ARRAY TEXT(SD_at_PriorityNM;0)
	//ARRAY TEXT(SD_at_ResultCodes;0)
	//ARRAY TEXT(SD_at_ResultNames;0)
	C_BOOLEAN:C305(SD_bo_ResultsDialog; SD_bo_ResultsDialogSequence; SD_bo_SaturdayWork; SD_bo_SundayWork)
	C_LONGINT:C283(SD_l_IncludeCompleted; SD_l_TimeSpace)
	C_REAL:C285(Mi; Moffset)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_FixPrefs")
//I suggest you run this as a Macro
ARRAY INTEGER:C220(SD_ai_ActionCodes; 0)  //is the action code available
ARRAY TEXT:C222(SD_at_ActionCodes; 0)  //list of all action codes
ARRAY TEXT:C222(SD_at_DiaryActionNames; 0)  //list of all action codes
ARRAY LONGINT:C221(SD_al_ActionTime; 0)  //default length of action
ARRAY INTEGER:C220(SD_ai_ActionCodesOSW; 0)  //does this action get on screen warning
ARRAY LONGINT:C221(SD_al_ActionCodesOST; 0)  // time
ARRAY TEXT:C222(SD_at_Actioncodesost; 0)
ARRAY TEXT:C222(SD_at_PriorityNM; 0)
ARRAY LONGINT:C221(SD_al_PriorityNUM; 0)

ARRAY INTEGER:C220(SD_ai_ResultCodes; 0)  //is the Result code available
ARRAY TEXT:C222(SD_at_ResultCodes; 0)  //list of all action codes
ARRAY TEXT:C222(SD_at_ResultNames; 0)  //list of all action codes

//TRACE

READ WRITE:C146([SD_Settings:107])
ALL RECORDS:C47([SD_Settings:107])
For (Mi; 1; Records in selection:C76([SD_Settings:107]))
	Moffset:=0
	BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersACTION:5; SD_ai_ActionCodes; Moffset)
	BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersACTION:5; SD_at_ActionCodes; Moffset)
	BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersACTION:5; SD_at_DiaryActionNames; Moffset)
	BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersACTION:5; SD_al_ActionTime; Moffset)
	BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersACTION:5; SD_ai_ActionCodesOSW; Moffset)
	BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersACTION:5; SD_al_ActionCodesOST; Moffset)
	BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersACTION:5; SD_at_ActioncodesOST; Moffset)
	SD_l_IncludeCompleted:=0
	Moffset:=0
	If ([SD_Settings:107]x_OwnerID:1=-1)
		BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersPriority:10; SD_at_PriorityNM; Moffset)
		BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersPriority:10; SD_al_PriorityNUM; Moffset)
	End if 
	BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersResult:9; SD_ai_ResultCodes; Moffset)
	BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersResult:9; SD_at_ResultCodes; Moffset)
	BLOB TO VARIABLE:C533([SD_Settings:107]EventParametersResult:9; SD_at_ResultNames; Moffset)
	SET BLOB SIZE:C606([SD_Settings:107]EventParametersACTION:5; 0)
	VARIABLE TO BLOB:C532(SD_ai_ActionCodes; [SD_Settings:107]EventParametersACTION:5)
	VARIABLE TO BLOB:C532(SD_at_ActionCodes; [SD_Settings:107]EventParametersACTION:5; *)
	VARIABLE TO BLOB:C532(SD_at_DiaryActionNames; [SD_Settings:107]EventParametersACTION:5; *)
	VARIABLE TO BLOB:C532(SD_al_ActionTime; [SD_Settings:107]EventParametersACTION:5; *)
	VARIABLE TO BLOB:C532(SD_ai_ActionCodesOSW; [SD_Settings:107]EventParametersACTION:5; *)
	VARIABLE TO BLOB:C532(SD_al_ActionCodesOST; [SD_Settings:107]EventParametersACTION:5; *)
	VARIABLE TO BLOB:C532(SD_at_ActioncodesOST; [SD_Settings:107]EventParametersACTION:5; *)
	VARIABLE TO BLOB:C532(SD_l_IncludeCompleted; [SD_Settings:107]EventParametersACTION:5; *)
	If ([SD_Settings:107]x_OwnerID:1=-1)
		VARIABLE TO BLOB:C532(SD_at_PriorityNM; [SD_Settings:107]EventParametersPriority:10)
		VARIABLE TO BLOB:C532(SD_al_PriorityNUM; [SD_Settings:107]EventParametersPriority:10; *)
		VARIABLE TO BLOB:C532(SD_ai_ResultCodes; [SD_Settings:107]EventParametersResult:9; *)
		VARIABLE TO BLOB:C532(SD_at_ResultCodes; [SD_Settings:107]EventParametersResult:9; *)
		VARIABLE TO BLOB:C532(SD_at_ResultNames; [SD_Settings:107]EventParametersResult:9; *)
	Else 
		VARIABLE TO BLOB:C532(SD_ai_ResultCodes; [SD_Settings:107]EventParametersResult:9)
		VARIABLE TO BLOB:C532(SD_at_ResultCodes; [SD_Settings:107]EventParametersResult:9; *)
		VARIABLE TO BLOB:C532(SD_at_ResultNames; [SD_Settings:107]EventParametersResult:9; *)
	End if 
	DB_SaveRecord(->[SD_Settings:107])
	NEXT RECORD:C51([SD_Settings:107])
End for 
ERR_MethodTrackerReturn("SD_FixPrefs"; $_t_oldMethodName)
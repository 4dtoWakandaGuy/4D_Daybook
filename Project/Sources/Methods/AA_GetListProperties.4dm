//%attributes = {}
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($1)
	//C_UNKNOWN($3)
	ARRAY LONGINT:C221($_al_PropertyNUM; 0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY TEXT:C222($_at_PropertyValue; 0)
	C_BOOLEAN:C305(AA_bo_LoadedAllProps)
	C_LONGINT:C283($_l_Offset; $_l_ProcessNum; $_l_Tries)
	C_OBJECT:C1216($_obj_DefaultProperties)
	C_POINTER:C301($2; $4)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_GetListProperties")
//Make sure we have loaded the list of properties.

$_obj_DefaultProperties:=New object:C1471
AA_LoadListProperties($_obj_DefaultProperties)

ARRAY TEXT:C222($_at_PropertyNames; 0)
ARRAY LONGINT:C221($_al_PropertyNUM; 0)
ARRAY TEXT:C222($_at_PropertyValue; 0)
$_l_Offset:=0
//Just in case
If (BLOB size:C605([X_LISTS:111]x_ListValues:6)>0)
	BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_at_PropertyNames; $_l_Offset)
	BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_al_PropertyNUM; $_l_Offset)
	BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_at_PropertyValue; $_l_Offset)
Else 
	If (BLOB size:C605([X_LISTS:111]x_ListValues:6)=0) & (BLOB size:C605([X_LISTS:111]x_ListAttributes:3)>0)
		UNLOAD RECORD:C212([X_LISTS:111])
		
		$_l_ProcessNum:=New process:C317("AA_UpdateListProperties"; 256000; "UpdatingListProperties")
		$_l_Tries:=0
		While (Process state:C330($_l_ProcessNum)>=0) & ($_l_ProcessNum>0)
			
			$_t_ProcessName:=Process_Name($_l_ProcessNum)
			If ($_t_ProcessName="UpdatingListProperties")
				$_l_Tries:=$_l_Tries+1
				DelayTicks($_l_Tries*2)
			Else 
				$_l_ProcessNum:=0
			End if 
		End while 
		LOAD RECORD:C52([X_LISTS:111])
		BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_at_PropertyNames; $_l_Offset)
		BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_al_PropertyNUM; $_l_Offset)
		BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_at_PropertyValue; $_l_Offset)
	End if 
End if 
If (Count parameters:C259>=3)
	COPY ARRAY:C226($_at_PropertyNames; $1->)
	COPY ARRAY:C226($_al_PropertyNUM; $2->)
	COPY ARRAY:C226($_at_PropertyValue; $3->)
End if 
ERR_MethodTrackerReturn("AA_GetListProperties"; $_t_oldMethodName)

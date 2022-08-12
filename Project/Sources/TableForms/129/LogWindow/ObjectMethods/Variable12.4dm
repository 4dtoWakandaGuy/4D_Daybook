If (False:C215)
	//object Name: [WEBSETUP_4D]LogWindow.Variable12
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
	ARRAY TEXT:C222($_at_ArrayNames; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	C_LONGINT:C283($_l_ColumnIndex)
	C_TEXT:C284($_t_oldMethodName; LOG_t_LogType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].LogWindow.Variable12"; Form event code:C388)

Case of 
		
	: (LOG_t_LogType="GetMacro")
		
		ARRAY TEXT:C222($_at_ArrayNames; 2)
		ARRAY TEXT:C222($_at_ColumnNames; 2)
		
		$_at_ArrayNames{1}:="<>MAC_ai_Get_LogMS"
		$_at_ArrayNames{2}:="<>MAC_at_Get_LogDescription"
		
		$_at_ColumnNames{1}:="Milliseconds"
		$_at_ColumnNames{2}:="Event"
		
	: (LOG_t_LogType="MacroText")
		
		ARRAY TEXT:C222($_at_ArrayNames; 2)
		ARRAY TEXT:C222($_at_ColumnNames; 2)
		
		$_at_ArrayNames{1}:="<>MAC_ai_Text_LogMS"
		$_at_ArrayNames{2}:="<>MAC_at_Text_LogDescription"
		
		$_at_ColumnNames{1}:="Milliseconds"
		$_at_ColumnNames{2}:="Text"
		
	: (LOG_t_LogType="LogSQL")
		
		ARRAY TEXT:C222($_at_ArrayNames; 2)
		ARRAY TEXT:C222($_at_ColumnNames; 2)
		
		$_at_ArrayNames{1}:="<>SQL_ai_Cmd_LogMS"
		$_at_ArrayNames{2}:="<>SQL_at_Cmd_LogDescription"
		
		$_at_ColumnNames{1}:="Milliseconds"
		$_at_ColumnNames{2}:="Command"
		
	: (LOG_t_LogType="LogSELECT")
		
		ARRAY TEXT:C222($_at_ArrayNames; 2)
		ARRAY TEXT:C222($_at_ColumnNames; 2)
		
		$_at_ArrayNames{1}:="<>SQL_ai_Select_LogMS"
		$_at_ArrayNames{2}:="<>SQL_at_Select_LogDescription"
		
		$_at_ColumnNames{1}:="Milliseconds"
		$_at_ColumnNames{2}:="Command"
		
End case 

For ($_l_ColumnIndex; 1; Size of array:C274($_at_ArrayNames))
	
	// SQL_ArrayClear(UTI_GetPointer($_at_ArrayNames{$_l_ColumnIndex}))
	
End for 

//AL_UpdateArrays (LOG_i_ALP_LogArea;-2)

//end
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].LogWindow.Variable12"; $_t_oldMethodName)

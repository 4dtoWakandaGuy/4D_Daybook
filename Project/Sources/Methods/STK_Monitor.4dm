//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_Monitor
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    29/06/2011 17:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled)
	C_LONGINT:C283($_l_Index; $_l_RecordsinSelection)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_Monitor")
Repeat 
	READ ONLY:C145([CURRENT_STOCK:62])
	ALL RECORDS:C47([CURRENT_STOCK:62])
	$_l_RecordsinSelection:=Records in selection:C76([CURRENT_STOCK:62])
	For ($_l_Index; 1; $_l_RecordsinSelection)
		READ WRITE:C146([CURRENT_STOCK:62])
		LOAD RECORD:C52([CURRENT_STOCK:62])
		If (Not:C34(<>SYS_bo_QuitCalled))
			DB_SaveRecord(->[CURRENT_STOCK:62])
			UNLOAD RECORD:C212([CURRENT_STOCK:62])
			
			If (Not:C34(<>SYS_bo_QuitCalled))
				DelayTicks(30)
				
			End if 
			NEXT RECORD:C51([CURRENT_STOCK:62])
		Else 
			$_l_Index:=$_l_RecordsinSelection
		End if 
		
	End for 
	UNLOAD RECORD:C212([CURRENT_STOCK:62])
	If (Not:C34(<>SYS_bo_QuitCalled))
		READ ONLY:C145([STOCK_LEVELS:58])
		ALL RECORDS:C47([STOCK_LEVELS:58])
		$_l_RecordsinSelection:=Records in selection:C76([STOCK_LEVELS:58])
		For ($_l_Index; 1; $_l_RecordsinSelection)
			READ WRITE:C146([STOCK_LEVELS:58])
			LOAD RECORD:C52([STOCK_LEVELS:58])
			
			If (Not:C34(<>SYS_bo_QuitCalled))
				DB_SaveRecord(->[STOCK_LEVELS:58])
				UNLOAD RECORD:C212([STOCK_LEVELS:58])
				
				If (Not:C34(<>SYS_bo_QuitCalled))
					DelayTicks(30)
					
				End if 
				NEXT RECORD:C51([STOCK_LEVELS:58])
			Else 
				$_l_Index:=$_l_RecordsinSelection
			End if 
			
		End for 
		
	End if 
Until (<>SYS_bo_QuitCalled)
ERR_MethodTrackerReturn("STK_Monitor"; $_t_oldMethodName)

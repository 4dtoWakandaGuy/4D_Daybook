//%attributes = {}
If (False:C215)
	//Project Method Name:      States_Load2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: States_Load2
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY INTEGER:C220($_ai_CodeUsages; 0)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	//ARRAY LONGINT(<>SYS_al_RecStateSortOrder;0)
	//ARRAY TEXT(<>SYS_at_RecStateAbbrev;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	ARRAY TEXT:C222($_at_Codes; 0)
	C_BOOLEAN:C305(<>DB_bo_TableNamestatesLoaded; <>PER_bo_CurrentGroupRestrictStat; $_bo_ReadOnlyState; $_bo_Update)
	C_LONGINT:C283($_l_CountCodeUsageRecords; $_l_CountRecords; $_l_Difference; $_l_Index; $_l_Process; $_l_SizeofArray; $_l_StateColumn; $_l_StateRow; $1)
	C_TEXT:C284(<>PER_t_UserGroup; $_t_oldMethodName; $_t_ProcessName; $_t_StatesCode; $_t_StatesCode2; $_t_TableNumberString)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("States_Load2"; Form event code:C388)
//States_Load2

//TRACE

QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]Table_number:3=$1)
$_l_CountRecords:=Records in selection:C76([TABLE_RECORD_STATES:90])
If ($_l_CountRecords>0)
	If (Not:C34(<>DB_bo_TableNamestatesLoaded))
		Load_Fields
	End if 
	
	
	
	
	While (Semaphore:C143("$InsertingStateCodes"))
		DelayTicks
	End while 
	If (Size of array:C274(<>SYS_at_RecStateCodes)<$1)
		$_l_SizeofArray:=Size of array:C274(<>SYS_at_RecStateCodes)
		$_l_Difference:=$1-$_l_SizeofArray
		INSERT IN ARRAY:C227(<>SYS_at_RecStateCodes; $_l_SizeofArray+1; $_l_Difference)
		//INSERT IN ARRAY(◊aStCode;$_l_SizeofArray+1;$_l_Difference)
		INSERT IN ARRAY:C227(<>SYS_at_RecStateNames; $_l_SizeofArray+1; $_l_Difference)
		INSERT IN ARRAY:C227(<>SYS_at_RecStateAbbrev; $_l_SizeofArray+1; $_l_Difference)
		INSERT IN ARRAY:C227(<>SYS_al_RecStateRestriction; $_l_SizeofArray+1; $_l_Difference)
		INSERT IN ARRAY:C227(<>SYS_al_RecStateSortOrder; $_l_SizeofArray+1; $_l_Difference)
	End if 
	ARRAY TEXT:C222(<>SYS_at_RecStateCodes{$1}; $_l_CountRecords)
	ARRAY TEXT:C222(<>SYS_at_RecStateNames{$1}; $_l_CountRecords)
	ARRAY TEXT:C222(<>SYS_at_RecStateAbbrev{$1}; $_l_CountRecords)
	ARRAY LONGINT:C221(<>SYS_al_RecStateRestriction{$1}; $_l_CountRecords)
	ARRAY LONGINT:C221(<>SYS_al_RecStateSortOrder{$1}; $_l_CountRecords)
	SELECTION TO ARRAY:C260([TABLE_RECORD_STATES:90]State_Code:1; <>SYS_at_RecStateCodes{$1}; [TABLE_RECORD_STATES:90]Listing_Name:2; <>SYS_at_RecStateNames{$1}; [TABLE_RECORD_STATES:90]Abbreviated_Name:6; <>SYS_at_RecStateAbbrev{$1}; [TABLE_RECORD_STATES:90]xSortOrder:9; <>SYS_al_RecStateSortOrder{$1})
	$_l_StateColumn:=Find in array:C230(<>SYS_al_RecStateSortOrder{$1}; 0)
	If ($_l_StateColumn>0)
		//NG October 2004
		$_bo_ReadOnlyState:=Read only state:C362([TABLE_RECORD_STATES:90])
		READ WRITE:C146([TABLE_RECORD_STATES:90])
		ORDER BY:C49([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4)
		FIRST RECORD:C50([TABLE_RECORD_STATES:90])
		For ($_l_Index; 1; Records in selection:C76([TABLE_RECORD_STATES:90]))
			[TABLE_RECORD_STATES:90]xSortOrder:9:=$_l_Index
			SAVE RECORD:C53([TABLE_RECORD_STATES:90])
			NEXT RECORD:C51([TABLE_RECORD_STATES:90])
		End for 
		UNLOAD RECORD:C212([TABLE_RECORD_STATES:90])
		If ($_bo_ReadOnlyState)
			READ ONLY:C145([TABLE_RECORD_STATES:90])
		End if 
		QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]Table_number:3=$1)
		SELECTION TO ARRAY:C260([TABLE_RECORD_STATES:90]State_Code:1; <>SYS_at_RecStateCodes{$1}; [TABLE_RECORD_STATES:90]Listing_Name:2; <>SYS_at_RecStateNames{$1}; [TABLE_RECORD_STATES:90]Abbreviated_Name:6; <>SYS_at_RecStateAbbrev{$1}; [TABLE_RECORD_STATES:90]xSortOrder:9; <>SYS_al_RecStateSortOrder{$1})
		Case of 
			: ($1=Table:C252(->[SERVICE_CALLS:20])) & (Size of array:C274(<>SYS_at_RecStateCodes{$1})=0)
				//Service calls have not been updated!!
				
				
				$_l_Process:=New process:C317("SVS_ConvertStates"; 256000; "Update Service Calls")
				//Above is done in a seperate process so it does not affect the  current record pointer AND so if we are in a transaction the records are updated for everyone.
				While (Process state:C330($_l_Process)>0) & ($_l_Process>0)
					$_t_ProcessName:=Process_Name($_l_Process)
					
					If ($_t_ProcessName="Update Service Calls")
						DelayTicks(40)
						MESSAGE:C88("Updating Service calls states")
					Else 
						$_l_Process:=0
					End if 
				End while 
				States_Load2($1)
		End case 
	End if 
	
	If (<>PER_bo_CurrentGroupRestrictStat)  //If the User Group says check its States
		$_t_TableNumberString:=String:C10($1)  // Table number as string
		
		
		$_t_StatesCode:="092"+<>PER_t_UserGroup+(" "*(5-Length:C16(<>PER_t_UserGroup)))
		$_t_StatesCode:=$_t_StatesCode+("0"*(3-Length:C16($_t_TableNumberString)))+$_t_TableNumberString
		$_t_StatesCode2:=$_t_StatesCode+"@"
		QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_StatesCode2)
		$_l_CountCodeUsageRecords:=Records in selection:C76([CODE_USES:91])
		If ($_l_CountCodeUsageRecords#0)
			ARRAY TEXT:C222($_at_Codes; 0)
			ARRAY INTEGER:C220($_ai_CodeUsages; 0)
			SELECTION TO ARRAY:C260([CODE_USES:91]Code:1; $_at_Codes; [CODE_USES:91]Use:2; $_ai_CodeUsages)
			For ($_l_Index; 1; $_l_CountRecords)
				$_t_StatesCode2:=$_t_StatesCode+<>SYS_at_RecStateCodes{$1}{$_l_Index}
				$_l_StateRow:=Find in array:C230($_at_Codes; $_t_StatesCode2)
				If ($_l_StateRow>0)
					<>SYS_al_RecStateRestriction{$1}{$_l_Index}:=$_ai_CodeUsages{$_l_StateRow}
				Else 
					<>SYS_al_RecStateRestriction{$1}{$_l_Index}:=0
				End if 
			End for 
		Else 
			For ($_l_Index; 1; $_l_CountRecords)
				<>SYS_al_RecStateRestriction{$1}{$_l_Index}:=1
			End for 
		End if 
	Else 
		For ($_l_Index; 1; $_l_CountRecords)
			<>SYS_al_RecStateRestriction{$1}{$_l_Index}:=1
		End for 
	End if 
	SORT ARRAY:C229(<>SYS_al_RecStateSortOrder{$1}; <>SYS_at_RecStateCodes{$1}; <>SYS_at_RecStateNames{$1}; <>SYS_at_RecStateAbbrev{$1}; <>SYS_al_RecStateRestriction{$1}; >)
	CLEAR SEMAPHORE:C144("$InsertingStateCodes")
Else 
	Case of 
		: ($1=Table:C252(->[SERVICE_CALLS:20])) & (Size of array:C274(<>SYS_at_RecStateCodes{$1})=0)
			
			
			
			
			//Service calls have not been updated!!
			
			
			$_l_Process:=New process:C317("SVS_ConvertStates"; 256000; "Update Service Calls")
			//Above is done in a seperate process so it does not affect the  current record pointer AND so if we are in a transaction the records are updated for everyone.
			While (Process state:C330($_l_Process)>=0) & ($_l_Process>0)
				$_t_ProcessName:=Process_Name($_l_Process)
				
				If ($_t_ProcessName="Update Service Calls")
					DelayTicks(40)
					MESSAGE:C88("Updating Service calls states")
				Else 
					$_l_Process:=0
				End if 
			End while 
			States_Load2($1)
	End case 
	
	
	
End if 
ERR_MethodTrackerReturn("States_Load2"; $_t_oldMethodName)

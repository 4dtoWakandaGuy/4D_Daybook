//%attributes = {}
If (False:C215)
	//Project Method Name:      SVS_GetStateName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/05/2010 21:53
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	C_BOOLEAN:C305(<>StatesLoaded; $_bo_Value2; $2)
	C_LONGINT:C283($_l_Insert; $_l_StateCodeRow; $_l_TableNumber)
	C_POINTER:C301($_ptr_Field; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_StateCode; $_t_StateName; $_t_TableSTR; $_t_TableSTRing; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SVS_GetStateName")
If (Count parameters:C259>=1)
	
	If (Not:C34(<>StatesLoaded))
		States_Load
	End if 
	$_l_TableNumber:=Table:C252(->[SERVICE_CALLS:20])
	If (Count parameters:C259=0)
		$_ptr_Field:=->[SERVICE_CALLS:20]Table_State:29
	Else 
		$_ptr_Field:=$1
	End if 
	If (Count parameters:C259>=2)
		$_bo_Value2:=$2
	Else 
		$_bo_Value2:=[SERVICE_CALLS:20]Resolved:9
	End if 
	$_t_TableSTRing:=String:C10($_l_TableNumber; "000")
	If ($_ptr_Field->="")
		
		Case of 
			: (Not:C34($_bo_Value2))
				$_t_StateName:="Open Service Call"
			Else 
				$_t_StateName:="Closed Service Call"
		End case 
		$_l_StateCodeRow:=Find in array:C230(<>SYS_at_RecStateNames{Table:C252(->[SERVICE_CALLS:20])}; $_t_StateName)
		If ($_l_StateCodeRow>0)
			If (Count parameters:C259>=1)
				$1->:=$_t_TableSTRing+<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])}{$_l_StateCodeRow}
			End if 
			
			$0:=$_t_StateName
		Else 
			If (Size of array:C274(<>SYS_at_RecStateCodes)<(Table:C252(->[SERVICE_CALLS:20])))
				$_l_Insert:=(Table:C252(->[SERVICE_CALLS:20]))-(Size of array:C274(<>SYS_at_RecStateCodes))
				INSERT IN ARRAY:C227(<>SYS_at_RecStateCodes; Size of array:C274(<>SYS_at_RecStateCodes)+1; $_l_Insert)
			End if 
			While (Semaphore:C143("$InsertingStateCodes"))
				DelayTicks
			End while 
			If (Size of array:C274(<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])})=0)
				States_Load2(Table:C252(->[SERVICE_CALLS:20]))
			End if 
			CLEAR SEMAPHORE:C144("$InsertingStateCodes")
			$_l_StateCodeRow:=Find in array:C230(<>SYS_at_RecStateNames{Table:C252(->[SERVICE_CALLS:20])}; $_t_StateName)
			If ($_l_StateCodeRow>0)
				If (Count parameters:C259>=1)
					$1->:=$_t_TableSTRing+<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])}{$_l_StateCodeRow}
				End if 
				$0:=$_t_StateName
			Else 
				If (Size of array:C274(<>SYS_at_RecStateNames{Table:C252(->[SERVICE_CALLS:20])})>=1)
					If (Count parameters:C259>=1)
						$1->:=$_t_TableSTRing+<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])}{1}
					End if 
					$0:=<>SYS_at_RecStateNames{Table:C252(->[SERVICE_CALLS:20])}{1}
				Else 
					$0:=""
				End if 
			End if 
			
		End if 
	Else 
		
		
		While (Semaphore:C143("$InsertingStateCodes"))
			DelayTicks
		End while 
		If (Size of array:C274(<>SYS_at_RecStateCodes)<(Table:C252(->[SERVICE_CALLS:20])))
			$_l_Insert:=(Table:C252(->[SERVICE_CALLS:20]))-(Size of array:C274(<>SYS_at_RecStateCodes))
			INSERT IN ARRAY:C227(<>SYS_at_RecStateCodes; Size of array:C274(<>SYS_at_RecStateCodes)+1; $_l_Insert)
		End if 
		
		If (Size of array:C274(<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])})=0)
			States_Load2(Table:C252(->[SERVICE_CALLS:20]))
		End if 
		CLEAR SEMAPHORE:C144("$InsertingStateCodes")
		$_t_TableSTR:=String:C10((Table:C252(->[SERVICE_CALLS:20])); "000")
		$_t_StateCode:=Substring:C12($_ptr_Field->; Length:C16($_t_TableSTR)+1; Length:C16($_ptr_Field->))
		$_l_StateCodeRow:=Find in array:C230(<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])}; $_t_StateCode)
		If ($_l_StateCodeRow>0)
			$0:=Substring:C12(<>SYS_at_RecStateNames{Table:C252(->[SERVICE_CALLS:20])}{$_l_StateCodeRow}; 1; 51)
		Else 
			If (Size of array:C274(<>SYS_at_RecStateNames{Table:C252(->[SERVICE_CALLS:20])})>=1)
				If (Count parameters:C259>=1)
					$1->:=$_t_TableSTRing+<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])}{1}
				End if 
				$0:=<>SYS_at_RecStateNames{Table:C252(->[SERVICE_CALLS:20])}{1}
			Else 
				$0:=""
			End if 
			
			
		End if 
		
		
	End if 
	
	
End if 
ERR_MethodTrackerReturn("SVS_GetStateName"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_SetFileState
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_LONGINT:C283($_l_InsertColumns; $_l_Setting; $_l_StateColumn; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_StateCode; $_t_TableSTR; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_SetFileState")
//$1=String of file state name to set
// this method is for setting the initial or other state
//and for up or down-pass 1 in $2 for up and --1 for down

If (Not:C34(<>StatesLoaded))
	States_Load
End if 

If (Count parameters:C259>=2)
	If ([PURCHASE_ORDERS:57]Purchase_Order_Number:2#$2)
		QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=$2)
	End if 
Else 
	//just do the current one
End if 
While (Semaphore:C143("$_l_InsertColumnsingStateCodes"))
	DelayTicks
End while 
If (Size of array:C274(<>SYS_at_RecStateCodes)<(Table:C252(->[PURCHASE_ORDERS:57])))
	$_l_InsertColumns:=(Table:C252(->[PURCHASE_ORDERS:57]))-(Size of array:C274(<>SYS_at_RecStateCodes))
	INSERT IN ARRAY:C227(<>SYS_at_RecStateCodes; Size of array:C274(<>SYS_at_RecStateCodes)+1; $_l_InsertColumns)
End if 
CLEAR SEMAPHORE:C144("$_l_InsertColumnsingStateCodes")
States_Load2(Table:C252(->[PURCHASE_ORDERS:57]))
$_t_TableSTR:=String:C10((Table:C252(->[PURCHASE_ORDERS:57])); "000")

If ([PURCHASE_ORDERS:57]Record_State:19="")
	Case of 
		: ([PURCHASE_ORDERS:57]State:14=-1)
			$_l_StateColumn:=Find in array:C230(<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])}; "Unconfirmed")
			If ($_l_StateColumn<0)
				$_l_StateColumn:=1
			End if 
			[PURCHASE_ORDERS:57]Record_State:19:=String:C10(Table:C252(->[PURCHASE_ORDERS:57]); "000")+<>SYS_at_RecStateCodes{Table:C252(->[PURCHASE_ORDERS:57])}{$_l_StateColumn}
			
		: ([PURCHASE_ORDERS:57]State:14=0)
			
			$_l_StateColumn:=Find in array:C230(<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])}; "Confirmed")
			If ($_l_StateColumn<0)
				$_l_StateColumn:=Size of array:C274(<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])})
			End if 
			[PURCHASE_ORDERS:57]Record_State:19:=String:C10(Table:C252(->[PURCHASE_ORDERS:57]); "000")+<>SYS_at_RecStateCodes{Table:C252(->[PURCHASE_ORDERS:57])}{$_l_StateColumn}
			
	End case 
Else 
	If (Count parameters:C259>=1)
		$_l_Setting:=$1
	Else 
		$_l_Setting:=1
	End if 
	If ($_l_Setting>0)
		
		$_t_StateCode:=Substring:C12([PURCHASE_ORDERS:57]Record_State:19; Length:C16($_t_TableSTR)+1; Length:C16([PURCHASE_ORDERS:57]Record_State:19))
		$_l_StateColumn:=Find in array:C230(<>SYS_at_RecStateCodes{Table:C252(->[PURCHASE_ORDERS:57])}; $_t_StateCode)
		If ($_l_StateColumn>0) & ($_l_StateColumn<(Size of array:C274(<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])})))
			[PURCHASE_ORDERS:57]Record_State:19:=String:C10(Table:C252(->[PURCHASE_ORDERS:57]); "000")+<>SYS_at_RecStateCodes{Table:C252(->[PURCHASE_ORDERS:57])}{$_l_StateColumn+1}
			
		End if 
		If ($_l_StateColumn+1>1)
			[PURCHASE_ORDERS:57]State:14:=0
		Else 
			[PURCHASE_ORDERS:57]State:14:=-1
		End if 
	Else 
		$_t_StateCode:=Substring:C12([PURCHASE_ORDERS:57]Record_State:19; Length:C16($_t_TableSTR)+1; Length:C16([PURCHASE_ORDERS:57]Record_State:19))
		$_l_StateColumn:=Find in array:C230(<>SYS_at_RecStateCodes{Table:C252(->[PURCHASE_ORDERS:57])}; $_t_StateCode)
		If ($_l_StateColumn>0) & ($_l_StateColumn>1)
			[PURCHASE_ORDERS:57]Record_State:19:=String:C10(Table:C252(->[PURCHASE_ORDERS:57]); "000")+<>SYS_at_RecStateCodes{Table:C252(->[PURCHASE_ORDERS:57])}{$_l_StateColumn-1}
		End if 
		If ($_l_StateColumn-1>1)
			[PURCHASE_ORDERS:57]State:14:=0
		Else 
			[PURCHASE_ORDERS:57]State:14:=-1
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("PUR_SetFileState"; $_t_oldMethodName)

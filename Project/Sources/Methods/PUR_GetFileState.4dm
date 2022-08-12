//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_GetFileState
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
	C_LONGINT:C283($_l_CheckNames; $_l_InsertColumns; $_l_StateColumn)
	C_TEXT:C284($_t_Name; $_t_oldMethodName; $_t_StateCode; $_t_TableSTR; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_GetFileState")
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
$0:=""
If (Count parameters:C259>=1)
	If ([PURCHASE_ORDERS:57]Purchase_Order_Number:2#$1)
		QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=$1)
	End if 
Else 
	//just do the current one
End if 
If ([PURCHASE_ORDERS:57]Record_State:19="")
	Case of 
		: ([PURCHASE_ORDERS:57]State:14=-1)
			
			$0:="UNCONFIRMED"
		: ([PURCHASE_ORDERS:57]State:14=0)
			$0:="CONFIRMED "
	End case 
Else 
	While (Semaphore:C143("$_l_InsertColumnsingStateCodes"))
		DelayTicks
	End while 
	If (Size of array:C274(<>SYS_at_RecStateCodes)<(Table:C252(->[PURCHASE_ORDERS:57])))
		$_l_InsertColumns:=(Table:C252(->[PURCHASE_ORDERS:57]))-(Size of array:C274(<>SYS_at_RecStateCodes))
		INSERT IN ARRAY:C227(<>SYS_at_RecStateCodes; Size of array:C274(<>SYS_at_RecStateCodes)+1; $_l_InsertColumns)
	End if 
	If (Size of array:C274(<>SYS_at_RecStateCodes{Table:C252(->[PURCHASE_ORDERS:57])})=0)
		States_Load2(Table:C252(->[PURCHASE_ORDERS:57]))
	End if 
	For ($_l_CheckNames; 1; Size of array:C274(<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])}))
		$_t_Name:=<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])}{$_l_CheckNames}
		Case of 
			: ($_t_Name="Unconfirmed Purchase@")
				<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])}{$_l_CheckNames}:="Unconfirmed Purchase Order"
			: ($_t_Name="confirmed Purchase O@")
				<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])}{$_l_CheckNames}:="Confirmed Purchase Order"
		End case 
	End for 
	CLEAR SEMAPHORE:C144("$_l_InsertColumnsingStateCodes")
	$_t_TableSTR:=String:C10((Table:C252(->[PURCHASE_ORDERS:57])); "000")
	$_t_StateCode:=Substring:C12([PURCHASE_ORDERS:57]Record_State:19; Length:C16($_t_TableSTR)+1; Length:C16([PURCHASE_ORDERS:57]Record_State:19))
	$_l_StateColumn:=Find in array:C230(<>SYS_at_RecStateCodes{Table:C252(->[PURCHASE_ORDERS:57])}; $_t_StateCode)
	If ($_l_StateColumn>0)
		$0:=<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])}{$_l_StateColumn}
	Else 
		Case of 
			: ([PURCHASE_ORDERS:57]State:14=-1)
				
				$0:="UNCONFIRMED"
			: ([PURCHASE_ORDERS:57]State:14=0)
				$0:="CONFIRMED "
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("PUR_GetFileState"; $_t_oldMethodName)

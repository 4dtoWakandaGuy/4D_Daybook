//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_TitUp
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
	C_BOOLEAN:C305(<>StatesLoaded)
	C_LONGINT:C283($_l_InsertColumns; $_l_StateColumn)
	C_TEXT:C284($_t_oldMethodName; $_t_StateCode; $_t_TableSTR)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_TitUp")
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If ([PURCHASE_ORDERS:57]Record_State:19="")
	
	If ([PURCHASE_ORDERS:57]State:14<0)
		PUR_SetFileState(1)
		[PURCHASE_ORDERS:57]State:14:=[PURCHASE_ORDERS:57]State:14+1
		PurchOrd_State
	End if 
Else 
	While (Semaphore:C143("$InsertingStateCodes"))
		DelayTicks
	End while 
	If (Size of array:C274(<>SYS_at_RecStateCodes)<(Table:C252(->[PURCHASE_ORDERS:57])))
		$_l_InsertColumns:=(Table:C252(->[PURCHASE_ORDERS:57]))-(Size of array:C274(<>SYS_at_RecStateCodes))
		INSERT IN ARRAY:C227(<>SYS_at_RecStateCodes; Size of array:C274(<>SYS_at_RecStateCodes)+1; $_l_InsertColumns)
	End if 
	If (Size of array:C274(<>SYS_at_RecStateCodes{Table:C252(->[PURCHASE_ORDERS:57])})=0)
		States_Load2(Table:C252(->[PURCHASE_ORDERS:57]))
	End if 
	CLEAR SEMAPHORE:C144("$InsertingStateCodes")
	$_t_TableSTR:=String:C10((Table:C252(->[PURCHASE_ORDERS:57])); "000")
	$_t_StateCode:=Substring:C12([PURCHASE_ORDERS:57]Record_State:19; Length:C16($_t_TableSTR)+1; Length:C16([PURCHASE_ORDERS:57]Record_State:19))
	$_l_StateColumn:=Find in array:C230(<>SYS_at_RecStateCodes{Table:C252(->[PURCHASE_ORDERS:57])}; $_t_StateCode)
	If ($_l_StateColumn<Size of array:C274(<>SYS_at_RecStateCodes{Table:C252(->[PURCHASE_ORDERS:57])}))
		PUR_SetFileState(1)
		[PURCHASE_ORDERS:57]State:14:=0
		PurchOrd_State
	End if 
End if 
ERR_MethodTrackerReturn("PurchOrd_TitUp"; $_t_oldMethodName)

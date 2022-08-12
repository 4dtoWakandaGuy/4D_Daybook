//%attributes = {}
If (False:C215)
	//Project Method Name:      States_Load
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 18:22
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
	C_LONGINT:C283($_l_Index; $_l_StateRow; $_l_StringLength; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_String)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("States_Load")
//States_Load - see also Load_Fields
//TRACE
READ ONLY:C145([TABLE_RECORD_STATES:90])
READ ONLY:C145([CODE_USES:91])
While (Semaphore:C143("$LoadingStates"))
	DelayTicks
End while 
If (Not:C34(<>StatesLoaded))
	//While (Semaphore("$LoadFields"))  `this is very unlikely to be the case - only i
	// IDLE
	//End while
	If (((DB_GetModuleSettingByNUM(Module_Enquiries))>1) | ((DB_GetModuleSettingByNUM(Module_SalesOrders))>1))
		States_Load2(24)
	End if 
	If (((DB_GetModuleSettingByNUM(Module_JobCosting))>1))
		
		States_Load2(26)
		States_Load2(89)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>1)
		//purchase orders
		$_l_TableNumber:=Table:C252(->[PURCHASE_ORDERS:57])
		
		//TRACE
		
		States_Load2(Table:C252(->[PURCHASE_ORDERS:57]))
		
		//TRACE
		
		If (Size of array:C274(<>SYS_at_RecStateCodes{$_l_TableNumber})=0)
			PurchConvertStates
			States_Load2(Table:C252(->[PURCHASE_ORDERS:57]))
		Else 
			$_l_StateRow:=Find in array:C230(<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])}; "UNCONFIRMED  PURCHASE ORDER")
			If ($_l_StateRow>0)
				<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])}{$_l_StateRow}:="Unconfirmed Purchase Order"
			End if 
			$_l_StateRow:=Find in array:C230(<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])}; "UNCONFIRMED PURCHASE ORDER")
			If ($_l_StateRow<0)
				$_l_StringLength:=Length:C16("unconfirmed ")
				For ($_l_Index; 27; $_l_StringLength; -1)
					$_t_String:=Substring:C12("UNCONFIRMED PURCHASE ORDER"; 1; $_l_Index)
					
					$_l_StateRow:=Find in array:C230(<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])}; $_t_String)
					If ($_l_StateRow>0)
						<>SYS_at_RecStateNames{Table:C252(->[PURCHASE_ORDERS:57])}{$_l_StateRow}:="Unconfirmed Purchase Order"
						$_t_String:="Unconfirmed Purchase Order"
						$_l_Index:=1
					End if 
					
				End for 
				If ($_l_StateRow<0)
					PurchConvertStates
					States_Load2(Table:C252(->[PURCHASE_ORDERS:57]))
				End if 
				
			End if 
			
		End if 
	End if 
	
End if 
CLEAR SEMAPHORE:C144("$LoadingStates")

<>StatesLoaded:=True:C214
ERR_MethodTrackerReturn("States_Load"; $_t_oldMethodName)

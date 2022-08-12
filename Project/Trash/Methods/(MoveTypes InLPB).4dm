//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      MoveTypes_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  23/06/2011 16:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(STK_at_MovementFunctions;0)
	C_BOOLEAN:C305(<>StockAnal)
	C_LONGINT:C283($_l_FunctionRow; ch1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MoveTypes_InLPB")
If ((DB_GetModuleSettingByNUM(Module_SerialNos))<2)
	OBJECT SET VISIBLE:C603([MOVEMENT_TYPES:60]Serial_Warning:15; False:C215)
	OBJECT SET VISIBLE:C603([MOVEMENT_TYPES:60]Serial_Forcing:16; False:C215)
	OBJECT SET VISIBLE:C603([MOVEMENT_TYPES:60]Serial_Current:18; False:C215)
	OBJECT SET VISIBLE:C603([MOVEMENT_TYPES:60]Serial_Unique:19; False:C215)
	
End if 
If ((DB_GetModuleSettingByNUM(Module_Assemblies))<2)
	OBJECT SET VISIBLE:C603([MOVEMENT_TYPES:60]Assembly_Type:23; False:C215)
End if 
ARRAY TEXT:C222(STK_at_MovementFunctions; 0)
APPEND TO ARRAY:C911(STK_at_MovementFunctions; "Used for purchase ordering")
APPEND TO ARRAY:C911(STK_at_MovementFunctions; "Used for purchase cancellation")
APPEND TO ARRAY:C911(STK_at_MovementFunctions; "Used for receiving stock")

APPEND TO ARRAY:C911(STK_at_MovementFunctions; "Used for stock allocation")
APPEND TO ARRAY:C911(STK_at_MovementFunctions; "Used for stock unallocation")
APPEND TO ARRAY:C911(STK_at_MovementFunctions; "Used for stock delivery to customer")
APPEND TO ARRAY:C911(STK_at_MovementFunctions; "Used for stock delivery to customer and allocation(combined)")
APPEND TO ARRAY:C911(STK_at_MovementFunctions; "Used for stock revaluation")
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)
	APPEND TO ARRAY:C911(STK_at_MovementFunctions; "Used for Currency change")
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)
	APPEND TO ARRAY:C911(STK_at_MovementFunctions; "Used for Layer Change")
End if 
If (<>StockAnal)
	APPEND TO ARRAY:C911(STK_at_MovementFunctions; "Used for Analysis code change")
End if 
If ((DB_GetModuleSettingByNUM(Module_Assemblies))>=2)
	APPEND TO ARRAY:C911(STK_at_MovementFunctions; "Used for stock Assembly/Disassembly")
End if 
STK_at_MovementFunctions:=0
If ([MOVEMENT_TYPES:60]Purch_Ord_Type:11)
	STK_at_MovementFunctions:=Find in array:C230(STK_at_MovementFunctions; "Used for purchase ordering")
	
End if 
If ([MOVEMENT_TYPES:60]UseForpurchaseCancellation:34)
	STK_at_MovementFunctions:=Find in array:C230(STK_at_MovementFunctions; "Used for purchase cancellation")
	
End if 
If ([MOVEMENT_TYPES:60]UseForStockReceipt:33)
	STK_at_MovementFunctions:=Find in array:C230(STK_at_MovementFunctions; "Used for receiving stock")
End if 
If ([MOVEMENT_TYPES:60]Alloc_Type:10)
	If ([MOVEMENT_TYPES:60]Delivery_Type:12)
		STK_at_MovementFunctions:=Find in array:C230(STK_at_MovementFunctions; "Used for stock delivery to customer and allocation(combined)")
	Else 
		STK_at_MovementFunctions:=Find in array:C230(STK_at_MovementFunctions; "Used for stock allocation")
		
	End if 
End if 
If ([MOVEMENT_TYPES:60]Unalloc_Type:13)
	STK_at_MovementFunctions:=Find in array:C230(STK_at_MovementFunctions; "Used for stock unallocation")
End if 
If ([MOVEMENT_TYPES:60]Delivery_Type:12)
	STK_at_MovementFunctions:=Find in array:C230(STK_at_MovementFunctions; "Used for stock delivery to customer")
End if 
If ([MOVEMENT_TYPES:60]UseForValueChange:28)
	STK_at_MovementFunctions:=Find in array:C230(STK_at_MovementFunctions; "Used for stock revaluation")
End if 
If ([MOVEMENT_TYPES:60]UseForCurrencyMove:32)
	$_l_FunctionRow:=Find in array:C230(STK_at_MovementFunctions; "Used for Currency change")
	If ($_l_FunctionRow>0)
		STK_at_MovementFunctions:=$_l_FunctionRow
	End if 
End if 
If ([MOVEMENT_TYPES:60]UseForLayerMove:31)
	$_l_FunctionRow:=Find in array:C230(STK_at_MovementFunctions; "Used for Layer Change")
	If ($_l_FunctionRow>0)
		STK_at_MovementFunctions:=$_l_FunctionRow
	End if 
End if 
If ([MOVEMENT_TYPES:60]UseForAnalysisMove:30)
	$_l_FunctionRow:=Find in array:C230(STK_at_MovementFunctions; "Used for Analysis code change")
	If ($_l_FunctionRow>0)
		STK_at_MovementFunctions:=$_l_FunctionRow
	End if 
End if 
If ([MOVEMENT_TYPES:60]Assembly_Type:23)
	$_l_FunctionRow:=Find in array:C230(STK_at_MovementFunctions; "Used for stock Assembly/Disassembly")
	If ($_l_FunctionRow>0)
		STK_at_MovementFunctions:=$_l_FunctionRow
	End if 
End if 
If (STK_at_MovementFunctions=0)
	APPEND TO ARRAY:C911(STK_at_MovementFunctions; "General Stock Movement Function")
	STK_at_MovementFunctions:=Size of array:C274(STK_at_MovementFunctions)
End if 
ch1:=Num:C11([MOVEMENT_TYPES:60]MN_Identifier_Number:24>0)
ERR_MethodTrackerReturn("MoveTypes_InLPB"; $_t_oldMethodName)

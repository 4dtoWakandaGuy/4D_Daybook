//%attributes = {}
If (False:C215)
	//Project Method Name:      SF_MovementIN_LPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   14/09/2011 14:25 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_LB_StockItems;0)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	//ARRAY TEXT(SM_at_ModeStockMov;0)
	C_BOOLEAN:C305(<>StockAnal; DB_bo_RecordModified; LBI_bo_NoEdit)
	C_LONGINT:C283($_l_Index; STOCK_l_Context; vPS)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_Field)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName; $_t_PairingString; $_t_SubItemName; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SF_t_MovementTypeName; SF_t_TypeName; STK_t_CopyNote; vButtDisMov)
	C_TEXT:C284(vOrdTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SF_MovementIN_LPB")
STK_t_CopyNote:=""
LBI_bo_NoEdit:=False:C215
If ([SF_STOCKMOVEMENTS:193]X_ID:1=0)
	[SF_STOCKMOVEMENTS:193]X_ID:1:=AA_GetNextID(->[SF_STOCKMOVEMENTS:193]X_ID:1)
End if 

If (STOCK_l_Context<0)  // added NG may 2004 to
	LBI_bo_NoEdit:=True:C214
	//display the lines
	STK_t_CopyNote:="Drag stock items to copy them"
	//we are viewing a stock movement to copy lines
	For ($_l_Index; 1; Get last field number:C255(->[SF_STOCKMOVEMENTS:193]))
		$_ptr_Field:=Field:C253(Table:C252(->[SF_STOCKMOVEMENTS:193]); $_l_Index)
		OBJECT SET ENTERABLE:C238($_ptr_Field; False:C215)  //will prevent entry on screen
	End for 
	For ($_l_Index; 1; Get last field number:C255(->[SF_STOCKMOVEMENT_ITEMS:194]))
		$_ptr_Field:=Field:C253(Table:C252(->[SF_STOCKMOVEMENT_ITEMS:194]); $_l_Index)
		OBJECT SET ENTERABLE:C238($_ptr_Field; False:C215)  //will prevent entry on screen
	End for 
	//Disable the copy funcitons here
End if 
If ([SF_STOCKMOVEMENTS:193]Movement_Code:2="")
	[STOCK_MOVEMENTS:40]Movement_Code:1:=SF_MovementCode("*T")  //Note that now all we do is take the *T
	SF_MovementINDefaults
End if 
If ([SF_STOCKMOVEMENTS:193]Created_Date:7=!00-00-00!)
	[SF_STOCKMOVEMENTS:193]Created_Date:7:=Current date:C33(*)
	
	[SF_STOCKMOVEMENTS:193]Created_Time:8:=Current time:C178(*)
	
End if 
If ([SF_STOCKMOVEMENTS:193]Related_Table:11>0)
End if 
vPS:=1
SF_t_MovementTypeName:=""
SF_t_TypeName:="Type No"
If ([SF_STOCKMOVEMENTS:193]Movement_Type:4#"")
	RELATE ONE:C42([SF_STOCKMOVEMENTS:193]Movement_Type:4)
	SF_t_MovementTypeName:=SF_GetStockMovementTypeName
	If ([SF_STOCKMOVEMENTS:193]Movement_Type:4#"")
		If ([MOVEMENT_TYPES:60]Number_Mod:8=False:C215)
			OBJECT SET ENTERABLE:C238([SF_STOCKMOVEMENTS:193]Movement_Type_Reference:3; False:C215)
		End if 
		
	End if 
	If ([MOVEMENT_TYPES:60]Number_Name:5#"")
		SF_t_TypeName:=[MOVEMENT_TYPES:60]Number_Name:5
	Else 
		SF_t_TypeName:="Type No"
	End if 
Else 
	SF_t_MovementTypeName:=""
End if 
If ([SF_STOCKMOVEMENTS:193]Movement_Type_Reference:3="")
	[SF_STOCKMOVEMENTS:193]Movement_Type_Reference:3:="*TBA"
End if 

DB_MenuAction("Functions"; "Copy Current Stock"; 1; Term_StoWT("Copy Current Stock"))

If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
	OBJECT SET ENTERABLE:C238([SF_STOCKMOVEMENTS:193]Currency_Code:19; False:C215)
	OBJECT SET VISIBLE:C603(*; "oCurrencies"; False:C215)
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
	OBJECT SET ENTERABLE:C238([SF_STOCKMOVEMENTS:193]Layer_Code:17; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLayers"; False:C215)
End if 
If (Not:C34(<>StockAnal))
	OBJECT SET ENTERABLE:C238([SF_STOCKMOVEMENTS:193]Analysis_Code:18; False:C215)
	OBJECT SET VISIBLE:C603(*; "oAnalysis"; False:C215)
End if 
If (DB_t_CurrentFormUsage="NoACL")
	If (<>StockAnal)
		OBJECT SET ENTERABLE:C238([SF_STOCKMOVEMENTS:193]Analysis_Code:18; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAnalysis"; False:C215)
	End if 
	OBJECT SET ENTERABLE:C238([SF_STOCKMOVEMENTS:193]Currency_Code:19; False:C215)
	OBJECT SET ENTERABLE:C238([SF_STOCKMOVEMENTS:193]Layer_Code:17; False:C215)
	vButtDisMov:="I DPMO  FSS R AD "
	If (STOCK_l_Context<0)
		vButtDisMov:="D DPMO  FSS R AD "
	End if 
Else 
	vButtDisMov:="I       FSS R AD "
	If (STOCK_l_Context<0)
		vButtDisMov:="D       FSS R AD "
	End if 
	
End if 
If ([SF_STOCKMOVEMENTS:193]Accounts_posted_Date:9#!00-00-00!)
	READ ONLY:C145([SF_STOCKMOVEMENT_ITEMS:194])
	For ($_l_Index; 1; Get last field number:C255(->[SF_STOCKMOVEMENTS:193]))
		$_ptr_Field:=Field:C253(Table:C252(->[SF_STOCKMOVEMENTS:193]); $_l_Index)
		OBJECT SET ENTERABLE:C238($_ptr_Field; False:C215)  //will prevent entry on screen
	End for 
	For ($_l_Index; 1; Get last field number:C255(->[SF_STOCKMOVEMENT_ITEMS:194]))
		$_ptr_Field:=Field:C253(Table:C252(->[SF_STOCKMOVEMENT_ITEMS:194]); $_l_Index)
		OBJECT SET ENTERABLE:C238($_ptr_Field; False:C215)  //will prevent entry on screen
	End for 
	OBJECT SET ENTERABLE:C238([SF_STOCKMOVEMENTS:193]Movement_Notes:23; True:C214)
	vButtDisMov:=Substring:C12(vButtDisMov; 1; 3)+"PMO"+Substring:C12(vButtDisMov; 7; 99)
	DB_MenuAction("Functions"; "Copy Current Stock"; 1; "Copy Current Inventory")
	
Else 
	If (Read only state:C362([STOCK_MOVEMENT_ITEMS:27]))
		If ((DB_GetModuleSettingByNUM(Module_StockControl)=2) | (DB_GetModuleSettingByNUM(Module_StockControl)=4))
			If (STOCK_l_Context<0)
				READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
				
			Else 
				READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				For ($_l_Index; 1; Get last field number:C255(->[SF_STOCKMOVEMENTS:193]))
					$_ptr_Field:=Field:C253(Table:C252(->[SF_STOCKMOVEMENTS:193]); $_l_Index)
					OBJECT SET ENTERABLE:C238($_ptr_Field; False:C215)  //will prevent entry on screen
				End for 
				For ($_l_Index; 1; Get last field number:C255(->[SF_STOCKMOVEMENT_ITEMS:194]))
					$_ptr_Field:=Field:C253(Table:C252(->[SF_STOCKMOVEMENT_ITEMS:194]); $_l_Index)
					OBJECT SET ENTERABLE:C238($_ptr_Field; False:C215)  //will prevent entry on screen
				End for 
				DB_MenuAction("Functions"; "QuickAdd Items"; 2; "")
			End if 
			
			//  ENABLE MENU ITEM(2050;6)
		End if 
	End if 
End if 
SF_StockINLoadItems([SF_STOCKMOVEMENTS:193]Movement_Code:2)

If (STOCK_l_Context<0)
	OBJECT SET VISIBLE:C603(SM_at_ModeStockMov; False:C215)
	$_t_PairingString:="STKItems"
	LBI_SetDRGPair(2; ->STK_LB_StockItems; $_t_PairingString)
End if 

vTot:=0
vOrdTitle:=Uppercase:C13(Term_StoWT("Stock Movement"))
If (Size of array:C274(STK_aptr_ItemPreferences)>=9)
	$_ptr_ArrayReferences:=STK_aptr_ItemPreferences{9}
	If (Size of array:C274($_ptr_ArrayReferences->)>=10)
		$_t_SubItemName:=$_ptr_ArrayReferences->{10}
		Input_Buttons(->[SF_STOCKMOVEMENTS:193]; ->vButtDisMov; "Stock Movement"; $_t_SubItemName)
	End if 
Else 
	Input_Buttons(->[SF_STOCKMOVEMENTS:193]; ->vButtDisMov)
	
End if 
DB_t_CallOnCloseorSave:="R:SF_MOvementInLPA:D:SF_MovementInCan"
If (DB_t_CurrentFormUsage="Mod")  //From by OrderDel StockP
	DB_bo_RecordModified:=True:C214
End if 
Macro_AccType("Load "+String:C10(Table:C252(->[SF_STOCKMOVEMENTS:193])))
ERR_MethodTrackerReturn("SF_MovementIN_LPB"; $_t_oldMethodName)

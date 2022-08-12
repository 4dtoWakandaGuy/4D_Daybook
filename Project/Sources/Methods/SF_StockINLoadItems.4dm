//%attributes = {}
If (False:C215)
	//Project Method Name:      SF_StockINLoadItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/09/2011 14:20 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_LB_StockItems;0)
	//ARRAY LONGINT(AL_al_ModeStock;0)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	//ARRAY TEXT(SM_at_ModeStockMov;0)
	C_BOOLEAN:C305($_bo_NewLevel; LBI_bo_RowDragged)
	C_LONGINT:C283($_l_RecordsInSelection; STOCK_l_Context; vALLevels)
	C_PICTURE:C286(STK_pic_ModeStock)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_TEXT:C284($_t_oldMethodName; $_t_SubItemName; $1; vButtDisMov)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SF_StockINLoadItems")


If (Count parameters:C259>=1)
	//AL_RemoveArrays (STK_PowerviewITEMS;1;256)`
	ARRAY POINTER:C280(STK_aptr_ItemPreferences; 0)
	LBI_bo_RowDragged:=False:C215
	
	If ($1#"")
		
		[SF_STOCKMOVEMENTS:193]Total_Cost:21:=Gen_Round(Sum:C1([SF_STOCKMOVEMENT_ITEMS:194]Total_Cost_Value:7); 2; 2)
		[SF_STOCKMOVEMENTS:193]xAccountingValue:22:=Gen_Round(Sum:C1([SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_AccountingCostTotal:41); 2; 2)
	Else 
		REDUCE SELECTION:C351([SF_STOCKMOVEMENT_ITEMS:194]; 0)
		[SF_STOCKMOVEMENTS:193]Total_Cost:21:=0
		[SF_STOCKMOVEMENTS:193]xAccountingValue:22:=0
	End if 
	
	If (Size of array:C274(STK_aptr_ItemPreferences)=0) & (vALLevels>0)
		$_bo_NewLevel:=True:C214
	Else 
		$_bo_NewLevel:=False:C215
	End if 
	$_l_RecordsInSelection:=Records in selection:C76([SF_STOCKMOVEMENT_ITEMS:194])
	FIRST RECORD:C50([SF_STOCKMOVEMENT_ITEMS:194])
	Case of 
		: (STOCK_l_Context<=0)
			LBi_ArrDefFill(->STK_aptr_ItemPreferences; ->STK_LB_StockItems; ->[SF_STOCKMOVEMENT_ITEMS:194]X_ID:1; ->[SF_STOCKMOVEMENTS:193]Movement_Code:2; "211111126"; "SF_StockItemIn"; 1; "Items"; "Item"; ""; $_bo_NewLevel)
			LBi_LoadSetup(->STK_aptr_ItemPreferences; "B")
			If (Size of array:C274(STK_aptr_ItemPreferences)>=9)
				$_ptr_ArrayReferences:=STK_aptr_ItemPreferences{9}
				If (Size of array:C274($_ptr_ArrayReferences->)>=10)
					$_t_SubItemName:=$_ptr_ArrayReferences->{10}
					In_ButtChkDis(->vButtDisMov; "Stock Movement"; $_t_SubItemName)
				End if 
			End if 
		Else 
			Case of 
				: (STOCK_l_Context=1)
					//Create an assembly template
				: (STOCK_l_Context=2)
					//Build assemblies
				: (STOCK_l_Context=3)
					//Revalue stock
			End case 
	End case 
	
	
	If ([SF_STOCKMOVEMENTS:193]Accounts_posted_Date:9#!00-00-00!) | (STOCK_l_Context<0)
		AL_al_ModeStock:=1
		SM_at_ModeStockMov:=1
		LBi_EditListLay(->STK_aptr_ItemPreferences; ->SM_at_ModeStockMov; ->STK_pic_ModeStock; ->AL_al_ModeStock; True:C214)
		AL_al_ModeStock{1}:=-1
		SM_at_ModeStockMov{1}:="No Edit"  //This prevents it being changed to edit
	End if 
	LBi_EditListLay(->STK_aptr_ItemPreferences; ->SM_at_ModeStockMov; ->STK_pic_ModeStock; ->AL_al_ModeStock)
	
	
End if 
ERR_MethodTrackerReturn("SF_StockINLoadItems"; $_t_oldMethodName)

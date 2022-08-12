//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ___Orphan___7608
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/06/2014 16:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(mChosenElement)
	//C_UNKNOWN(mCompName)
	//C_UNKNOWN(mConsolidatedPO)
	//C_UNKNOWN(mn)
	//C_UNKNOWN(mProcessType)
	//C_UNKNOWN(mSinglePO)
	//C_UNKNOWN(MTotalCost)
	//_o_Array STRING(255;SRProdCode;0)
	//_o_Array STRING(255;SRQtyT;0)
	//_o_Array STRING(255;SRSerial;0)
	//ARRAY LONGINT(STK_al_prtChooseDelivery;0)
	//Array REAL(SRAmount;0)
	//Array REAL(SRPrice;0)
	//Array REAL(SRRate;0)
	//Array TEXT(SRDesc;0)
	//ARRAY TEXT(STK_at_PrtDeliveryReferences;0)
	C_BOOLEAN:C305(STK_L_Create)
	C_REAL:C285(mi; vAmount; vPrice; vQuantity)
	C_TEXT:C284(STK_T_PrtDeliveryReference; STK_T_PrtPurchaseReference; vLocation; vProdCode; vProduct; vSerialNo)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("___Orphan___7608")

//StockMoveSel
Movt FormSR
mConsolidatedPO:=""
mSinglePO:=""
COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "StockItemSel")
If ([STOCK_MOVEMENTS:40]Movement_Type:6="PO")
	//you may need to make sure the stock items are the current selection here(query([STOCK_MOVEMENT_ITEMS];[STOCK_MOVEMENT_ITEMS]Movement_Code=[STOCK_MOVEMENTS]Movement_Code)
	ARRAY TEXT:C222(STK_at_PrtDeliveryReferences; 0)
	DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43; STK_at_PrtDeliveryReferences)
	If (Size of array:C274(STK_at_PrtDeliveryReferences)=1)
		If (STK_at_PrtDeliveryReferences{1}="")
			DELETE FROM ARRAY:C228(STK_at_PrtDeliveryReferences; 1)
		End if 
	End if 
	If (Size of array:C274(STK_at_PrtDeliveryReferences)>0)
		Gen Confirm("Print a Single or Multiple PO's from Delivery reference?"; "Multiple"; "Single")
		If (OK=1)
			mSinglePO:="Multiple PO's"
			
			ARRAY LONGINT:C221(STK_al_prtChooseDelivery; Size of array:C274(STK_at_PrtDeliveryReferences))
			mi:=1
			If (Size of array:C274(STK_at_PrtDeliveryReferences)>1)
				For (mi; 1; Size of array:C274(STK_al_prtChooseDelivery))
					STK_al_prtChooseDelivery{mi}:=mi
				End for 
				mChosenElement:=GEN_RequestViaPopUp(->STK_at_PrtDeliveryReferences; ->STK_al_prtChooseDelivery; "Select Delivery Reference to print"; False:C215; ->STK_L_Create; "Stop"; "Continue")
			Else 
				MchosenElement:=Size of array:C274(STK_at_PrtDeliveryReferences)
			End if 
			
			If (mChosenElement>0)
				STK_T_PrtDeliveryReference:=STK_at_PrtDeliveryReferences{mChosenElement}
				STK_T_PrtPurchaseReference:=[STOCK_MOVEMENTS:40]Movement_Code:1
				If (STK_T_PrtDeliveryReference#"")
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43=STK_T_PrtDeliveryReference)
				Else 
					//f it is blank then get only blank ones on this POM
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43=STK_T_PrtDeliveryReference)
				End if 
			End if 
		Else 
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
			mSinglePO:="Single PO"
		End if 
		
	Else 
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
		mSinglePO:="Single PO"
	End if 
	
End if 

//ALERT("Initial recs in Stock Items  "+String(Records in selection([STOCK_MOVEMENT_ITEMS])))
//Ask if user wants to print consolidated stock movement
Gen Confirm("Consolidate Product Codes?"; "No"; "Consolidate")
If (OK=0)
	mConsolidatedPO:="Consolidated "
	STK_SrConsolidate
	Macro("StockMoveCon")
	//End If
	
Else 
	mConsolidatedPO:="Not Consolidated"
	mn:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
	Form SRArray(mn)
	mi:=1
	FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
	MTotalCost:=0
	While (Not:C34(End selection:C36([STOCK_MOVEMENT_ITEMS:27])))
		Movt FormItLP
		SRProdCode{mi}:=vProdCode
		SRDesc{mi}:=vProduct
		SRSerial{mi}:=vSerialNo
		SRPrice{mi}:=vPrice
		SRQtyT{mi}:=vLocation
		SRRate{mi}:=vQuantity
		SRAmount{mi}:=vAmount
		MTotalCost:=MTotalCost+vAmount
		mi:=mi+1
		NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
	End while 
	FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
	Macro("StockMoveF")
End if 



mProcessType:=mSinglePO+"    "+mConsolidatedPO
//Alert("Initial recs in Stock Items  "+string(records in selection([STOCK_MOVEMENT_ITEMS]))+"   "+mProcessType)
USE NAMED SELECTION:C332("StockItemSel")
CLEAR NAMED SELECTION:C333("StockItemSel")
QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR Movement PO")
QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[STOCK_MOVEMENTS:40]Company_From:2)
QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[STOCK_MOVEMENTS:40]Company_From:2)
mCompName:=[COMPANIES:2]Company_Name:2
ERR_MethodTrackerReturn("___Orphan___7608"; $_t_oldMethodName)
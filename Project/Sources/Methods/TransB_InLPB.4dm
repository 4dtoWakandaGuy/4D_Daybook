//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/03/2010 16:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_LB_SubItems;0)
	//ARRAY BOOLEAN(ACC_LB_TransItems;0)
	//ARRAY TEXT(ACC_at_AccBatchTab;0)
	//ARRAY TEXT(ACC_at_ModeTransIn;0)
	C_BOOLEAN:C305(ACC_bo_ConsilidatedView; BAT_bo_UseAreaList)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObjectTop2; $_l_ScreenWidth; ACC_l_ItemEntryProcess; vAdd)
	C_REAL:C285(vTot; vTot2)
	C_TEXT:C284($_t_oldMethodName; DB_t_CallOnCloseorSave; vButtDisTRNB; vLayer; vTitle2; vTitle3; vTitle4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_InLPB")
vTot:=0
vTot2:=0
If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
	[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
	[TRANSACTION_BATCHES:30]Batch_Date:1:=<>DB_d_CurrentDate
	//  BatchNo
	//  If ([TRANS IN]Batch No=0)
	//   CANCEL
	//  End if
End if 
If ([TRANSACTION_BATCHES:30]State:15>0)
	DB_MenuAction("Functions"; "Copy Previous Batch"; 3; "")
	DB_MenuAction("Functions"; "Update Single-Sided Total"; 3; "")
	//DISABLE MENU ITEM(2049;3)
	// DISABLE MENU ITEM(2049;5)
Else 
	DB_MenuAction("Functions"; "Copy Previous Batch"; 3; "")
	DB_MenuAction("Functions"; "Update Single-Sided Total"; 3; "")
	
End if 
If ([TRANSACTION_BATCHES:30]Batch_Number:10#0)
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
Else 
	REDUCE SELECTION:C351([TRANSACTION_BATCH_ITEMS:155]; 0)
End if 
If ((Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0) & (vLayer#"") & (vAdd=0))
	TransB_LaySel
End if 

vTitle2:=Term_VATWT("Control VAT")
vTitle3:=Term_VATWT("Batch VAT")
vTitle4:=Term_VATWT("Value, VAT, Total")

TransB_InLPSt
If ([TRANSACTION_BATCHES:30]State:15>0)
	vButtDisTRNB:="I DPMO   SSSRCADT"
Else 
	vButtDisTRNB:="I D  O   SSSRCADT"
End if 
If ((DB_GetModuleSettingByNUM(1))=5)
	OBJECT SET ENTERABLE:C238([TRANSACTION_BATCHES:30]Reverse:14; False:C215)
	DB_MenuAction("Functions"; "Switch Access"; 3; "")
	//DISABLE MENU ITEM(2049;7)  `SA
End if 
$_l_ScreenWidth:=Screen width:C187

ARRAY TEXT:C222(ACC_at_AccBatchTab; 2)
ACC_at_AccBatchTab{1}:="Batch Items"
ACC_at_AccBatchTab{2}:="Posted Items"

If ($_l_ScreenWidth>800)
	//GOTO PAGE(2)
	
	OBJECT SET VISIBLE:C603(*; "oSubForm@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oArealist@"; True:C214)
	ARRAY TEXT:C222(ACC_at_ModeTransIn; 2)
	ACC_at_ModeTransIn{2}:="Edit"
	ACC_at_ModeTransIn{1}:="Select"
	ACC_TransLoadSubitems(ACC_bo_ConsilidatedView)
	If ([TRANSACTION_BATCHES:30]Posted_Date:16=!00-00-00!)  // | (True)
		ARRAY TEXT:C222(ACC_at_AccBatchTab; 1)
		OBJECT GET COORDINATES:C663(*; "oDescriptionField"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT GET COORDINATES:C663(ACC_LB_SubItems; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectBottom2)
		
		OBJECT MOVE:C664(ACC_LB_SubItems; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectTop; *)
		OBJECT SET VISIBLE:C603(ACC_at_AccBatchTab; False:C215)
		
	Else 
		//this is posted so load the transactions
		ACC_TransLoadTransactions
		
		ACC_at_AccBatchTab:=2
		FORM GOTO PAGE:C247(3)
		OBJECT SET VISIBLE:C603(ACC_LB_SubItems; False:C215)
		OBJECT SET VISIBLE:C603(ACC_LB_TransItems; True:C214)
		OBJECT SET VISIBLE:C603(ACC_at_AccBatchTab; True:C214)
	End if 
	
	BAT_bo_UseAreaList:=True:C214
Else 
	OBJECT SET VISIBLE:C603(*; "oSubForm@"; True:C214)
	OBJECT SET VISIBLE:C603(ACC_LB_SubItems; False:C215)
	
	//screen too narrow use the subform
	BAT_bo_UseAreaList:=False:C215
End if 

Input_Buttons(->[TRANSACTION_BATCHES:30]; ->vButtDisTRNB; "Batch"; "Batch Item")
Macro_AccType("Load "+String:C10(Table:C252(->[TRANSACTION_BATCHES:30])))

DB_t_CallOnCloseorSave:="R:TransB_InLPA:D:TransB_InLPCan"
ERR_MethodTrackerReturn("TransB_InLPB"; $_t_oldMethodName)

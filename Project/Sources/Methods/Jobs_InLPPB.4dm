//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_InLPPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 16:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(JOB_LB_OrderItems;0)
	//ARRAY LONGINT(AL_l_ModeStage;0)
	//ARRAY POINTER(JOB_aptr_LBStageSettings;0)
	//ARRAY POINTER(JOB_aPtr_OrderItemsSetup;0)
	//ARRAY TEXT(JOB_at_Modeorders;0)
	//ARRAY TEXT(JOB_at_ModeStage;0)
	C_BOOLEAN:C305(<>TermEst; vFromIn; vMod2)
	C_PICTURE:C286(<>LB_pic_ModePicture; ALModePictOrders; JOB_pic_StageEditMode)
	C_TEXT:C284($_t_oldMethodName; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLPPB")

If ([JOBS:26]x_RecordClass:50=0)
	[JOBS:26]x_RecordClass:50:=1
End if 
Jobs_InLPB
QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1)
DB_t_CallOnCloseorSave:="P:Jobs_InLPB:D:Jobs_InCan"
Jobs_InLPSort
JOB_LoadStages([JOBS:26]Job_Code:1; 4)
If ([JOBS:26]End_Date:7=!00-00-00!) | ([JOBS:26]End_Date:7>=Current date:C33(*))
	JOB_at_ModeStage:=1
	AL_l_ModeStage{1}:=-1
	JOB_at_ModeStage{1}:="No Edit"  //By leaving this saying no edit it will not change
	
	LBi_EditListLay(->JOB_aptr_LBStageSettings; ->JOB_at_ModeStage; ->JOB_pic_StageEditMode; ->AL_l_ModeStage)
	JOB_pic_StageEditMode:=<>LB_pic_ModePicture
Else 
	JOB_at_ModeStage:=1
	LBi_EditListLay(->JOB_aptr_LBStageSettings; ->JOB_at_ModeStage; ->JOB_pic_StageEditMode; ->AL_l_ModeStage)
	JOB_pic_StageEditMode:=<>LB_pic_ModePicture
End if 
//
JC_JobSetTimePostEnterability  //added 19/02/07 -kmw

JC_JobTotalArraysInit  //added 14/03/07 -kmw
JC_JobTotalArraysLoadValues  //added 14/03/07 -kmw
JC_JobTotalListBoxSetup  //added 14/03/07 -kmw
//
If (FORM Get current page:C276=3)  // `|
	Jobs_InLPOI
Else 
	If (Size of array:C274(JOB_aPtr_OrderItemsSetup)=0)
		//see also Contacts_InLPß
		LBi_ArrDefFill(->JOB_aPtr_OrderItemsSetup; ->JOB_LB_OrderItems; ->[ORDER_ITEMS:25]Item_Number:27; ->[JOBS:26]Job_Code:1; "411111126"; "Items_in"; 11; "Cost Items"; "Order Item")
		
	Else 
		OK:=1
		LBi_Prefs11(->JOB_aPtr_OrderItemsSetup)
	End if 
	LBi_LoadSetup(->JOB_aPtr_OrderItemsSetup; "B")
	
	If (JOB_at_Modeorders=0)
		JOB_at_Modeorders:=1
	End if 
	LBi_EditListLay(->JOB_aPtr_OrderItemsSetup; ->JOB_at_Modeorders; ->ALModePictOrders)
End if 

If ([JOBS:26]End_Date:7=!00-00-00!) | ([JOBS:26]End_Date:7>=Current date:C33(*))
	JOB_at_Modeorders:=2
	LBi_EditListLay(->JOB_aPtr_OrderItemsSetup; ->JOB_at_Modeorders)
	ALModePictOrders:=<>LB_pic_ModePicture
Else 
	JOB_at_Modeorders:=1
	LBi_EditListLay(->JOB_aPtr_OrderItemsSetup; ->JOB_at_Modeorders)
	ALModePictOrders:=<>LB_pic_ModePicture
End if 





vMod2:=False:C215

If ((DB_GetModuleSettingByNUM(Module_DiaryManager))<2)
	DB_MenuAction("View"; "Product"; 3; "")
	
	// DISABLE MENU ITEM(2049;4)
End if 
If (Read only state:C362([JOBS:26]))
	DB_MenuAction("Print"; ""; 3; "")
	DB_MenuAction("Functions"; ""; 3; "")
	
Else 
	If ((DB_GetModuleSettingByNUM(1))#5)
		If ((DB_GetModuleSettingByNUM(Module_StockControl))=0)
			DB_MenuAction("Functions"; "Allocate Stock"; 3; "")
			DB_MenuAction("Functions"; "View Stock Levels"; 3; "")
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_Assemblies))<2)
			DB_MenuAction("Functions"; "Trial Assembly - Display"; 3; "")
			DB_MenuAction("Functions"; "  Show Top Level Items"; 3; "")
			DB_MenuAction("Functions"; "   Show Next Level Items"; 3; "")
			
		End if 
	End if 
	If ((DB_GetModuleSettingByNUM(Module_SalesLedger)<2) | (DB_GetModuleSettingByNUM(Module_SalesLedger)=3))
		DB_MenuAction("Print"; "Proforma Invoice"; 3; "")
		DB_MenuAction("Print"; "Invoice or Credit Note"; 3; "")
		
		If ((DB_GetModuleSettingByNUM(Module_SalesLedger))<2)
			DB_MenuAction("View"; "Sales Ledger"; 3; "")
			
		End if 
	End if 
	If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders)<2) | (DB_GetModuleSettingByNUM(Module_PurchaseOrders)=3))
		
		DB_MenuAction("Print"; "Purchase Order"; 3; "")
	End if 
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
	OBJECT SET ENTERABLE:C238([JOBS:26]Currency_Code:25; False:C215)
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
	OBJECT SET ENTERABLE:C238([JOBS:26]Layer_Code:26; False:C215)
End if 

If (<>TermEst)
	DB_MenuAction("Print"; "Quotation Form"; 1; "Estimate Form")
	DB_MenuAction("Print"; "Quotation WP"; 1; "Estimate WP")
	
End if 


DB_MenuAction("Print"; "Allocate Stock"; 1; Term_StoWT("Allocate Stock"))
DB_MenuAction("Print"; "View Stock Levels"; 1; Term_StoWT("View Stock Levels"))


DB_t_CurrentFormUsage3:="Job"
vFromIn:=False:C215
Macro_AccType("Load "+String:C10(Table:C252(->[JOBS:26])))
ERR_MethodTrackerReturn("Jobs_InLPPB"; $_t_oldMethodName)
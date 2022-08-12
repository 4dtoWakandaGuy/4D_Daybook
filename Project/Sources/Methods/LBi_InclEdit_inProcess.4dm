//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_InclEdit_inProcess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	C_BOOLEAN:C305($_bo_Open; $_bo_Update; DOC_bo_DocRecordFound)
	C_LONGINT:C283($_l_CallBackProcess; $_l_EntryFormField; $_l_FieldNumber; $_l_ProcessState; $_l_RecordNumber; $_l_TableNumber; $1; $2; $4; $5; DB_l_ButtonClickedFunction)
	C_LONGINT:C283(WS_l_SelDocTemplateClass)
	C_TEXT:C284($_t_DiaryForm; $_t_DocumentType; $_t_FormReference; $_t_FormToUse; $_t_oldMethodName; $_t_ParentRecordCode; $_t_Write; $3; $6; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_InclEdit_inProcess")

//NG 21/07/06 This method is a replcement for ALincledit_Inprocess

$_l_TableNumber:=$1
$_l_FieldNumber:=$2
$_t_FormToUse:=$3
$_l_RecordNumber:=$4
$_l_CallBackProcess:=$5
If (Count parameters:C259>=6)  //NG Modified March 2004
	
	$_t_ParentRecordCode:=$6
End if 
$_t_oldMethodName:=ERR_MethodTracker("LBi_InclEdit_inProcess")
Start_Process
$_t_FormReference:=""
Case of 
		
	: ($1=Table:C252(->[CONTACTS:1]))
		GOTO RECORD:C242([CONTACTS:1]; $4)
		REDUCE SELECTION:C351([CONTACTS:1]; 1)
		//Gen_ModMid ("View Contacts";"OMaster";->[CONTACTS];->vO;"Contacts";$3;$_l_CallBackProcess)
		DBI_DisplayRecord(-Current process:C322; Table:C252(->[CONTACTS:1]); "View Contact"; [CONTACTS:1]Contact_Code:2)
		
	: ($1=Table:C252(->[DIARY:12]))
		If ($3#"LETTER")  // letter here could mean anything
			
			GOTO RECORD:C242([DIARY:12]; $4)
			If ([DIARY:12]xDiaryForm:66#"")
				$_t_DiaryForm:=[DIARY:12]xDiaryForm:66
			Else 
				If ([ACTIONS:13]Action_Code:1#[DIARY:12]Action_Code:9)
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
				End if 
				SD2_ActionAttributesToArrays
				$_l_EntryFormField:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
				If ($_l_EntryFormField>0)
					$_t_DiaryForm:=SD2_at_ActionVirtFieldDataTXT{$_l_EntryFormField}
				End if 
			End if 
			If ($_t_DiaryForm="") | ($3#"")
				
				$_t_DiaryForm:=$3
			End if 
			DBI_DisplayRecord(-Current process:C322; Table:C252(->[DIARY:12]); "View Diary"; [DIARY:12]Diary_Code:3; $_t_DiaryForm)
			
			
		Else 
			GOTO RECORD:C242([DIARY:12]; $4)
			REDUCE SELECTION:C351([DIARY:12]; 1)
			RELATE ONE:C42([DIARY:12]Document_Code:15)
			If ([DOCUMENTS:7]Document_Class:14>0)
				//The document is a template so duplicate it and change the diary first
				Case of 
					: ([DOCUMENTS:7]Document_Class:14=4D Write Letter Template)
						
						WS_l_SelDocTemplateClass:=1
						$_t_Write:=Letters_FileI(True:C214)
						$_t_FormReference:=Table name:C256(->[DOCUMENTS:7])+"_"+WIN_t_CurrentInputForm
						If ($_t_Write#"")
							$_bo_Update:=True:C214
							
							DUPLICATE RECORD:C225([DOCUMENTS:7])
							Set_DocumentCode(2; "L")
							[DOCUMENTS:7]Document_Class:14:=-(Abs:C99([DOCUMENTS:7]Document_Class:14))
							[DOCUMENTS:7]Standard:9:=False:C215
							[DOCUMENTS:7]Document_Status:15:=0
							DB_SaveRecord(->[DOCUMENTS:7])
							[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
							DB_SaveRecord(->[DIARY:12])
						End if 
					: ([DOCUMENTS:7]Document_Class:14=Text Email) | ([DOCUMENTS:7]Document_Class:14=Text Email Template)
						
						WS_l_SelDocTemplateClass:=3
						$_t_Write:=Letters_FileI(False:C215)
						
						DUPLICATE RECORD:C225([DOCUMENTS:7])
						Set_DocumentCode(2; "E")
						[DOCUMENTS:7]Document_Class:14:=-(Abs:C99([DOCUMENTS:7]Document_Class:14))
						[DOCUMENTS:7]Standard:9:=False:C215
						[DOCUMENTS:7]Document_Status:15:=0
						DB_SaveRecord(->[DOCUMENTS:7])
						[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
						DB_SaveRecord(->[DIARY:12])
						
						
						//External Document
				End case 
				
			End if 
			DOC_bo_DocRecordFound:=False:C215
			Case of 
					
				: ([DOCUMENTS:7]Document_Class:14=Text Email Template) | ([DOCUMENTS:7]Document_Class:14=Text Email)
					
					If ([DIARY:12]Document_Code:15#[DOCUMENTS:7]Document_Code:1)
						QUERY:C277([DIARY:12]; [DIARY:12]Document_Code:15=[DOCUMENTS:7]Document_Code:1)
					End if 
					DOC_bo_DocRecordFound:=True:C214
					$_t_DocumentType:="Email"
					
					$_bo_Open:=True:C214
				: ([DOCUMENTS:7]Document_Class:14=-13)  //External Document
					
					DOC_LaunchExternalDocument([DOCUMENTS:7]Document_Code:1)
					$_bo_Open:=False:C215
				: ([DOCUMENTS:7]Document_Class:14=-14)  //Advert medi(path)
					
					DOC_LaunchExternalDocument([DOCUMENTS:7]Document_Code:1)
					$_bo_Open:=False:C215
				: ([DOCUMENTS:7]Document_Class:14=-15)  //Advert Media for production
					
					DOC_LaunchExternalDocument([DOCUMENTS:7]Document_Code:1)
					$_bo_Open:=False:C215
				Else 
					DOC_bo_DocRecordFound:=True:C214
					$_bo_Open:=True:C214
					$_t_DocumentType:="Letter"
			End case 
			If ($_bo_Open)
				DBI_DisplayRecord(-Current process:C322; Table:C252(->[DIARY:12]); $_t_DocumentType)
				//[DIARY]Diary_Code)
			End if 
			
			
		End if 
		
	: ($1=Table:C252(->[ORDERS:24]))
		
		GOTO RECORD:C242([ORDERS:24]; $4)
		REDUCE SELECTION:C351([ORDERS:24]; 1)
		DBI_DisplayRecord(-Current process:C322; Table:C252(->[ORDERS:24]); "View Order")
		//[ORDERS]Order_Code)
		
		
	: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
		GOTO RECORD:C242([PURCHASE_ORDERS:57]; $4)
		REDUCE SELECTION:C351([PURCHASE_ORDERS:57]; 1)
		DBI_DisplayRecord(-Current process:C322; Table:C252(->[PURCHASE_ORDERS:57]); "View Purchase Order")
		//[PURCHASE_ORDERS]Purchase_Order_Number)
		
	: ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
		GOTO RECORD:C242([PURCHASE_ORDERS_ITEMS:169]; $4)
		REDUCE SELECTION:C351([PURCHASE_ORDERS_ITEMS:169]; 1)
		DBI_DisplayRecord(-Current process:C322; Table:C252(->[PURCHASE_ORDERS_ITEMS:169]); "View Purchase Order Item")
		//[PURCHASE_ORDERS_ITEMS]ID)
		
		
	: ($1=Table:C252(->[INVOICES:39]))
		GOTO RECORD:C242([INVOICES:39]; $4)
		REDUCE SELECTION:C351([INVOICES:39]; 1)
		DBI_DisplayRecord(-Current process:C322; Table:C252(->[INVOICES:39]); "View Invoice")
		//[INVOICES]Invoice_Number)
		
	: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
		GOTO RECORD:C242([PURCHASE_INVOICES:37]; $4)
		REDUCE SELECTION:C351([PURCHASE_INVOICES:37]; 1)
		DBI_DisplayRecord(-Current process:C322; Table:C252(->[PURCHASE_INVOICES:37]); "View Purchase")
		//[PURCHASE_INVOICES]Purchase_Code)
		
	: ($1=Table:C252(->[CONTRACTS:17]))
		GOTO RECORD:C242([CONTRACTS:17]; $4)
		REDUCE SELECTION:C351([CONTRACTS:17]; 1)
		DBI_DisplayRecord(-Current process:C322; Table:C252(->[CONTRACTS:17]); "View Contract")
		//[CONTRACTS]Contract_Code)
		
		
	: ($1=Table:C252(->[SERVICE_CALLS:20]))
		GOTO RECORD:C242([SERVICE_CALLS:20]; $4)
		REDUCE SELECTION:C351([SERVICE_CALLS:20]; 1)
		DBI_DisplayRecord(-Current process:C322; Table:C252(->[SERVICE_CALLS:20]); "View Call")
		//[SERVICE_CALLS]Call_Code)
		
	: ($1=Table:C252(->[PRODUCTS:9]))
		GOTO RECORD:C242([PRODUCTS:9]; $4)
		REDUCE SELECTION:C351([PRODUCTS:9]; 1)
		DBI_DisplayRecord(-Current process:C322; Table:C252(->[PRODUCTS:9]); "Product")
		
		//[PRODUCTS]Product_Code)
		
		
		
	: ($1=Table:C252(->[JOBS:26]))  //need to make sure correct one here!!
		
		GOTO RECORD:C242([JOBS:26]; $4)
		REDUCE SELECTION:C351([JOBS:26]; 1)
		DBI_DisplayRecord(-Current process:C322; Table:C252(->[JOBS:26]); "Job")
		//[JOBS]Job_Code)
		
		
		
	: ($1=Table:C252(->[JOB_STAGES:47]))
		GOTO RECORD:C242([JOB_STAGES:47]; $4)
		REDUCE SELECTION:C351([JOB_STAGES:47]; 1)
		DBI_DisplayRecord(-Current process:C322; Table:C252(->[JOB_STAGES:47]); "Job stage")
		//[JOB_STAGES]Job_Stage_code)
		
		
	: ($1=Table:C252(->[JOB PERSONNEL:48]))
		GOTO RECORD:C242([JOB PERSONNEL:48]; $4)
		REDUCE SELECTION:C351([PERSONNEL:11]; 1)
		DBI_DisplayRecord(-Current process:C322; Table:C252(->[JOB PERSONNEL:48]); "Job Personnel")
		//[JOB PERSONNEL]Job_Personnel_Code)
		
	: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $4)
		REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 1)
		//DBI_DisplayRecord (-Current process;Table(->[stock items]);"Stock Items")
		//[STOCK ITEMS]x_ID)
		
		If (Movements_File)
			GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $4)
			DBI_DisplayRecord(-Current process:C322; Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "")
			//[STOCK_MOVEMENT_ITEMS]Movement_Code)
		End if 
	: ($1=Table:C252(->[ORDER_ITEMS:25]))
		
		GOTO RECORD:C242([ORDER_ITEMS:25]; $4)
		DBI_DisplayRecord(-Current process:C322; Table:C252(->[ORDER_ITEMS:25]); "")
		//String([ORDER_ITEMS]x_ID))
		
End case 
If ($_t_FormReference#"")
	Close_ProWin($_t_FormReference)
End if 

Process_End

If (Count parameters:C259>=5)
	If ($_l_CallBackProcess>0)
		$_l_ProcessState:=Process state:C330($_l_CallBackProcess)
		If ($_l_ProcessState>=0)
			SET PROCESS VARIABLE:C370($_l_CallBackProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Refresh"))
			POST OUTSIDE CALL:C329($_l_CallBackProcess)
			
		End if 
		//call back to update 'parent process'(
		//if it is still running
	End if 
	
End if 
ERR_MethodTrackerReturn("LBi_InclEdit_inProcess"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SubFunctionHandler
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/02/2011 17:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_RecordSelection;0)
	//ARRAY TEXT(BAR_at_FunctionParamter;0)
	//ARRAY TEXT(BAT_at_MenuFunctions;0)
	//ARRAY TEXT(DB_at_ToolPalletteFunctions;0)
	C_BOOLEAN:C305($_bo_InRecordListing; DB_bo_InRecordListing; Proc_bo_IgnoreCalledBy; SD_bo_AgendaEnabled; SD_bo_ProcessReady)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_DisplayedForm; $_l_FrontmostProcess; $_l_FrontmostProcessState; $_l_FrontmostProcessTime; $_l_PopUpItemSelected; $_l_ProcessNumber; $_l_SelectedItemRow; $_l_UserProcessPosition; BAR_l_PopUpID; CB_l_ScheduleFullPage)
	C_LONGINT:C283(DB_l_ButtonClickedFunction; DB_l_CurrentDisplayedForm; PAL_l_PopUpID; SD_l_CompanionMenuTable; SD2_l_CallingProcess; SD2_l_TableNum; SD3_l_CallActionNum; SD3_l_DiaryActionNum; SD3_l_DiaryRelatedRecordTable; SD3_l_DiarySourceProcess)
	C_POINTER:C301($_Ptr_PopUpNumber)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ExecuteMethodName; $_t_FunctionParameter; $_t_ObjectFunction; $_t_oldMethodName; $_t_ProcessName; $_t_SDProcessName; $_t_SelectedItem; DB_t_CallOnCloseorSave; PAL_t_PopUpSelected; SD2_t_TabFunction)
	C_TEXT:C284(SD3_t_DiaryRelatedRecord; SD3_t_DiaryRelatedRecordCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SubFunctionHandler")
Case of 
	: (PAL_l_PopUpID>0)
		$_Ptr_PopUpNumber:=Get pointer:C304("PAL_at_PopUpMenu"+String:C10(PAL_l_PopUpID))
		$_t_SelectedItem:=PAL_t_PopUpSelected
		$_l_SelectedItemRow:=Find in array:C230($_Ptr_PopUpNumber->; $_t_SelectedItem)
		$_l_DisplayedForm:=DB_l_CurrentDisplayedForm
		$_bo_InRecordListing:=DB_bo_InRecordListing
		DB_bo_InRecordListing:=False:C215
		If ($_l_SelectedItemRow>0)  //the string exists
			//The purpose of this is so the function string is standardized. The name on screen can be set to anthing
			//also the way the function gets called is naturally hard coded
			$_Ptr_PopUpNumber:=Get pointer:C304("PAL_at_Function"+String:C10(PAL_l_PopUpID))
			$_t_ObjectFunction:=$_Ptr_PopUpNumber->{$_l_SelectedItemRow}
			$_l_FrontmostProcess:=Frontmost process:C327(*)
			Case of 
				: ($_t_ObjectFunction="DeleteRecord")  //Same as clicking the delete button
					
					SET PROCESS VARIABLE:C370($_l_FrontmostProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Delete"))
					
					POST OUTSIDE CALL:C329($_l_FrontmostProcess)
				: ($_t_ObjectFunction="DeleteSubrecord")  //Same as clicking the remove button
					SET PROCESS VARIABLE:C370($_l_FrontmostProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Minus"))
					POST OUTSIDE CALL:C329($_l_FrontmostProcess)
					
				: ($_t_ObjectFunction="Further Fields")
					SET PROCESS VARIABLE:C370($_l_FrontmostProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Diary"))  //Really!!
					POST OUTSIDE CALL:C329($_l_FrontmostProcess)
				: ($_t_ObjectFunction="Qualities")
					SET PROCESS VARIABLE:C370($_l_FrontmostProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction(DB_at_ToolPalletteFunctions{29}))
					
					POST OUTSIDE CALL:C329($_l_FrontmostProcess)
				: ($_t_ObjectFunction="Enter Company")
					//now it may that i want to modify some behaviour  here so that we can use this to enter job for the currenly viewed company
					//ZProc ("Companies_In";◊K3;"Enter Companies")
					DB_MenuNewRecord(Table name:C256(Table:C252(->[COMPANIES:2])))
				: ($_t_ObjectFunction="View Companies")
					DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[COMPANIES:2])))
					//ZProc ("Companies_Mod";◊K3;"View Companies")
				: ($_t_ObjectFunction="Enter Project")
					DB_MenuNewRecord(Table name:C256(Table:C252(->[PROJECTS:89])))
					
				: ($_t_ObjectFunction="View Projects")
					//ZProc ("Projects_Mod";◊K4;"View Projects")
					DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PROJECTS:89])))
				: ($_t_ObjectFunction="Enter Job")
					DB_MenuNewRecord(Table name:C256(Table:C252(->[JOBS:26])))
					
				: ($_t_ObjectFunction="View Jobs")
					
					DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[JOBS:26])))
				: ($_t_ObjectFunction="Enter Contact")
					//ZProc ("Contacts_In";◊K3;"Enter Contacts")
					DB_MenuNewRecord(Table name:C256(Table:C252(->[CONTACTS:1])))
					
				: ($_t_ObjectFunction="VIew Contacts")
					DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CONTACTS:1])))
					//ZProc ("Contacts_Mod";◊K3;"View Contacts")
				: ($_t_ObjectFunction="Enter Enquiry")
					DB_MenuNewRecord("OrdersEnquiry")
					
				: ($_t_ObjectFunction="Enter Quotation")
					DB_MenuNewRecord("OrdersQuotation")
					
				: ($_t_ObjectFunction="View Enquiries")
					DBI_MenuDisplayRecords("OrdersEnquiries")
					//ZProc ("Orders_View";◊K3;Term_OrdWT ("View SalesBook"))
				: ($_t_ObjectFunction="Enter Order") | ($_t_ObjectFunction="Enter Sales Order")
					DB_MenuNewRecord(Table name:C256(Table:C252(->[ORDERS:24])))
					
				: ($_t_ObjectFunction="View Orders")
					DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[ORDERS:24])))
					//ZProc ("Orders_Mod";◊K4;"View Sales Orders")
				: ($_t_ObjectFunction="View Order Items")
					DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[ORDER_ITEMS:25])))
					//ZProc ("OrderI_Mod";◊K4;"View Order Items")
					
				: ($_t_ObjectFunction="Enter Product")
					DB_MenuNewRecord(Table name:C256(Table:C252(->[PRODUCTS:9])))
				: ($_t_ObjectFunction="View Products")
					DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PRODUCTS:9])))
					//ZProc ("Products_Mod";◊K2;"View Products")
				: ($_t_ObjectFunction="Enter Purchase Order")
					DB_MenuNewRecord(Table name:C256(Table:C252(->[PURCHASE_ORDERS:57])))
					
					
				: ($_t_ObjectFunction="View Purchase Orders")
					DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PURCHASE_ORDERS:57])))
					
				: ($_t_ObjectFunction="Enter Purchase Invoice")
					DB_MenuNewRecord(Table name:C256(Table:C252(->[PURCHASE_INVOICES:37])))
					
				: ($_t_ObjectFunction="View Purchase Ledger")
					DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PURCHASE_INVOICES:37])))
					//ZProc ("Purchases_Mod";◊K2;Term_SLPLWT ("View Purchase Ledger"))
				: ($_t_ObjectFunction="Enter Purchase Payment")
					DB_MenuNewRecord("PurchasesPayment")
					
				: ($_t_ObjectFunction="Enter Adhoc Invoice")
					DB_MenuNewRecord(Table name:C256(Table:C252(->[INVOICES:39])))
					
				: ($_t_ObjectFunction="View Sales Ledger")
					
					DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[INVOICES:39])))
				: ($_t_ObjectFunction="Enter Invoice Receipt")
					DBI_MenuDisplayRecords("InvoicesReceipt")
					
				: ($_t_ObjectFunction="Enter Transaction Batch")
					DB_MenuNewRecord(Table name:C256(Table:C252(->[TRANSACTION_BATCHES:30])))
					
				: ($_t_ObjectFunction="View Batches")
					DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[TRANSACTION_BATCHES:30])))
					
					
					
					//ZProc ("TransB_Mod";◊K2;"View Batches")
				: ($_t_ObjectFunction="Enter Contract") | ($_t_ObjectFunction="Enter Contracts")
					DB_MenuNewRecord(Table name:C256(Table:C252(->[CONTRACTS:17])))
					
				: ($_t_ObjectFunction="View Contracts")
					DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[CONTRACTS:17]))))
					//ZProc ("Contracts_Mod";◊K3;"View Contracts")
				: ($_t_ObjectFunction="Enter Service Call")
					DB_MenuNewRecord(Table name:C256(Table:C252(->[SERVICE_CALLS:20])))
					
				: ($_t_ObjectFunction="View Service Calls")
					DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[SERVICE_CALLS:20])))
					//ZProc ("Calls_Mod";◊K3;"View Calls")
				: ($_t_ObjectFunction="Enter Letter")
					DB_MenuNewRecord("DiaryLetter")
					
				: ($_t_ObjectFunction="Enter Email")
					DB_MenuNewRecord("DiaryEmail")
					
				: ($_t_ObjectFunction="View Letters and Emailsl")
					//ZProc ("Diary_ModL";◊K4;"View Letters & "+Term_OrdWT ("Quotes"))
					DBI_MenuDisplayRecords("DiaryLetters")
				: ($_t_ObjectFunction="Enter Movement")
					DB_MenuNewRecord(Table name:C256(Table:C252(->[STOCK_MOVEMENTS:40])))
					
				: ($_t_ObjectFunction="View Movements")
					DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[COMPANIES:2])))
					//ZProc ("Movements_Mod";◊K3;"View Movements")
				: ($_t_ObjectFunction="Enter Diary")  // this will have a multiple actions. The action codes will be in a seperate array
					If (False:C215)
						$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
						$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
						PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_FrontmostProcessState; $_l_FrontmostProcessTime)
						If ($_l_FrontmostProcessState<0)
							$_l_ProcessNumber:=0
							$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
						End if 
						
						
						If ($_l_ProcessNumber>0)
							SD3_l_CallActionNum:=4
							PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_FrontmostProcessState; $_l_FrontmostProcessTime)
							If ($_l_FrontmostProcessState>=0)  // 29/05/02
								SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
								SHOW PROCESS:C325($_l_ProcessNumber)
								RESUME PROCESS:C320($_l_ProcessNumber)
								BRING TO FRONT:C326($_l_ProcessNumber)
								If (Application type:C494#4D Server:K5:6)
									POST OUTSIDE CALL:C329($_l_ProcessNumber)
								End if 
							End if 
							SD3_l_CallActionNum:=0
							
						Else 
							ZDiary_Mod
							Repeat 
								DelayTicks(10)
								$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
								$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
								$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
							Until ($_l_ProcessNumber>0)
							PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_FrontmostProcessState; $_l_FrontmostProcessTime)
							SD3_l_CallActionNum:=4
							PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_FrontmostProcessState; $_l_FrontmostProcessTime)
							If ($_l_FrontmostProcessState>=0)  // 29/05/02
								SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
								SHOW PROCESS:C325($_l_ProcessNumber)
								RESUME PROCESS:C320($_l_ProcessNumber)
								BRING TO FRONT:C326($_l_ProcessNumber)
								If (Application type:C494#4D Server:K5:6)
									POST OUTSIDE CALL:C329($_l_ProcessNumber)
								End if 
							End if 
							SD3_l_CallActionNum:=0
						End if 
					Else 
						SD_bo_AgendaEnabled:=True:C214
						CB_l_ScheduleFullPage:=1
						SD_AutoAddRec(""; Current date:C33(*); Current time:C178(*))
					End if 
					
				: ($_t_ObjectFunction="Enter Related Diary")  // a pop-up item relating to the tab on the current fronmost screen
					$_l_FrontmostProcess:=Frontmost process:C327(*)
					If ($_l_FrontmostProcess>0)
						SET PROCESS VARIABLE:C370($_l_FrontmostProcess; SD2_t_TabFunction; $_Ptr_PopUpNumber->{$_l_SelectedItemRow})
						SET PROCESS VARIABLE:C370($_l_FrontmostProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Enter Related Diary"))
						
						POST OUTSIDE CALL:C329($_l_FrontmostProcess)
					End if 
				: ($_t_ObjectFunction="View Diary")  // This will have others as there will be mulitple diary types in the system
					
					$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
					$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
					PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_FrontmostProcessState; $_l_FrontmostProcessTime)
					If ($_l_FrontmostProcessState<0)
						$_l_ProcessNumber:=0
						$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
					End if 
					DB_t_CallOnCloseorSave:="File"
					If (SD3_l_CallActionNum>0)
						If ($_l_ProcessNumber>0)
							
							
							
							PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_FrontmostProcessState; $_l_FrontmostProcessTime)
							If ($_l_FrontmostProcessState>=0)  // 29/05/02
								SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_t_DiaryRelatedRecordCode; SD3_t_DiaryRelatedRecord)
								SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiarySourceProcess; Current process:C322)
								SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryRelatedRecordTable; SD_l_CompanionMenuTable)
								SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
								SHOW PROCESS:C325($_l_ProcessNumber)
								RESUME PROCESS:C320($_l_ProcessNumber)
								BRING TO FRONT:C326($_l_ProcessNumber)
								If (Application type:C494#4D Server:K5:6)
									POST OUTSIDE CALL:C329($_l_ProcessNumber)
								End if 
							End if 
						Else 
							ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_SDProcessName)
							Repeat 
								DelayTicks(10)
								$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
								$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
								$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
							Until ($_l_ProcessNumber>0)
							SD3_l_CallActionNum:=4
							PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_FrontmostProcessState; $_l_FrontmostProcessTime)
							If ($_l_FrontmostProcessState>=0)  // 29/05/02
								SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
								SHOW PROCESS:C325($_l_ProcessNumber)
								RESUME PROCESS:C320($_l_ProcessNumber)
								BRING TO FRONT:C326($_l_ProcessNumber)
								If (Application type:C494#4D Server:K5:6)
									POST OUTSIDE CALL:C329($_l_ProcessNumber)
								End if 
							End if 
							SD3_l_CallActionNum:=0
						End if 
						
					Else 
						If ($_l_ProcessNumber>0)
							SD3_l_CallActionNum:=9
							PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_FrontmostProcessState; $_l_FrontmostProcessTime)
							If ($_l_FrontmostProcessState>=0)  // 29/05/02
								SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
								SHOW PROCESS:C325($_l_ProcessNumber)
								RESUME PROCESS:C320($_l_ProcessNumber)
								BRING TO FRONT:C326($_l_ProcessNumber)
								If (Application type:C494#4D Server:K5:6)
									POST OUTSIDE CALL:C329($_l_ProcessNumber)
								End if 
							End if 
							SD3_l_CallActionNum:=0
						Else 
							ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_SDProcessName)
						End if 
					End if 
				: ($_t_ObjectFunction="View Related Diary")  // a pop-up item relating to the tab on the current fronmost screen
					//unlike enter related diary this needs to open a related record of the class assosicateed with the tab, related to the record on screen.
					//but the user may not  have the tab showing so no record is selected..so like view diarythis has to open the diary with a list of related records...
					//this will open the dairy history window
					//First we must get the correct selection of records..as we would for that tab on the current record
					//we do this by asking the frontmost process to do the work
					$_l_FrontmostProcess:=Frontmost process:C327(*)
					If ($_l_FrontmostProcess>0)
						ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
						SD2_l_TableNum:=0  //This will be returned
						SET PROCESS VARIABLE:C370($_l_FrontmostProcess; SD2_t_TabFunction; $_Ptr_PopUpNumber->{$_l_SelectedItemRow})
						//SET PROCESS VARIABLE($_l_FrontmostProcess;DB_l_ButtonClickedFunction;513)
						SET PROCESS VARIABLE:C370($_l_FrontmostProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("View Related Diary"))
						
						SET PROCESS VARIABLE:C370($_l_FrontmostProcess; SD2_l_CallingProcess; Current process:C322)
						POST OUTSIDE CALL:C329($_l_FrontmostProcess)
						While (SD2_l_TableNum=0)
							DelayTicks(3)
						End while 
						//we now have a longint array of a selection and a table number(Not the table numbero f the selection-that is always diary)
						If (Size of array:C274(SD_al_RecordSelection)>0)
							SD_bo_ProcessReady:=False:C215
							$_l_FrontmostProcess:=ZProc_withReply("SD2_Diary_Mod"; DB_ProcessMemoryinit(4); "View Diary"; "GetCurrentSelection"; String:C10(Current process:C322))
							While (SD_bo_ProcessReady=False:C215)
								DelayTicks(3)
							End while 
							SD2_l_TableNum:=Table:C252(->[COMPANIES:2])
							VARIABLE TO VARIABLE:C635($_l_FrontmostProcess; SD_al_RecordSelection; SD_al_RecordSelection; SD2_l_TableNum; SD2_l_TableNum)
							
							SET PROCESS VARIABLE:C370($_l_FrontmostProcess; SD_bo_ProcessReady; True:C214)
							ARRAY LONGINT:C221(SD_al_RecordSelection; 0)  //Free the memory
						Else 
							Gen_Alert("There are no diary records of that type related to the current on screen record")
						End if 
					End if   //No runing process(an error really)
					
				: ($_t_ObjectFunction="Enter Target")
					
					
					$_l_FrontmostProcess:=New process:C317("SP_NewTarget"; DB_ProcessMemoryinit(1); "Enter Target"; True:C214; False:C215)
					
				: ($_t_ObjectFunction="Enter Pipeline")
					
					$_l_ProcessNumber:=Frontmost process:C327(*)
					
					PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_FrontmostProcessState; $_l_FrontmostProcessTime)
					$_l_UserProcessPosition:=Position:C15("User"; $_t_ProcessName)
					If ($_l_UserProcessPosition=0)
						SET PROCESS VARIABLE:C370($_l_FrontmostProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction(DB_at_ToolPalletteFunctions{32}))
						
						
						POST OUTSIDE CALL:C329($_l_ProcessNumber)
					Else 
						//  there is no process showing
						
						$_l_FrontmostProcess:=New process:C317("SP_NewPipeline"; DB_ProcessMemoryinit(1); "Enter Sales Pipeline"; True:C214; <>PER_l_CurrentUserID)
						
						
					End if 
					
					
					
				Else 
					//TRACE
					
					
					
			End case 
		End if 
		DB_bo_InRecordListing:=$_bo_InRecordListing
		DB_l_CurrentDisplayedForm:=$_l_DisplayedForm
		
	: (BAR_l_PopUpID>0)
		//TRACE
		$_l_PopUpItemSelected:=BAR_l_PopUpID
		If ($_l_PopUpItemSelected<=Size of array:C274(BAT_at_MenuFunctions))
			Proc_bo_IgnoreCalledBy:=True:C214
			$_t_ObjectFunction:=BAT_at_MenuFunctions{$_l_PopUpItemSelected}
			$_t_FunctionParameter:=BAR_at_FunctionParamter{$_l_PopUpItemSelected}
			If ($_t_ObjectFunction#"")
				If ($_t_ObjectFunction[[1]]="*")
					//Run in a process
					$_t_ObjectFunction:=Substring:C12($_t_ObjectFunction; 2)
					If ($_t_FunctionParameter#"")
						$_l_FrontmostProcess:=New process:C317($_t_ObjectFunction; DB_ProcessMemoryinit(2); "Menu_Process"+$_t_ObjectFunction; $_t_FunctionParameter)
					Else 
						$_l_FrontmostProcess:=New process:C317($_t_ObjectFunction; DB_ProcessMemoryinit(2); "Menu_Process"+$_t_ObjectFunction)
					End if 
				Else 
					If ($_t_FunctionParameter#"")
						$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($_t_ObjectFunction)
						EXECUTE METHOD:C1007($_t_ExecuteMethodName; *; $_t_FunctionParameter)
						
						//EXECUTE FORMULA($_t_ObjectFunction+"("+Char(34)+$_t_FunctionParameter+Char(34)+")")
					Else 
						$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($_t_ObjectFunction)
						EXECUTE METHOD:C1007($_t_ExecuteMethodName)
						
						//EXECUTE FORMULA($_t_ObjectFunction)
					End if 
				End if 
			End if 
			Proc_bo_IgnoreCalledBy:=False:C215
		End if 
		DB_l_ButtonClickedFunction:=0
		
End case 
ERR_MethodTrackerReturn("DB_SubFunctionHandler"; $_t_oldMethodName)

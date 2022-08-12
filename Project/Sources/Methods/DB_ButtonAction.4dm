//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ButtonAction
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  08/08/2010 18:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_ButtonsAssigned;0)
	//ARRAY TEXT(DB_at_ToolPalletteFunctions;0)
	C_BOOLEAN:C305(<>DB_bo_FunctionOrder; $_bo_breakloop; DB_bo_DuringInsideCall; DB_bo_DuringOutsideCall; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283(<>MENU_l_BarModule; <>PER_l_CurrentUserID; <>SD3_l_DiaryVersion; <>SYS_l_WorkflowProcess; $_l_ButtonAssignedPosition; $_l_ButtonNumber; $_l_FrontMostProcess; $_l_NewPipeline; $_l_ProcessCallID; $_l_ProcessNumber; $_l_ProcessState)
	C_LONGINT:C283($_l_ProcessTime; $_l_Retries; $_l_UserPosition; DB_l_ButtonClickedFunction; SD3_l_DiaryActionNum; SD3_l_DiarySourceProcess)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ButtonDisabled; $_t_oldMethodName; $_t_ProcessName; $_t_SDProcessName; $1; DB_t_CallOnCloseorSave; PAL_BUTTON; vButtDis)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ButtonAction")
If (Count parameters:C259>=1)
	If (PAL_bo_ButtonSubFunction=False:C215)
		$_t_ButtonDisabled:=$1
		$_l_ButtonNumber:=Num:C11(PAL_BUTTON)
		$_l_ButtonAssignedPosition:=Find in array:C230(DB_al_ButtonsAssigned; $_l_ButtonNumber)
		If ($_l_ButtonAssignedPosition>0)
			$_l_ButtonNumber:=$_l_ButtonAssignedPosition
		Else 
			$_l_ButtonNumber:=0
		End if 
		PAL_BUTTON:=""
		$_l_ProcessNumber:=Current process:C322
		
		PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
		Case of 
			: ($_l_ButtonNumber=1)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=2)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("OK")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=3)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Minus")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=4)
				If (Substring:C12($_t_ButtonDisabled; 1; 1)="I")
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				Else 
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				End if 
			: ($_l_ButtonNumber=5)
				If (Substring:C12($_t_ButtonDisabled; 1; 1)="I")
					If (Substring:C12($_t_ButtonDisabled; 5; 1)#"M")
						DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Minus")
						POST OUTSIDE CALL:C329($_l_ProcessNumber)
					End if 
				Else 
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Minus")
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				End if 
			: ($_l_ButtonNumber=6)
				If (Substring:C12($_t_ButtonDisabled; 1; 1)="I")
					If (Substring:C12($_t_ButtonDisabled; 6; 1)#"O")
						DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Open")
						POST OUTSIDE CALL:C329($_l_ProcessNumber)
					End if 
				Else 
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Open")
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				End if 
			: ($_l_ButtonNumber=7)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Previous")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=8)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Next")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=9)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("First")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=10)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Last")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=11)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Select")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=12)
				//TRACE
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Find")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=13)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Sort")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=14)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Set")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=15)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Report")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=16)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Graph")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=17)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Apply")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=18)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Count")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=19)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Tel")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=20)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Diary")
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=21)
				DB_MenuNewRecord(Table name:C256(Table:C252(->[COMPANIES:2])))
				
			: ($_l_ButtonNumber=22)
				DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[COMPANIES:2]))))
				
			: ($_l_ButtonNumber=23)
				DB_MenuNewRecord(Table name:C256(Table:C252(->[CONTACTS:1])))
				//ZProc ("Contacts_In";◊K3;"Enter Contacts")
			: ($_l_ButtonNumber=24)
				DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CONTACTS:1])))
				
				//ZProc ("Contacts_Mod";◊K3;"View Contacts")
			: ($_l_ButtonNumber=25)
				If (<>DB_bo_FunctionOrder)
					If (((DB_GetModuleSettingByNUM(Module_SalesOrders))=2) | ((DB_GetModuleSettingByNUM(Module_SalesOrders))=4))
						If (<>MENU_l_BarModule=10)
							//ZProc ("Order_In";◊K4;"Enter Event Orders")
						Else 
							DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[ORDERS:24])))
							//ZProc ("Order_In";◊K4;"Enter Sales Orders")
						End if 
					Else 
						If (((DB_GetModuleSettingByNUM(Module_Enquiries))=2) | ((DB_GetModuleSettingByNUM(Module_Enquiries))=4))
							DBI_MenuDisplayRecords("OrdersEnquiries")
							//ZProc ("Order_InE";◊K3;Term_OrdWT ("Enter Enquiries"))
						Else 
							DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[PRODUCTS:9]))))
							//ZProc ("Products_In";◊K2;"Enter Products")
						End if 
					End if 
				Else 
					DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[PRODUCTS:9]))))
					//ZProc ("Products_In";◊K2;"Enter Products")
				End if 
			: ($_l_ButtonNumber=26)
				If (<>DB_bo_FunctionOrder)
					If (((DB_GetModuleSettingByNUM(Module_SalesOrders))=2) | ((DB_GetModuleSettingByNUM(Module_SalesOrders))=4))
						If (<>MENU_l_BarModule=10)
							//ZProc ("Orders_Mod";◊K4;"View Event Orders")
						Else 
							DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[ORDERS:24])))
							//ZProc ("Orders_Mod";◊K4;"View Sales Orders")
						End if 
					Else 
						If (((DB_GetModuleSettingByNUM(Module_Enquiries))=2) | ((DB_GetModuleSettingByNUM(Module_Enquiries))=4))
							DBI_MenuDisplayRecords("OrdersEnquiries")
							//ZProc ("Orders_View";◊K3;Term_OrdWT ("View Enq, Qtn, Ord"))
						Else 
							DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PRODUCTS:9])))
							//ZProc ("Products_Mod";◊K2;"View Products")
						End if 
					End if 
				Else 
					DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PRODUCTS:9])))
					//ZProc ("Products_Mod";◊K2;"View Products")
				End if 
			: ($_l_ButtonNumber=27)
				//ZProc ("Diary_In";◊K4;"Enter to Diary")`old code
				//◊WT_Initial:=0  `process was initiated from the button bar
				Case of 
					: (<>SD3_l_DiaryVersion=0) | (Macintosh option down:C545) | (Windows Alt down:C563)  //use old diary manager
						DB_MenuNewRecord(Table name:C256(Table:C252(->[DIARY:12])))
						//ZProc ("Diary_In";◊K4;"Enter to Diary")
						//Repeated in Functions Palette
					: (<>SD3_l_DiaryVersion=1)  //use SuperDiary manager
						If (False:C215)
							
							$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
							$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
							PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
							If ($_l_ProcessState<0)
								$_l_ProcessNumber:=0
								$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
							End if 
							DB_t_CallOnCloseorSave:="File"
							vButtDis:="A DPMONPFSSSRCADT"
							Input_Buttons(->[USER:15]; ->vButtDis)
							If ($_l_ProcessNumber>0)
								
								$_l_ProcessCallID:=4
								
								PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
								If ($_l_ProcessState>=0)  // 30/05/02
									$_l_ProcessCallID:=88
									$_l_Retries:=0
									While ($_l_ProcessCallID>0) & ($_l_Retries<100)
										GET PROCESS VARIABLE:C371($_l_ProcessNumber; SD3_l_DiaryActionNum; $_l_ProcessCallID)
										If ($_l_ProcessCallID>0)
											$_l_Retries:=$_l_Retries+1
											DelayTicks(10*(1+$_l_Retries))
											
										End if 
									End while 
									
									SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; $_l_ProcessCallID)
									SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiarySourceProcess; Current process:C322)
									POST OUTSIDE CALL:C329($_l_ProcessNumber)
									//SHOW PROCESS($_l_ProcessNumber)
									//RESUME PROCESS($_l_ProcessNumber)
									//BRING TO FRONT($_l_ProcessNumber)
								End if 
								$_l_Retries:=0
								Repeat 
									
									GET PROCESS VARIABLE:C371($_l_ProcessNumber; SD3_l_DiaryActionNum; $_l_ProcessCallID)
									If ($_l_ProcessCallID>0)
										$_l_Retries:=$_l_Retries+1
										DelayTicks(2*(1+$_l_Retries))
									End if 
								Until ($_l_ProcessCallID=0) | ($_l_Retries>100)
								$_l_ProcessCallID:=0
							Else 
								$_l_FrontMostProcess:=Frontmost process:C327(*)
								ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_SDProcessName)
								
								$_bo_breakloop:=True:C214
								DB_bo_DuringInsideCall:=True:C214
								SET PROCESS VARIABLE:C370($_l_ProcessNumber; DB_bo_DuringInsideCall; DB_bo_DuringInsideCall)
								$_l_Retries:=0
								Repeat 
									$_l_Retries:=$_l_Retries+1
									DelayTicks(2*(1+$_l_Retries))
									$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
									$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
									$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
									If ($_l_ProcessNumber>0)
										PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
										$_bo_breakloop:=($_l_ProcessState=Waiting for input output:K13:7) | ($_l_ProcessState=Waiting for user event:K13:9)
									Else 
										$_bo_breakloop:=True:C214
									End if 
								Until (($_l_ProcessNumber>0) & ($_bo_breakloop)) | ($_l_ProcessState<0)
								
								
								PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
								If ($_l_ProcessState>=0)  // 30/05/02
									
									
									$_l_Retries:=0
									Repeat 
										$_l_Retries:=$_l_Retries+1
										DelayTicks(2*(1+$_l_Retries))  //added 16/08/06 -kmw
										
										GET PROCESS VARIABLE:C371($_l_ProcessNumber; SD3_l_DiaryActionNum; $_l_ProcessCallID)
										GET PROCESS VARIABLE:C371($_l_ProcessNumber; DB_bo_DuringOutsideCall; DB_bo_DuringOutsideCall)
										GET PROCESS VARIABLE:C371($_l_ProcessNumber; DB_bo_DuringInsideCall; DB_bo_DuringInsideCall)
										POST OUTSIDE CALL:C329($_l_ProcessNumber)
										
										
										//added "| ($_l_Retries=100)" to until condition 16/08/06 -kmw
									Until (($_l_ProcessCallID=0) & (DB_bo_DuringOutsideCall=False:C215)) | ($_l_Retries=100)  // & (DB_bo_DuringInsideCall=False)  ` | ($_l_Retries>100)
									
									$_l_ProcessCallID:=4
									SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiarySourceProcess; Current process:C322)  //bsw 26/05/04
									SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; $_l_ProcessCallID)
									
									SHOW PROCESS:C325($_l_ProcessNumber)
									RESUME PROCESS:C320($_l_ProcessNumber)
									BRING TO FRONT:C326($_l_ProcessNumber)
									POST OUTSIDE CALL:C329($_l_ProcessNumber)  //bsw 26/05/04 must otherwise SD3_l_DiaryActionNum in Diary proc is not uptodate -Orders 4
									
									//bsw 26/05/04 added code below
									$_l_Retries:=0
									Repeat 
										GET PROCESS VARIABLE:C371($_l_ProcessNumber; SD3_l_DiaryActionNum; $_l_ProcessCallID)
										POST OUTSIDE CALL:C329($_l_ProcessNumber)
										$_l_Retries:=$_l_Retries+1
									Until ($_l_ProcessCallID=0) | ($_l_Retries>100)
									//bsw 26/05/04 added code above
									$_l_ProcessCallID:=0
								End if 
								
							End if 
						Else 
							DB_MenuNewRecord(Table name:C256(Table:C252(->[DIARY:12])))
							//ZProc ("Diary_In";◊K4;"Enter to Diary")
						End if 
				End case 
				
			: ($_l_ButtonNumber=28)
				If (Gen_Option)
					
				Else 
					If (<>SYS_l_WorkflowProcess=0)
						
						<>SYS_l_WorkflowProcess:=ZProc_withReply("SD2_workflow_Mod"; DB_ProcessMemoryinit(4); "Tasks awaiting actions")
					Else 
						SHOW PROCESS:C325(<>SYS_l_WorkflowProcess)
						
						BRING TO FRONT:C326(<>SYS_l_WorkflowProcess)
					End if 
				End if 
			: ($_l_ButtonNumber=29)  //show qualities
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction(DB_at_ToolPalletteFunctions{29})
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=30)  //search
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction(DB_at_ToolPalletteFunctions{30})
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			: ($_l_ButtonNumber=31)  //view pipeline
				
				$_l_UserPosition:=Position:C15("User"; $_t_ProcessName)
				If ($_l_UserPosition=0)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction(DB_at_ToolPalletteFunctions{31})
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				Else 
					//there is no process showing
					//so call to show the whole thing
					
					ZSalesPipeline
				End if 
				
				
			: ($_l_ButtonNumber=32)  //Enter  pipeline
				
				$_l_UserPosition:=Position:C15("User"; $_t_ProcessName)
				If ($_l_UserPosition=0)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction(DB_at_ToolPalletteFunctions{32})
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				Else 
					//  there is no process showing
					
					$_l_NewPipeline:=New process:C317("SP_NewPipeline"; DB_ProcessMemoryinit(1); "Enter Sales Pipeline"; True:C214; <>PER_l_CurrentUserID)
					
					
				End if 
				
			: ($_l_ButtonNumber=33)  //Enter  Target
				
				$_l_NewPipeline:=New process:C317("SP_NewTarget"; DB_ProcessMemoryinit(1); "Enter Target"; True:C214; False:C215)
				
				
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("DB_ButtonAction"; $_t_oldMethodName)
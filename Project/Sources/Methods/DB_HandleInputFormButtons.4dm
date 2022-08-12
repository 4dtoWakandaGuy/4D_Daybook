//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_HandleInputFormButtons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/09/2010 11:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_ButtonsAssigned;0)
	//ARRAY TEXT(DB_at_ToolPalletteFunctions;0)
	C_BOOLEAN:C305(<>DB_bo_FunctionOrder; $_bo_MakeCall; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283(<>MENU_l_BarModule; <>PER_l_CurrentUserID; <>SYS_l_WorkflowProcess; $_l_ButtonAssignedPosition; $_l_ButtonNumber; $_l_NewPipelineProcess; $_l_NewTargetProcess; $_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; $_l_UserPosition)
	C_LONGINT:C283($2; DB_l_ButtonClickedFunction)
	C_TEXT:C284($_t_ButtonName; $_t_oldMethodName; $_t_ProcessName; $1; PAL_BUTTON)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_HandleInputFormButtons")
If (Count parameters:C259>=1)
	If ($1#"")
		$_t_ButtonName:=$1
		If (PAL_bo_ButtonSubFunction=False:C215)
			
			$_l_ButtonNumber:=Num:C11($_t_ButtonName)
			$_l_ButtonAssignedPosition:=Find in array:C230(DB_al_ButtonsAssigned; $_l_ButtonNumber)
			If ($_l_ButtonAssignedPosition>0)
				$_l_ButtonNumber:=$_l_ButtonAssignedPosition
			Else 
				//$_l_ButtonNumber:=0
			End if 
			PAL_BUTTON:=""
			If (Count parameters:C259<2)
				
				$_l_ProcessNumber:=Current process:C322
			Else 
				$_l_ProcessNumber:=$2
			End if 
			//Frontmost process(*)
			$_bo_MakeCall:=False:C215
			PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			Case of 
				: ($_l_ButtonNumber=1)
					
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel")
					$_bo_MakeCall:=True:C214
					
				: ($_l_ButtonNumber=2)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("OK")
					
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=3)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Delete")
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=103)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Delete")
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=4)
					If (Substring:C12($_t_ButtonName; 1; 1)="I")
						If (Substring:C12($_t_ButtonName; 4; 1)#"P")
							//NG Changing this nasty stuff for 5.4-handle in outside call
							//Forms affected
							DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")
							$_bo_MakeCall:=True:C214
						End if 
					Else 
						DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")
						$_bo_MakeCall:=True:C214
					End if 
				: ($_l_ButtonNumber=5)
					If (Substring:C12($_t_ButtonName; 1; 1)="I")
						If (Substring:C12($_t_ButtonName; 5; 1)#"M")
							DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Minus")
							$_bo_MakeCall:=True:C214
						End if 
					Else 
						DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Minus")
						$_bo_MakeCall:=True:C214
					End if 
				: ($_l_ButtonNumber=6)
					//TRACE
					If (Substring:C12($_t_ButtonName; 1; 1)="I")
						If (Substring:C12($_t_ButtonName; 6; 1)#"O")
							DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Open")
							$_bo_MakeCall:=True:C214
						End if 
					Else 
						DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Open")
						$_bo_MakeCall:=True:C214
					End if 
				: ($_l_ButtonNumber=7)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Previous")
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=8)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Next")
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=9)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("First")
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=10)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Last")
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=11)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Select")
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=12)
					//TRACE
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Find")
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=13)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Sort")
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=14)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Set")
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=15)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Report")
					
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=16)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Graph")
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=17)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Apply")
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=18)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Count")
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=19)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Tel")
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=20)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Diary")
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=21)
					DB_MenuNewRecord("Companies")
				: ($_l_ButtonNumber=22)
					ZProc("Companies_Mod"; DB_ProcessMemoryinit(3); "View Companies")
				: ($_l_ButtonNumber=23)
					DB_MenuNewRecord("Contacts")
				: ($_l_ButtonNumber=24)
					ZProc("Contacts_Mod"; DB_ProcessMemoryinit(3); "View Contacts")
				: ($_l_ButtonNumber=25)
					If (<>DB_bo_FunctionOrder)
						If (((DB_GetModuleSettingByNUM(Module_SalesOrders))=2) | ((DB_GetModuleSettingByNUM(Module_SalesOrders))=4))
							If (<>MENU_l_BarModule=10)  //does not exist-but may return
								DB_MenuNewRecord("Orders")
								
							Else 
								DB_MenuNewRecord("Orders")
								
							End if 
						Else 
							If (((DB_GetModuleSettingByNUM(Module_Enquiries))=2) | ((DB_GetModuleSettingByNUM(Module_Enquiries))=4))
								DB_MenuNewRecord("OrdersEnquiries")
								
							Else 
								DB_MenuNewRecord("Products")
								
							End if 
						End if 
					Else 
						DB_MenuNewRecord("Products")
					End if 
				: ($_l_ButtonNumber=26)
					If (<>DB_bo_FunctionOrder)
						If (((DB_GetModuleSettingByNUM(Module_SalesOrders))=2) | ((DB_GetModuleSettingByNUM(Module_SalesOrders))=4))
							If (<>MENU_l_BarModule=10)
								ZProc("Orders_Mod"; DB_ProcessMemoryinit(4); "View Event Orders")
							Else 
								ZProc("Orders_Mod"; DB_ProcessMemoryinit(4); "View Sales Orders")
							End if 
						Else 
							If (((DB_GetModuleSettingByNUM(Module_Enquiries))=2) | ((DB_GetModuleSettingByNUM(Module_Enquiries))=4))
								
								ZProc("Orders_View"; DB_ProcessMemoryinit(3); Term_OrdWT("View Enq, Qtn, Ord"))
							Else 
								ZProc("Products_Mod"; DB_ProcessMemoryinit(2); "View Products")
							End if 
						End if 
					Else 
						ZProc("Products_Mod"; DB_ProcessMemoryinit(2); "View Products")
					End if 
				: ($_l_ButtonNumber=27)
					
					//Repeated in Functions Palette
					//: (◊SuperDiary=1)  `use SuperDiary manager
					
					ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary")
					
					
					
				: ($_l_ButtonNumber=28)
					If (<>SYS_l_WorkflowProcess=0)
						<>SYS_l_WorkflowProcess:=ZProc_withReply("SD2_workflow_Mod"; DB_ProcessMemoryinit(4); "Tasks awaiting actions")
					Else 
						SHOW PROCESS:C325(<>SYS_l_WorkflowProcess)
						
						BRING TO FRONT:C326(<>SYS_l_WorkflowProcess)
					End if 
					
				: ($_l_ButtonNumber=29)  //show qualities
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction(DB_at_ToolPalletteFunctions{29})
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=30)  //search
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction(DB_at_ToolPalletteFunctions{30})
					$_bo_MakeCall:=True:C214
				: ($_l_ButtonNumber=31)  //view pipeline
					
					$_l_UserPosition:=Position:C15("User"; $_t_ProcessName)
					If ($_l_UserPosition=0)
						DB_l_ButtonClickedFunction:=DB_GetButtonFunction(DB_at_ToolPalletteFunctions{31})
						$_bo_MakeCall:=True:C214
					Else 
						//there is no process showing
						//so call to show the whole thing
						
						ZSalesPipeline
					End if 
					
					
				: ($_l_ButtonNumber=32)  //Enter  pipeline
					
					$_l_UserPosition:=Position:C15("User"; $_t_ProcessName)
					If ($_l_UserPosition=0)
						DB_l_ButtonClickedFunction:=DB_GetButtonFunction(DB_at_ToolPalletteFunctions{32})
						$_bo_MakeCall:=True:C214
					Else 
						//  there is no process showing
						
						$_l_NewPipelineProcess:=New process:C317("SP_NewPipeline"; DB_ProcessMemoryinit(1); "Enter Sales Pipeline"; True:C214; <>PER_l_CurrentUserID)
						
						
					End if 
					
				: ($_l_ButtonNumber=33)  //Enter  Target
					
					$_l_NewTargetProcess:=New process:C317("SP_NewTarget"; DB_ProcessMemoryinit(1); "Enter Target"; True:C214; False:C215)
					
					
			End case 
			If ($_bo_MakeCall)
				If ($_l_ProcessNumber#Current process:C322)
					SET PROCESS VARIABLE:C370($_l_ProcessNumber; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
				End if 
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DB_HandleInputFormButtons"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_LoadGenPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 20:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>CB_SP_Orders)
	//C_UNKNOWN(<>CB_SP_Projects)
	//C_UNKNOWN(APR_SPOrderAmount0)
	//C_UNKNOWN(APR_SPOrderAmount1)
	//C_UNKNOWN(APR_SPOrderAmount2)
	//C_UNKNOWN(APR_SPOrderAmount3)
	//C_UNKNOWN(BPR_SPprojectAmount0)
	//C_UNKNOWN(BPR_SPprojectAmount1)
	//C_UNKNOWN(CB_SP_Attendees)
	//C_UNKNOWN(CB_SP_Bookings)
	//C_UNKNOWN(CB_SP_Diary)
	//C_UNKNOWN(CB_SP_Events)
	//C_UNKNOWN(CB_SP_Jobs)
	//C_UNKNOWN(CB_SP_Orders)
	//C_UNKNOWN(CB_SP_Projects)
	//C_UNKNOWN(CPR_SPJobAmount0)
	//C_UNKNOWN(CPR_SPJobAmount1)
	//C_UNKNOWN(CPR_SPJobAmount2)
	//C_UNKNOWN(DPR_SPBookingAmount1)
	//C_UNKNOWN(DPR_SPBookingAmount2)
	//C_UNKNOWN(EPR_SPEventAmount0)
	//C_UNKNOWN(EPR_SPEventAmount1)
	//C_UNKNOWN(EPR_SPEventAmount2)
	//C_UNKNOWN(FPR_SPAttendAmount0)
	//C_UNKNOWN(FPR_SPAttendAmount1)
	//C_UNKNOWN(FPR_SPAttendAmount2)
	C_BOOLEAN:C305($_bo_ReadOnlyState; SP_bo_PrefsLoaded; <>SP_Bo_PrefsLoaded; $_bo_ReadOnlyState; SP_bo_PrefsLoaded)
	C_LONGINT:C283(<>CB_SP_Orders; <>CB_SP_Projects; $_l_ItemID; $_l_offset; APR_SPOrderAmount0; APR_SPOrderAmount1; APR_SPOrderAmount2; APR_SPOrderAmount3; BPR_SPprojectAmount0; BPR_SPprojectAmount1; CB_SP_Attendees)
	C_LONGINT:C283(CB_SP_Bookings; CB_SP_Diary; CB_SP_Events; CB_SP_Jobs; CB_SP_Orders; CB_SP_Projects; CPR_SPJobAmount0; CPR_SPJobAmount1; CPR_SPJobAmount2; DPR_SPBookingAmount1; DPR_SPBookingAmount2)
	C_LONGINT:C283(EPR_SPEventAmount0; EPR_SPEventAmount1; EPR_SPEventAmount2; FPR_SPAttendAmount0; FPR_SPAttendAmount1; FPR_SPAttendAmount2; <>CB_SP_Jobs; $_l_ItemID; $_l_offset; BPR_SPprojectAmount2; DPR_SPBookingAmount0)
	C_REAL:C285(<>CB_SP_Diary; SP_R_OrderCostPlusPercent)
	C_TEXT:C284($_t_oldMethodName; SP_t_AttendCostMacro; SP_t_BookingCostMacro; SP_t_DiaryActionCode; SP_t_DiaryActionName; SP_t_EventCostMacro; SP_t_jobCostMacro; SP_t_OrderCostScript; SP_t_ProjectCostScript; $_t_Action; $_t_oldMethodName)
	C_TEXT:C284(SP_t_AttendCostMacro; SP_t_BookingCostMacro; SP_t_DiaryActionCode; SP_t_DiaryActionName; SP_t_EventCostMacro; SP_t_jobCostMacro; SP_t_OrderCostScript; SP_t_ProjectCostScript)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_LoadGenPrefs")
//this method load the prefs for a pipeline
If (Not:C34(SP_bo_PrefsLoaded))
	While (Semaphore:C143("PipelineLoad"))
		DelayTicks(10)
	End while 
	READ ONLY:C145([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("Sales Pipeline Preferences")
	
	//````
	CB_SP_Diary:=0
	CB_SP_Orders:=0
	CB_SP_Projects:=0
	CB_SP_Jobs:=0
	CB_SP_Bookings:=0
	CB_SP_Events:=0
	CB_SP_Attendees:=0
	APR_SPOrderAmount0:=1
	APR_SPOrderAmount1:=0
	APR_SPOrderAmount2:=0
	APR_SPOrderAmount3:=0
	BPR_SPprojectAmount0:=1
	BPR_SPprojectAmount1:=0
	BPR_SPprojectAmount2:=0
	CPR_SPJobAmount0:=1
	CPR_SPJobAmount1:=0
	CPR_SPJobAmount2:=0
	DPR_SPBookingAmount0:=1
	DPR_SPBookingAmount1:=0
	DPR_SPBookingAmount2:=0
	EPR_SPEventAmount0:=1
	EPR_SPEventAmount1:=0
	EPR_SPEventAmount2:=0
	FPR_SPAttendAmount0:=1
	FPR_SPAttendAmount1:=0
	FPR_SPAttendAmount2:=0
	SP_R_OrderCostPlusPercent:=0
	SP_t_OrderCostScript:=""
	SP_t_ProjectCostScript:=""
	SP_t_jobCostMacro:=""
	SP_t_BookingCostMacro:=""
	SP_t_EventCostMacro:=""
	SP_t_AttendCostMacro:=""
	SP_t_DiaryActionCode:=""
	SP_t_DiaryActionName:=""
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	
	If (Records in selection:C76([PREFERENCES:116])=0)
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		$_l_offset:=0
		VARIABLE TO BLOB:C532(CB_SP_Diary; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(CB_SP_Orders; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(CB_SP_Projects; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(CB_SP_Jobs; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(CB_SP_Bookings; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(CB_SP_Events; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(CB_SP_Attendees; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(APR_SPOrderAmount0; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(APR_SPOrderAmount1; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(APR_SPOrderAmount2; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(APR_SPOrderAmount3; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(BPR_SPprojectAmount0; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(BPR_SPprojectAmount1; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(BPR_SPprojectAmount2; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(CPR_SPJobAmount0; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(CPR_SPJobAmount1; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(CPR_SPJobAmount2; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DPR_SPBookingAmount0; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DPR_SPBookingAmount1; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DPR_SPBookingAmount2; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(EPR_SPEventAmount0; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(EPR_SPEventAmount1; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(EPR_SPEventAmount2; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(FPR_SPAttendAmount0; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(FPR_SPAttendAmount1; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(FPR_SPAttendAmount2; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SP_R_OrderCostPlusPercent; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SP_t_OrderCostScript; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SP_t_ProjectCostScript; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SP_t_jobCostMacro; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SP_t_BookingCostMacro; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SP_t_EventCostMacro; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SP_t_AttendCostMacro; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SP_t_DiaryActionCode; [PREFERENCES:116]DataBlob:2; *)
		
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	Else 
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CB_SP_Diary; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CB_SP_Orders; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CB_SP_Projects; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CB_SP_Jobs; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CB_SP_Bookings; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CB_SP_Events; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CB_SP_Attendees; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; APR_SPOrderAmount0; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; APR_SPOrderAmount1; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; APR_SPOrderAmount2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; APR_SPOrderAmount3; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BPR_SPprojectAmount0; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BPR_SPprojectAmount1; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BPR_SPprojectAmount2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CPR_SPJobAmount0; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CPR_SPJobAmount1; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CPR_SPJobAmount2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DPR_SPBookingAmount0; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DPR_SPBookingAmount1; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DPR_SPBookingAmount2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; EPR_SPEventAmount0; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; EPR_SPEventAmount1; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; EPR_SPEventAmount2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; FPR_SPAttendAmount0; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; FPR_SPAttendAmount1; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; FPR_SPAttendAmount2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SP_R_OrderCostPlusPercent; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SP_t_OrderCostScript; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SP_t_ProjectCostScript; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SP_t_jobCostMacro; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SP_t_BookingCostMacro; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SP_t_EventCostMacro; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SP_t_AttendCostMacro; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SP_t_DiaryActionCode; $_l_offset)
		
	End if 
	SP_bo_PrefsLoaded:=True:C214
	
End if 
If (SP_t_DiaryActionCode#"")
	$_t_Action:=[ACTIONS:13]Action_Code:1
	$_bo_ReadOnlyState:=Read only state:C362([ACTIONS:13])
	READ ONLY:C145([ACTIONS:13])
	
	QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SP_t_DiaryActionCode)
	SP_t_DiaryActionName:=[ACTIONS:13]Action_Name:2
	UNLOAD RECORD:C212([ACTIONS:13])
	If (Not:C34($_bo_ReadOnlyState))
		READ WRITE:C146([ACTIONS:13])
		
	End if 
	If ($_t_Action#"")
		QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_t_Action)
	End if 
End if 
<>CB_SP_Diary:=CB_SP_Diary
<>CB_SP_Orders:=CB_SP_Orders
<>CB_SP_Projects:=CB_SP_Projects
<>CB_SP_Jobs:=CB_SP_Jobs
<>SP_Bo_PrefsLoaded:=True:C214

CLEAR SEMAPHORE:C144("PipelineLoad")
ERR_MethodTrackerReturn("SP_LoadGenPrefs"; $_t_oldMethodName)

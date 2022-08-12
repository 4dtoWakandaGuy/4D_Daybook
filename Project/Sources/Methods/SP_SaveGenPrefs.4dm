//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_SaveGenPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(APR_SPOrderAmount0)
	//C_UNKNOWN(APR_SPOrderAmount1)
	//C_UNKNOWN(APR_SPOrderAmount2)
	//C_UNKNOWN(APR_SPOrderAmount3)
	//C_UNKNOWN(BPR_SPprojectAmount0)
	//C_UNKNOWN(BPR_SPprojectAmount1)
	//C_UNKNOWN(BPR_SPprojectAmount2)
	//C_UNKNOWN(CB_SP_Attendees)
	//C_UNKNOWN(CB_SP_Bookings)
	//C_UNKNOWN(CB_SP_Diary)
	//C_UNKNOWN(CB_SP_Jobs)
	//C_UNKNOWN(CB_SP_Orders)
	//C_UNKNOWN(CB_SP_Projects)
	//C_UNKNOWN(CPR_SPJobAmount0)
	//C_UNKNOWN(CPR_SPJobAmount1)
	//C_UNKNOWN(CPR_SPJobAmount2)
	//C_UNKNOWN(DPR_SPBookingAmount0)
	//C_UNKNOWN(DPR_SPBookingAmount1)
	//C_UNKNOWN(DPR_SPBookingAmount2)
	//C_UNKNOWN(EPR_SPEventAmount0)
	//C_UNKNOWN(EPR_SPEventAmount2)
	//C_UNKNOWN(FPR_SPAttendAmount0)
	//C_UNKNOWN(FPR_SPAttendAmount1)
	//C_UNKNOWN(FPR_SPAttendAmount2)
	C_BOOLEAN:C305(SP_bo_PrefsLoaded; <>SP_Bo_PrefsLoaded; SP_bo_PrefsLoaded)
	C_LONGINT:C283(APR_SPOrderAmount0; APR_SPOrderAmount1; APR_SPOrderAmount2; APR_SPOrderAmount3; BPR_SPprojectAmount0; BPR_SPprojectAmount1; BPR_SPprojectAmount2; CB_SP_Attendees; CB_SP_Bookings; CB_SP_Diary; CB_SP_Jobs)
	C_LONGINT:C283(CB_SP_Orders; CB_SP_Projects; CPR_SPJobAmount0; CPR_SPJobAmount1; CPR_SPJobAmount2; DPR_SPBookingAmount0; DPR_SPBookingAmount1; DPR_SPBookingAmount2; EPR_SPEventAmount0; EPR_SPEventAmount2; FPR_SPAttendAmount0)
	C_LONGINT:C283(FPR_SPAttendAmount1; FPR_SPAttendAmount2; $_l_ItemID; CB_SP_Events; EPR_SPEventAmount1)
	C_REAL:C285(SP_R_OrderCostPlusPercent; SP_R_OrderCostPlusPercent)
	C_TEXT:C284(SP_t_AttendCostMacro; SP_t_BookingCostMacro; SP_t_DiaryActionCode; SP_t_EventCostMacro; SP_t_jobCostMacro; SP_t_OrderCostScript; SP_t_ProjectCostScript; $_t_oldMethodName; SP_t_AttendCostMacro; SP_t_BookingCostMacro; SP_t_DiaryActionCode)
	C_TEXT:C284(SP_t_EventCostMacro; SP_t_jobCostMacro; SP_t_OrderCostScript; SP_t_ProjectCostScript)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_l_SaveGenPrefs")
//this method load the prefs for a pipeline
<>SP_Bo_PrefsLoaded:=False:C215
READ WRITE:C146([PREFERENCES:116])
While (Semaphore:C143("PipelineLoad"))
	DelayTicks(10)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Sales Pipeline Preferences")

QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
End if 
SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)

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
SP_bo_PrefsLoaded:=False:C215
If (Application type:C494=4)
	
	SET PROCESS VARIABLE:C370(-1; <>SP_Bo_PrefsLoaded; <>SP_Bo_PrefsLoaded)
	
End if 
DB_SaveRecord(->[PREFERENCES:116])
UNLOAD RECORD:C212([PREFERENCES:116])
READ ONLY:C145([PREFERENCES:116])
CLEAR SEMAPHORE:C144("PipelineLoad")
ERR_MethodTrackerReturn("SP_l_SaveGenPrefs"; $_t_oldMethodName)

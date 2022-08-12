If (False:C215)
	//Table Form Method Name: Object Name:      [JOBS].Job_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/04/2011 14:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(JOB_lb_JobTotals;0)
	//ARRAY BOOLEAN(JOB_LB_OrderItems;0)
	//ARRAY BOOLEAN(JOB_lb_Stages;0)
	//ARRAY LONGINT(AL_l_ModeOrders;0)
	//ARRAY LONGINT(AL_l_ModeStage;0)
	//ARRAY TEXT(JOB_at_JobPageTab;0)
	//ARRAY TEXT(JOB_at_Modeorders;0)
	//ARRAY TEXT(JOB_at_ModeStage;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; eALOrdJOB; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord)
	C_PICTURE:C286(ALModePictOrders; JOB_pic_StageEditMode)
	C_TEXT:C284($_t_oldMethodName; DB_t_CUrrentInputMenuRef; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [JOBS].Job_In"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Resize:K2:27)
		LBI_Scrollonresize(->JOB_lb_Stages)
		LBI_Scrollonresize(->JOB_LB_OrderItems)
		LBI_Scrollonresize(->JOB_lb_JobTotals)  //added kmw 20/03/07
		
	: ($_l_event=On Header:K2:17)  //| ($_l_event=On Resize )
		// WS_AutoscreenSize (2;384;553)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))  //runs once - doesn't run again if user clicks next record
		DB_SetnewToolBar
		
		WS_AutoscreenSize(1; 500; 610; Table name:C256(->[JOBS:26])+"_"+"Job_In")
		ARRAY TEXT:C222(JOB_at_JobPageTab; 3)
		OBJECT SET FONT:C164(JOB_at_JobPageTab; "arial")
		OBJECT SET FONT STYLE:C166(JOB_at_JobPageTab; 1)
		OBJECT SET FONT SIZE:C165(JOB_at_JobPageTab; 12)
		JOB_at_JobPageTab{1}:="Job and time"  //changed as per Steve's instructions16/01/07 - kmw `"   1  "
		JOB_at_JobPageTab{2}:="Further info"  //changed as per Steve's instructions16/01/07 - kmw `"   2  "
		JOB_at_JobPageTab{3}:="Costs"  //changed as per Steve's instructions16/01/07 - kmw `"   3  "
		JOB_at_JobPageTab:=1
		ARRAY TEXT:C222(JOB_at_ModeStage; 0)
		ARRAY LONGINT:C221(AL_l_ModeStage; 0)
		LBi_SetListBoxOptions(->JOB_at_ModeStage; ->AL_l_ModeStage; ->JOB_pic_StageEditMode)
		
		//JOB_at_ModeStage{2}:="Edit"
		//JOB_at_ModeStage{1}:="Select"
		//If (User in group(Current user;"Designer"))
		//ARRAY STRING(55;JOB_at_ModeStage;3)
		//JOB_at_ModeStage{3}:="Definitions"
		//End if
		ARRAY TEXT:C222(JOB_at_Modeorders; 0)
		ARRAY LONGINT:C221(AL_l_ModeOrders; 0)
		LBi_SetListBoxOptions(->JOB_at_Modeorders; ->AL_l_ModeOrders; ->ALModePictOrders)
		
		//JOB_at_Modeorders{2}:="Edit"
		//JOB_at_Modeorders{1}:="Select"
		//If (User in group(Current user;"Designer"))
		//ARRAY STRING(55;JOB_at_Modeorders;3)
		//JOB_at_Modeorders{3}:="Definitions"
		//End if
		INT_SetInput(Table:C252(->[JOBS:26]); WIN_t_CurrentInputForm)
		DB_SetInputFormMenu(Table:C252(->[JOBS:26]); "Job_In")
		If (Records in selection:C76([JOBS:26])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
End case 
Jobs_InLP($_l_event)
ERR_MethodTrackerReturn("FM:Job_In"; $_t_oldMethodName)

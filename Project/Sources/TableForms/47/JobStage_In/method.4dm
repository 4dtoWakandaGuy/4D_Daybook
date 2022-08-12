If (False:C215)
	//Table Form Method Name: Object Name:      [JOB_STAGES].JobStage_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 10:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(JST_LB_ChargeItems;0)
	//ARRAY BOOLEAN(JST_lb_LBJSTots;0)
	//ARRAY BOOLEAN(JST_LB_Persons;0)
	//ARRAY LONGINT(AL_al_ModOrder;0)
	//ARRAY LONGINT(AL_al_ModPers;0)
	//ARRAY POINTER(JST_aPtr_OrderItemsSetup;0)
	//ARRAY TEXT(JST_at_JobStageTab;0)
	//ARRAY TEXT(JST_at_ModeOrderI;0)
	//ARRAY TEXT(JST_at_ModePersonnel;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord)
	C_PICTURE:C286(ALModePictureOrders; ALModePicturePersons)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DB_t_CUrrentInputMenuRef; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [JOB_STAGES].JobStage_in"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
	: ($_l_event=On Resize:K2:27)
		//INT_SetInput (Table(->[JOB STAGES]);WIN_t_CurrentInputForm)
		LBI_Scrollonresize(->JST_LB_ChargeItems)
		LBI_Scrollonresize(->JST_LB_Persons)
		LBI_Scrollonresize(->JST_lb_LBJSTots)  //added kmw 20/03/07
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		
		WS_AutoscreenSize(1; 620; 590; Table name:C256(->[JOB_STAGES:47])+"_"+"JobStage_in")
		ARRAY TEXT:C222(JST_at_JobStageTab; 3)
		OBJECT SET FONT:C164(JST_at_JobStageTab; "arial")
		OBJECT SET FONT STYLE:C166(JST_at_JobStageTab; 1)
		OBJECT SET FONT SIZE:C165(JST_at_JobStageTab; 12)
		JST_at_JobStageTab{1}:="Time Recording  "
		JST_at_JobStageTab{2}:="Budget Costs"
		JST_at_JobStageTab{3}:="Actual Costs"
		JST_at_JobStageTab:=1
		ARRAY POINTER:C280(JST_aPtr_OrderItemsSetup; 0)
		INT_SetInput(Table:C252(->[JOB_STAGES:47]); WIN_t_CurrentInputForm)
		DB_SetInputFormMenu(Table:C252(->[JOB_STAGES:47]); "JobStage_in")
		If (Records in selection:C76([JOB_STAGES:47])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
		ARRAY TEXT:C222(JST_at_ModePersonnel; 0)
		ARRAY LONGINT:C221(AL_al_ModPers; 0)
		LBi_SetListBoxOptions(->JST_at_ModePersonnel; ->AL_al_ModPers; ->ALModePicturePersons)
		//JST_at_ModePersonnel{2}:="Edit"
		//JST_at_ModePersonnel{1}:="Select"
		//If (User in group(Current user;"Designer"))
		//ARRAY STRING(55;JST_at_ModePersonnel;3)
		//`JST_at_ModePersonnel{3}:="Definitions"
		//End if
		ARRAY TEXT:C222(JST_at_ModeOrderI; 0)
		ARRAY LONGINT:C221(AL_al_ModOrder; 0)
		LBi_SetListBoxOptions(->JST_at_ModeOrderI; ->AL_al_ModOrder; ->ALModePictureOrders)
		
		//JST_at_ModeOrderI{2}:="Edit"
		//JST_at_ModeOrderI{1}:="Select"
		//If (User in group(Current user;"Designer"))
		//ARRAY STRING(55;JST_at_ModeOrderI;3)
		//JST_at_ModeOrderI{3}:="Definitions"
		//End if
		JST_at_ModeOrderI:=0
		
End case 


JobStages_InLP
ERR_MethodTrackerReturn("FM:JobStage_in"; $_t_oldMethodName)

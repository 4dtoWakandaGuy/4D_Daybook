If (False:C215)
	//Project Form Method Name: PROMANAGER
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2011 23:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRO_abo_DataChanged;0)
	//ARRAY BOOLEAN(PRO_lb_Production;0)
	//ARRAY DATE(PRO_ad_RequriedDate;0)
	//ARRAY LONGINT(PRO_al_ItemNumbers;0)
	//ARRAY TEXT(PRO_at_AllStageCodes;0)
	//ARRAY TEXT(PRO_at_AllStageNames;0)
	//ARRAY TEXT(PRO_at_Descriptions;0)
	//ARRAY TEXT(PRO_at_StageNames;0)
	//ARRAY TEXT(PRO_at_Stages;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_Height; $_l_StageCodeRow; $_l_StageIndex; $_l_Width; PCL_l_BUT1; PCL_l_BUT10; PCL_l_BUT11; PCL_l_BUT12; PCL_l_BUT13; PCL_l_BUT14)
	C_LONGINT:C283(PCL_l_BUT15; PCL_l_BUT16; PCL_l_BUT17; PCL_l_BUT18; PCL_l_BUT19; PCL_l_BUT2; PCL_l_BUT20; PCL_l_BUT21; PCL_l_BUT22; PCL_l_BUT23; PCL_l_BUT24)
	C_LONGINT:C283(PCL_l_BUT25; PCL_l_BUT26; PCL_l_BUT27; PCL_l_BUT3; PCL_l_BUT4; PCL_l_BUT5; PCL_l_BUT6; PCL_l_BUT7; PCL_l_BUT8; PCL_l_BUT9; PRO_l_SetSelected)
	C_LONGINT:C283(PRO_l_SetSelected2)
	C_TEXT:C284($_t_oldMethodName; oPRO_COL1; oPRO_COL10; oPRO_COL11; oPRO_COL12; oPRO_COL13; oPRO_COL14; oPRO_COL15; oPRO_COL16; oPRO_COL17; oPRO_COL18)
	C_TEXT:C284(oPRO_COL19; oPRO_COL2; oPRO_COL20; oPRO_COL21; oPRO_COL22; oPRO_COL23; oPRO_COL24; oPRO_COL25; oPRO_COL26; oPRO_COL27; oPRO_COL3)
	C_TEXT:C284(oPRO_COL4; oPRO_COL5; oPRO_COL6; oPRO_COL7; oPRO_COL8; oPRO_COL9; oPRO_HED1; oPRO_HED10; oPRO_HED11; oPRO_HED12; oPRO_HED13)
	C_TEXT:C284(oPRO_HED14; oPRO_HED15; oPRO_HED16; oPRO_HED17; oPRO_HED18; oPRO_HED19; oPRO_HED2; oPRO_HED20; oPRO_HED21; oPRO_HED22; oPRO_HED23)
	C_TEXT:C284(oPRO_HED24; oPRO_HED25; oPRO_HED26; oPRO_HED27; oPRO_HED3; oPRO_HED4; oPRO_HED5; oPRO_HED6; oPRO_HED7; oPRO_HED8; oPRO_HED9)
	C_TEXT:C284(PRO_t_NewComment)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM PROMANAGER"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		
		SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; PRO_al_ItemNumbers; [ORDER_ITEMS:25]Required_Date:10; PRO_ad_RequriedDate; [ORDER_ITEMS:25]Job_Stage:35; PRO_at_Stages; [ORDER_ITEMS:25]Description:44; PRO_at_Descriptions)
		
		
		
		
		SORT ARRAY:C229(PRO_ad_RequriedDate; PRO_at_Stages; PRO_al_ItemNumbers; PRO_at_Descriptions)
		ALL RECORDS:C47([STAGES:45])
		SELECTION TO ARRAY:C260([STAGES:45]Stage_Code:1; PRO_at_AllStageCodes; [STAGES:45]Stage_Name:2; PRO_at_AllStageNames)
		SORT ARRAY:C229(PRO_at_AllStageNames; PRO_at_AllStageCodes)
		ARRAY BOOLEAN:C223(PRO_abo_DataChanged; 0)
		ARRAY BOOLEAN:C223(PRO_abo_DataChanged; Size of array:C274(PRO_ad_RequriedDate))  //Remember changes so can save
		
		ARRAY TEXT:C222(PRO_at_StageNames; 0)
		ARRAY TEXT:C222(PRO_at_StageNames; Size of array:C274(PRO_ad_RequriedDate))
		For ($_l_StageIndex; 1; Size of array:C274(PRO_at_StageNames))
			$_l_StageCodeRow:=Find in array:C230(PRO_at_AllStageCodes; PRO_at_Stages{$_l_StageIndex})
			
			If ($_l_StageCodeRow>0)
				PRO_at_StageNames{$_l_StageIndex}:=PRO_at_AllStageNames{$_l_StageCodeRow}
			Else 
				PRO_at_StageNames{$_l_StageIndex}:="unknown"
			End if 
		End for 
		
		LB_SetupListbox(->PRO_lb_Production; "oPRO"; "PCL_L"; 1; ->PRO_al_ItemNumbers; ->PRO_ad_RequriedDate; ->PRO_at_Stages; ->PRO_at_StageNames; ->PRO_at_Descriptions)
		
		LB_SetColumnHeaders(->PRO_lb_Production; "PCL_L"; 1; "Order item"; "Publication Date"; "Status Code"; "Production Status"; "Pagination Comments")
		
		LB_SetColumnWidths(->PRO_lb_Production; "oPRO"; 1; 0; 80; 80; 250; 500)
		LB_SetScroll(->PRO_lb_Production; -2; -2)
		LB_SetEnterable(->PRO_lb_Production; False:C215; 0; "")
		LB_SetEnterable(->PRO_lb_Production; True:C214; 3; "")
		LB_SetEnterable(->PRO_lb_Production; True:C214; 4; "")
		LB_SetEnterable(->PRO_lb_Production; True:C214; 5; "")
		LB_SetChoiceList("PROStagesCD"; ->PRO_at_AllStageCodes; ->PRO_at_Stages)
		LB_SetChoiceList("PROStages"; ->PRO_at_AllStageNames; ->PRO_at_StageNames)
		LBi_InclSetupJustStyle(->PRO_lb_Production)
		PRO_at_AllStageNames:=0
		PRO_t_NewComment:=""
		$_l_Height:=15*Size of array:C274(PRO_al_ItemNumbers)+110
		If ($_l_Height<420)
			$_l_Height:=420
		End if 
		$_l_Width:=80+80+250+500
		If ($_l_Width<610)
			$_l_Width:=610
		End if 
		OBJECT SET VISIBLE:C603(PRO_l_SetSelected2; False:C215)
		OBJECT SET VISIBLE:C603(PRO_l_SetSelected; False:C215)
		WS_AutoscreenSize(1; $_l_Height; $_l_Width; "SYSTEM"+"_"+"PROMANAGER")
End case 
ERR_MethodTrackerReturn("FM PROMANAGER"; $_t_oldMethodName)

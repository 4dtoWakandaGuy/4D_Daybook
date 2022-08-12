//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_SetupPowerViewTargets
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 14:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SP_lb_Target;0)
	//ARRAY DATE(SP_ad_TargetFromDate;0)
	//ARRAY DATE(SP_ad_TargettoDate;0)
	//ARRAY LONGINT(SP_al_atCurrencyID;0)
	//ARRAY LONGINT(SP_al_PipelineStatus;0)
	//ARRAY LONGINT(SP_al_RecordModified;0)
	//ARRAY LONGINT(SP_al_SalesProjectionID;0)
	//ARRAY LONGINT(SP_al_TargetOGroupID;0)
	//ARRAY LONGINT(SP_al_TargetOPersonID;0)
	//ARRAY LONGINT(SP_al_TargetPeriod;0)
	//ARRAY LONGINT(SP_al_TargetType;0)
	//ARRAY REAL(SP_ar_atSalesValue;0)
	//ARRAY REAL(SP_ar_PipelineResult;0)
	//ARRAY REAL(SP_ar_TargetProjection;0)
	//ARRAY TEXT(SP_at_AdHocOwner;0)
	//ARRAY TEXT(SP_at_atCurrencyCode;0)
	//ARRAY TEXT(SP_at_atSalesTitle;0)
	//ARRAY TEXT(SP_at_PipelineStatus;0)
	//ARRAY TEXT(SP_at_PopCurrencyCodes;0)
	//ARRAY TEXT(SP_at_PVPeriodCode;0)
	//ARRAY TEXT(SP_at_TargetOGroupID;0)
	//ARRAY TEXT(SP_at_TargetOPersonID;0)
	//ARRAY TEXT(SP_at_TargetOwner;0)
	//ARRAY TEXT(SP_at_TargetPeriod;0)
	//ARRAY TEXT(SP_at_TargetPipelineStatus;0)
	//ARRAY TEXT(SP_at_TargetType;0)
	C_BOOLEAN:C305(DB_bo_FontsInited)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; $_l_Index; TARG_l_BUT1; TARG_l_BUT10; TARG_l_BUT11; TARG_l_BUT12; TARG_l_BUT13; TARG_l_BUT14; TARG_l_BUT15; TARG_l_BUT16)
	C_LONGINT:C283(TARG_l_BUT17; TARG_l_BUT18; TARG_l_BUT19; TARG_l_BUT2; TARG_l_BUT20; TARG_l_BUT21; TARG_l_BUT22; TARG_l_BUT23; TARG_l_BUT24; TARG_l_BUT3; TARG_l_BUT4)
	C_LONGINT:C283(TARG_l_BUT5; TARG_l_BUT6; TARG_l_BUT7; TARG_l_BUT8; TARG_l_BUT9)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; $_t_oldMethodName; oTARG_COL1; oTARG_COL10; oTARG_COL11; oTARG_COL12; oTARG_COL13; oTARG_COL14; oTARG_COL15; oTARG_COL16)
	C_TEXT:C284(oTARG_COL17; oTARG_COL18; oTARG_COL19; oTARG_COL2; oTARG_COL20; oTARG_COL21; oTARG_COL22; oTARG_COL23; oTARG_COL24; oTARG_COL3; oTARG_COL4)
	C_TEXT:C284(oTARG_COL5; oTARG_COL6; oTARG_COL7; oTARG_COL8; oTARG_COL9; oTARG_HED1; oTARG_HED10; oTARG_HED11; oTARG_HED12; oTARG_HED13; oTARG_HED14)
	C_TEXT:C284(oTARG_HED15; oTARG_HED16; oTARG_HED17; oTARG_HED18; oTARG_HED19; oTARG_HED2; oTARG_HED20; oTARG_HED21; oTARG_HED22; oTARG_HED23; oTARG_HED24)
	C_TEXT:C284(oTARG_HED3; oTARG_HED4; oTARG_HED5; oTARG_HED6; oTARG_HED7; oTARG_HED8; oTARG_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_SetupPowerViewTargets")



// these are all the arrays: SP_at_TargetOwner;SP_al_SalesProjectionID;SP_at_atSalesTitle;SP_al_RecordModified;SP_al_atCurrencyID;SP_at_atCurrencyCode;SP_ar_atSalesValue;SP_at_PipelineStatus;SP_at_PipelineStatus;SP_ar_PipelineResult;SP_ad_TargetFromDate;SP_ad_TargettoDate;SP_al_atCurrencyID;SP_at_atCurrencyCode;SP_al_TargetPeriod;SP_at_TargetPeriod;SP_at_AdHocOwner;SP_al_TargetOPersonID;SP_al_TargetOGroupID;SP_at_TargetOPersonID;SP_at_TargetOGroupID;SP_al_TargetType;SP_at_TargetType;SP_ar_TargetProjection)


LB_SetupListbox(->SP_lb_Target; "oTARG"; "TARG_L"; 1; ->SP_at_TargetOwner; ->SP_at_atSalesTitle; ->SP_at_TargetType; ->SP_at_TargetPeriod; ->SP_ad_TargetFromDate; ->SP_ad_TargettoDate; ->SP_at_atCurrencyCode; ->SP_ar_atSalesValue; ->SP_ar_TargetProjection; ->SP_ar_PipelineResult; ->SP_al_PipelineStatus; ->SP_al_SalesProjectionID; ->SP_al_RecordModified; ->SP_al_atCurrencyID; ->SP_at_PipelineStatus; ->SP_al_atCurrencyID; ->SP_at_atCurrencyCode; ->SP_al_TargetPeriod; ->SP_at_AdHocOwner; ->SP_al_TargetOPersonID; ->SP_al_TargetOGroupID; ->SP_at_TargetOPersonID; ->SP_at_TargetOGroupID; ->SP_al_TargetType)
OBJECT SET VISIBLE:C603(SP_al_SalesProjectionID; False:C215)
OBJECT SET VISIBLE:C603(SP_al_RecordModified; False:C215)
OBJECT SET VISIBLE:C603(SP_al_atCurrencyID; False:C215)
OBJECT SET VISIBLE:C603(SP_al_PipelineStatus; False:C215)
OBJECT SET VISIBLE:C603(SP_al_atCurrencyID; False:C215)
OBJECT SET VISIBLE:C603(SP_at_atCurrencyCode; False:C215)
OBJECT SET VISIBLE:C603(SP_al_TargetPeriod; False:C215)
OBJECT SET VISIBLE:C603(SP_at_AdHocOwner; False:C215)
OBJECT SET VISIBLE:C603(SP_al_TargetOPersonID; False:C215)
OBJECT SET VISIBLE:C603(SP_al_TargetOGroupID; False:C215)
OBJECT SET VISIBLE:C603(SP_at_TargetOPersonID; False:C215)
OBJECT SET VISIBLE:C603(SP_at_TargetOGroupID; False:C215)
OBJECT SET VISIBLE:C603(SP_al_TargetType; False:C215)

LB_StyleSettings(->SP_lb_Target; "Blue"; 9; "TARG"; ->[PERSONNEL:11])
LB_SetColumnHeaders(->SP_lb_Target; "TARG_L"; 1; "Target for"; "Title"; "Type"; "Period"; "From Date"; "To Date"; "Currency"; "Amount"; "Current Projection"; "Result"; "Status")
LB_SetColumnWidths(->SP_lb_Target; "oTARG"; 1; 188; 190; 190; 100; 100; 100; 50; 100; 100; 100; 180)  // dont need to worry about the invisible ones

LB_SetScroll(->SP_lb_Target; -2; -2)
OBJECT SET ENTERABLE:C238(SP_at_TargetOwner; False:C215)

OBJECT SET ENTERABLE:C238(SP_at_atSalesTitle; True:C214)
OBJECT SET ENTERABLE:C238(SP_at_TargetType; False:C215)
LB_SetChoiceList("lbPeriodCode"; ->SP_at_PVPeriodCode; ->SP_at_TargetPeriod)
OBJECT SET ENTERABLE:C238(SP_ad_TargetFromDate; True:C214)
OBJECT SET ENTERABLE:C238(SP_ad_TargettoDate; True:C214)
LB_SetChoiceList("lbCurrencyCode"; ->SP_at_PopCurrencyCodes; ->SP_at_atCurrencyCode)
OBJECT SET ENTERABLE:C238(SP_ar_atSalesValue; True:C214)
OBJECT SET ENTERABLE:C238(SP_ar_TargetProjection; True:C214)
OBJECT SET ENTERABLE:C238(SP_ar_PipelineResult; True:C214)
LB_SetChoiceList("lbPipeStatus"; ->SP_at_TargetPipelineStatus; ->SP_at_PipelineStatus)
OBJECT SET FORMAT:C236(SP_ar_atSalesValue; "#######0")
OBJECT SET FORMAT:C236(SP_ar_TargetProjection; "#######0")
OBJECT SET FORMAT:C236(SP_ar_PipelineResult; "#######0")
//ARRAY INTEGER($2darray;0;0)
// todo: what about these?
For ($_l_Index; 1; Size of array:C274(SP_ar_PipelineResult))
	If (SP_ar_PipelineResult{$_l_Index}>0)
		
	End if 
End for 
If (Not:C34(DB_bo_FontsInited))
	DB_SetDefaultFonts
End if 
LB_SETFONT(->SP_lb_Target; "targ"; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize)  // header
LB_SETFONT(->SP_lb_Target; "targ"; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)
ERR_MethodTrackerReturn("SP_SetupPowerViewTargets"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_SetUpPowerviewPipeline
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SP_SetUpPowerviewPipeline
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SP_LB_Pipeline;0)
	//ARRAY DATE(SP_ad_ExpectedDate;0)
	//ARRAY LONGINT(SP_al_CompanyID;0)
	//ARRAY LONGINT(SP_al_CurrencyID;0)
	//ARRAY LONGINT(SP_al_RelatedSaleTypeID;0)
	//ARRAY LONGINT(SP_al_SalesContactID;0)
	//ARRAY LONGINT(SP_al_SalesPipelineStatus;0)
	//ARRAY LONGINT(SP_al_SalesProjectionID;0)
	//ARRAY LONGINT(SP_al_SalesRecordModified;0)
	//ARRAY LONGINT(SP_al_SalesRelatedRecordID;0)
	//ARRAY LONGINT(SP_al_SalesRelatedTableID;0)
	//ARRAY REAL(SP_ar_FilterProbability2;0)
	//ARRAY REAL(SP_ar_Probability;0)
	//ARRAY REAL(SP_ar_SalesActual;0)
	//ARRAY REAL(SP_ar_SalesActualCosts;0)
	//ARRAY REAL(SP_ar_SalesCosts;0)
	//ARRAY REAL(SP_ar_SalesMargin;0)
	//ARRAY REAL(SP_ar_SalesValue;0)
	//ARRAY TEXT(SP_at_CurrencyCode;0)
	//ARRAY TEXT(SP_at_ListPipelineStatus;0)
	//ARRAY TEXT(SP_at_PipelineStatus;0)
	//ARRAY TEXT(SP_at_PopCurrencyCodes;0)
	//ARRAY TEXT(SP_at_RelatedRecordCode;0)
	//ARRAY TEXT(SP_at_RelatedSaleTypeNM;0)
	//ARRAY TEXT(SP_at_SalesCustomerName;0)
	//ARRAY TEXT(SP_at_SalesProjectionContact;0)
	//ARRAY TEXT(SP_at_SalesTitle;0)
	C_BOOLEAN:C305(DB_bo_FontsInited)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; $_l_Index; PIPE_l_BUT1; PIPE_l_BUT10; PIPE_l_BUT11; PIPE_l_BUT12; PIPE_l_BUT13; PIPE_l_BUT14; PIPE_l_BUT15; PIPE_l_BUT16)
	C_LONGINT:C283(PIPE_l_BUT17; PIPE_l_BUT18; PIPE_l_BUT19; PIPE_l_BUT2; PIPE_l_BUT20; PIPE_l_BUT21; PIPE_l_BUT22; PIPE_l_BUT23; PIPE_l_BUT3; PIPE_l_BUT4; PIPE_l_BUT5)
	C_LONGINT:C283(PIPE_l_BUT6; PIPE_l_BUT7; PIPE_l_BUT8; PIPE_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; oPIPE_COL1; oPIPE_COL10; oPIPE_COL11; oPIPE_COL12; oPIPE_COL13; oPIPE_COL14; oPIPE_COL15; oPIPE_COL16; oPIPE_COL17; oPIPE_COL18)
	C_TEXT:C284(oPIPE_COL19; oPIPE_COL2; oPIPE_COL20; oPIPE_COL21; oPIPE_COL22; oPIPE_COL23; oPIPE_COL3; oPIPE_COL4; oPIPE_COL5; oPIPE_COL6; oPIPE_COL7)
	C_TEXT:C284(oPIPE_COL8; oPIPE_COL9; oPIPE_HED1; oPIPE_HED10; oPIPE_HED11; oPIPE_HED12; oPIPE_HED13; oPIPE_HED14; oPIPE_HED15; oPIPE_HED16; oPIPE_HED17)
	C_TEXT:C284(oPIPE_HED18; oPIPE_HED19; oPIPE_HED2; oPIPE_HED20; oPIPE_HED21; oPIPE_HED22; oPIPE_HED23; oPIPE_HED3; oPIPE_HED4; oPIPE_HED5; oPIPE_HED6)
	C_TEXT:C284(oPIPE_HED7; oPIPE_HED8; oPIPE_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_SetUpPowerviewPipeline")

ARRAY TEXT:C222(SP_at_PopCurrencyCodes; 0)

// HERE IS A LIST OF ALL THE ARRAYS:
//SP_at_SalesTitle;SP_al_SalesProjectionID;SP_al_CompanyID;SP_at_SalesCustomerName;SP_al_CurrencyID;SP_at_CurrencyCode;SP_ar_SalesValue;SP_ar_SalesCosts;SP_ar_SalesMargin;SP_ad_ExpectedDate;SP_l_aProbability;SP_al_SalesPipelineStatus;SP_at_PipelineStatus;SP_al_RelatedSaleTypeID;SP_at_RelatedSaleTypeNM;SP_ar_SalesActual;SP_at_SalesProjectionContact;SP_al_SalesContactID;SP_al_SalesRelatedTableID;SP_al_SalesRelatedRecordID;SP_al_SalesRecordModified;SP_at_RelatedRecordCode;SP_ar_SalesActualCosts
OBJECT SET VISIBLE:C603(SP_al_SalesProjectionID; False:C215)
OBJECT SET VISIBLE:C603(SP_al_CompanyID; False:C215)
OBJECT SET VISIBLE:C603(SP_al_CurrencyID; False:C215)
OBJECT SET VISIBLE:C603(SP_al_SalesPipelineStatus; False:C215)
OBJECT SET VISIBLE:C603(SP_al_RelatedSaleTypeID; False:C215)
OBJECT SET VISIBLE:C603(SP_at_SalesProjectionContact; False:C215)
OBJECT SET VISIBLE:C603(SP_al_SalesContactID; False:C215)
OBJECT SET VISIBLE:C603(SP_al_SalesRelatedTableID; False:C215)
OBJECT SET VISIBLE:C603(SP_al_SalesRelatedRecordID; False:C215)
OBJECT SET VISIBLE:C603(SP_al_SalesRecordModified; False:C215)
OBJECT SET VISIBLE:C603(SP_ar_SalesActualCosts; False:C215)
LB_SetupListbox(->SP_LB_Pipeline; "oPIPE"; "PIPE_L"; 1; ->SP_at_SalesTitle; ->SP_at_SalesCustomerName; ->SP_at_CurrencyCode; ->SP_ar_SalesValue; ->SP_ar_SalesCosts; ->SP_ar_SalesMargin; ->SP_ar_SalesActual; ->SP_ad_ExpectedDate; ->SP_at_RelatedSaleTypeNM; ->SP_at_RelatedRecordCode; ->SP_ar_Probability; ->SP_at_PipelineStatus; ->SP_al_SalesProjectionID; ->SP_al_CompanyID; ->SP_al_CurrencyID; ->SP_al_SalesPipelineStatus; ->SP_al_RelatedSaleTypeID; ->SP_at_SalesProjectionContact; ->SP_al_SalesContactID; ->SP_al_SalesRelatedTableID; ->SP_al_SalesRelatedRecordID; ->SP_al_SalesRecordModified; ->SP_ar_SalesActualCosts)
LB_StyleSettings(->SP_LB_Pipeline; "Blue"; 9; "PIPE"; ->[PERSONNEL:11])

//AL_SetHeaders (SP_PowerviewPIPE;1;12;"Title";"Customer";"";"Value";"Costs";"Margin";"Actual";"Expected Date";"Type";"Related Record";"% Probability";"Status")
LB_SetColumnHeaders(->SP_LB_Pipeline; "PIPE_L"; 1; "Title"; "Customer"; ""; "Value"; "Costs"; "Margin"; "Actual"; "Expected Date"; "Type"; "Related Record"; "% Probability"; "Status")
//AL_SetWidths (SP_PowerviewPIPE;1;12;151;188;40;50;50;50;50;100;100;80;50;180)
LB_SetColumnWidths(->SP_LB_Pipeline; "oPIPE"; 1; 151; 188; 40; 50; 50; 50; 50; 100; 100; 80; 50; 180)  // dont need to worry about the invisible ones
//AL_SetSortOpts (SP_PowerviewPIPE;0;2;0;"";0;1)

//AL_SetScroll (SP_PowerviewPIPE;-2;-2)
LB_SetScroll(->SP_LB_Pipeline; -2; -2)

// todo: check this - I think that if the LB area is set to Enterable, all we need to do is say which ones are different
LB_SetChoiceList("lbCurrcodes"; ->SP_at_PopCurrencyCodes; ->SP_at_CurrencyCode)
//SET ENTERABLE(SP_ar_SalesActual;True)
OBJECT SET ENTERABLE:C238(SP_at_RelatedSaleTypeNM; False:C215)
LB_SetChoiceList("lbFilterProb"; ->SP_ar_FilterProbability2; ->SP_ar_Probability)
LB_SetChoiceList("lbPipeStatus"; ->SP_at_ListPipelineStatus; ->SP_at_PipelineStatus)
OBJECT SET FORMAT:C236(SP_ar_SalesMargin; "######0")
OBJECT SET FORMAT:C236(SP_ar_SalesValue; "######0")
OBJECT SET FORMAT:C236(SP_ar_SalesCosts; "######0")
OBJECT SET FORMAT:C236(SP_ar_Probability; "######0")
// todo: what uis this supposed to do?
//ARRAY INTEGER($_al_2dArray;0;0)
For ($_l_Index; 1; Size of array:C274(SP_ar_SalesActual))
	If (SP_ar_SalesActual{$_l_Index}>0)
	End if 
End for 

SP_PVProjectionSetSort

If (Not:C34(DB_bo_FontsInited))
	DB_SetDefaultFonts
End if 

LB_SETFONT(->SP_LB_Pipeline; "oPIPE"; 1; "◊FontBold"; 0; 0; <>SYS_l_DefaultBoldFontSize)  // header
LB_SETFONT(->SP_LB_Pipeline; "oPIPE"; 2; "◊FontPlain"; 0; 0; <>SYS_l_DefaultPlainFontSize)  // body
ERR_MethodTrackerReturn("SP_SetUpPowerviewPipeline"; $_t_oldMethodName)

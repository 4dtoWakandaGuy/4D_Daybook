//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_PVProjectionSetEntry
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SP_PVProjectionSetEntry
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SP_ad_ExpectedDate;0)
	//ARRAY REAL(SP_ar_FilterProbability2;0)
	//ARRAY REAL(SP_ar_Probability;0)
	//ARRAY REAL(SP_ar_SalesActual;0)
	//ARRAY REAL(SP_ar_SalesCosts;0)
	//ARRAY REAL(SP_ar_SalesMargin;0)
	//ARRAY REAL(SP_ar_SalesValue;0)
	//ARRAY TEXT(SP_at_CurrencyCode;0)
	//ARRAY TEXT(SP_at_ListPipelineStatus;0)
	//ARRAY TEXT(SP_at_PipelineStatus;0)
	//ARRAY TEXT(SP_at_PopCurrencyCodes;0)
	//ARRAY TEXT(SP_at_RelatedSaleTypeNM;0)
	//ARRAY TEXT(SP_at_SalesCustomerName;0)
	//ARRAY TEXT(SP_at_SalesTitle;0)
	C_LONGINT:C283($_l_CurrencyIndex; $_l_ListReference)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ListName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_PVProjectionSetEntry")


//AL_SetEnterable (SP_PowerviewPIPE;1;1)
OBJECT SET ENTERABLE:C238(SP_at_SalesTitle; True:C214)
//AL_SetEnterable (SP_PowerviewPIPE;2;1)
OBJECT SET ENTERABLE:C238(SP_at_SalesCustomerName; True:C214)
//AL_SetEnterable (SP_PowerviewPIPE;3;2;SP_at_PopCurrencyCodes)
$_t_ListName:="CurrencyCodes"+<>PER_t_CurrentUserInitials
$_l_ListReference:=New list:C375
For ($_l_CurrencyIndex; 1; Size of array:C274(SP_at_PopCurrencyCodes))
	APPEND TO LIST:C376($_l_ListReference; SP_at_PopCurrencyCodes{$_l_CurrencyIndex}; $_l_CurrencyIndex)
End for 
SAVE LIST:C384($_l_ListReference; $_t_ListName)
OBJECT SET LIST BY NAME:C237(SP_at_CurrencyCode; $_t_ListName)
OBJECT SET ENTERABLE:C238(SP_ar_SalesValue; True:C214)
OBJECT SET ENTERABLE:C238(SP_ar_SalesCosts; True:C214)
OBJECT SET ENTERABLE:C238(SP_ar_SalesMargin; True:C214)
OBJECT SET ENTERABLE:C238(SP_ar_SalesActual; True:C214)
OBJECT SET ENTERABLE:C238(SP_ad_ExpectedDate; True:C214)
OBJECT SET ENTERABLE:C238(SP_at_RelatedSaleTypeNM; True:C214)
LB_SetChoiceList("Probability"; ->SP_ar_FilterProbability2; ->SP_ar_Probability)

LB_SetChoiceList("PipeStatus"; ->SP_at_ListPipelineStatus; ->SP_at_PipelineStatus)


//ARRAY INTEGER($2darray;0;0)
// todo: I do not understand what this is supposed to be doing!!!!! pb
//For ($_l_CurrencyIndex;1;Size of array(SP_ar_SalesActual))
//If (SP_ar_SalesActual{$_l_CurrencyIndex}>0)

//Else 

//End if 
//End for 
ERR_MethodTrackerReturn("SP_PVProjectionSetEntry"; $_t_oldMethodName)

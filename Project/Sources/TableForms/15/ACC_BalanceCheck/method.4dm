If (False:C215)
	//Table Form Method Name: [USER]ACC_BalanceCheck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; ACC_l_AllAccounts; ACC_l_AllAnalysis; ACC_l_AllLayers; ACC_l_AllPeriods; ACC_l_AnalysisnoAutoat; ACC_l_CheckDuplicates; ACC_l_CheckExistance; ACC_l_CorrectBalances; ACC_l_CreateExistance; ACC_l_DeleteDuplicates)
	C_LONGINT:C283(ACC_l_layernoAutoat; ACC_l_MonthlyDetail)
	C_TEXT:C284($_t_oldMethodName; ACC_t_AccountEnd; ACC_t_AccountStart; ACC_t_AnalysisEnd; ACC_t_AnalysisStart; ACC_t_LayerEnd; ACC_t_LayerStart; ACC_t_PeriodEnd; ACC_t_PeriodStart)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].ACC_BalanceCheck"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "ACC_BalanceCheck")
		WS_AutoscreenSize(3; 455; 355)
		ACC_l_CheckExistance:=1
		ACC_l_CreateExistance:=1
		ACC_l_CheckDuplicates:=1
		ACC_l_DeleteDuplicates:=1
		ACC_l_MonthlyDetail:=1
		ACC_l_CorrectBalances:=0
		ACC_l_AllPeriods:=1
		ACC_l_AllAccounts:=1
		ACC_l_AllLayers:=1
		ACC_l_AllAnalysis:=1
		ACC_t_PeriodStart:=""
		ACC_t_PeriodEnd:=""
		ACC_t_AccountStart:=""
		ACC_t_AccountEnd:=""
		ACC_t_LayerStart:=""
		ACC_t_LayerEnd:=""
		ACC_t_AnalysisStart:=""
		ACC_t_AnalysisEnd:=""
		ACC_l_AnalysisnoAutoat:=1
		ACC_l_layernoAutoat:=1
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [USER].ACC_BalanceCheck"; $_t_oldMethodName)

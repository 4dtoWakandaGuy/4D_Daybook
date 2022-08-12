//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_ShowAgedDebtorsStats
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    11/11/2010 21:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($2; PUR_D_Date; VDate)
	C_LONGINT:C283($1; PUR_l_CallBackProcess)
	C_TEXT:C284($_t_oldMethodName; $3; $4; $5; $6; $7; $8; $9; ACC_t_PeriodFrom; INV_t_SReportTitle1; INV_t_SReportTitle2)
	C_TEXT:C284(INV_t_SReportTitle3; INV_t_SReportTitle4; INV_t_SReportTitle5; INV_t_SReportTitle6; INV_t_SReportvalue1; INV_t_SReportvalue2; INV_t_SReportvalue3; INV_t_SReportvalue4; INV_t_SReportvalue5; INV_t_SReportvalue6)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_ShowAgedDebtorsStats")
If (Count parameters:C259>=1)
	
	PUR_l_CallBackProcess:=$1
	PUR_D_Date:=$2
	VDate:=Current date:C33
	ACC_t_PeriodFrom:=$3
	INV_t_SReportTitle1:="Total Companies"
	INV_t_SReportTitle2:="Total Due"
	INV_t_SReportTitle3:="<"+String:C10(DB_GetLedgerADStageOne)+" days"
	INV_t_SReportTitle4:=String:C10(DB_GetLedgerADStageOne+1)+"-"+String:C10(DB_GetLedgerADStageTwo)+" days"
	INV_t_SReportTitle5:=String:C10(DB_GetLedgerADStageTwo+1)+"-"+String:C10(DB_GetLedgerADStageThree)+" days"
	INV_t_SReportTitle6:=String:C10(DB_GetLedgerADStageTwo+1)+"-"+String:C10(DB_GetLedgerADStageThree)+" days"
	INV_t_SReportvalue1:=$4
	INV_t_SReportvalue2:=$5
	INV_t_SReportvalue3:=$6
	INV_t_SReportvalue4:=$7
	INV_t_SReportvalue5:=$8
	INV_t_SReportvalue6:=$9
	Open window:C153(Screen width:C187-220; 80; Screen width:C187-20; 170+80; -Palette window:K34:3)
	DIALOG:C40("PUR_CreditorsStats")
	
	
End if 
ERR_MethodTrackerReturn("PUR_ShowAgedDebtorsStats"; $_t_oldMethodName)

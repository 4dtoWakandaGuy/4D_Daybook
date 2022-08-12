//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      Gen ScrRepLPTit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//Array BOOLEAN(GEN_lb_ItemsArea;0)
	C_LONGINT:C283(r1)
	C_TEXT:C284($_t_oldMethodName; ACC_t_PeriodFrom; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5; vTitle6; vTitle7; vTitle8)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen ScrRepLPTit")

//Gen ScrRepLPtit
$_t_oldMethodName:=ERR_MethodTracker("Gen ScrRepLPTit")
vTitle1:="Company Code"
vTitle2:="Company Name"
vTitle3:="Credit Limit"
vTitle4:="Total Due"
If (r1=1)
	vTitle5:="<"+String:C10(DB_GetLedgerADStageOne)+" days"
	vTitle6:=String:C10(DB_GetLedgerADStageOne+1)+"-"+String:C10(DB_GetLedgerADStageTwo)+" days"
	vTitle7:=String:C10(DB_GetLedgerADStageTwo+1)+"-"+String:C10(DB_GetLedgerADStageThree)+" days"
	vTitle8:=">"+String:C10(DB_GetLedgerADStageThree)+" days"
Else 
	MESSAGES OFF:C175
	QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1>=ACC_t_PeriodFrom)
	ORDER BY:C49([PERIODS:33]; [PERIODS:33]Period_Code:1; >)
	REDUCE SELECTION:C351([PERIODS:33]; 4)
	ORDER BY:C49([PERIODS:33]Period_Code:1; >)
	vTitle5:="to "+[PERIODS:33]Period_Code:1
	NEXT RECORD:C51([PERIODS:33])
	vTitle6:=[PERIODS:33]Period_Code:1
	NEXT RECORD:C51([PERIODS:33])
	vTitle7:=[PERIODS:33]Period_Code:1
	NEXT RECORD:C51([PERIODS:33])
	vTitle8:="from "+[PERIODS:33]Period_Code:1
	MESSAGES ON:C181
End if 
LB_SetColumnHeaders(->GEN_lb_ItemsArea; "INVi_L"; 1; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5; vTitle6; vTitle7; vTitle8)
//AL_SetHeaders (eALContI;1;8;vTitle1;vTitle2;vTitle3;vTitle4;vTitle5;vTitle6;vTitle7;vTitle8)
ERR_MethodTrackerReturn("Gen ScrRepLPTit"; $_t_oldMethodName)
If (False:C215)
	//object Name: [COMPANIES]dAsk_Startup2.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(SRCH_d_EntryDateTo; vDate)
	C_LONGINT:C283($_l_PeriodID; ch1; ch2; ch3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_Startup2.Variable3"; Form event code:C388)
vDate:=SRCH_d_EntryDateTo
$_l_PeriodID:=Check_Period
If (Records in selection:C76([PERIODS:33])=0)
	Gen_Alert("That date does not correspond to any Daybook Period.  "+"Please Check_Period setups in the Data Manager,"+" then change this setting in the Accounts Section of Preferences.")
	ch1:=0
	ch2:=0
	ch3:=0
	OBJECT SET ENABLED:C1123(ch1; False:C215)
	OBJECT SET ENABLED:C1123(ch2; False:C215)
	OBJECT SET ENABLED:C1123(ch3; False:C215)
	SRCH_d_EntryDateTo:=!00-00-00!
Else 
	[USER:15]Year PeriodT:23:=[PERIODS:33]Period_Code:1
	OBJECT SET ENABLED:C1123(ch1; True:C214)
	OBJECT SET ENABLED:C1123(ch2; True:C214)
	OBJECT SET ENABLED:C1123(ch3; True:C214)
	Startup_Page2ch
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_Startup2.Variable3"; $_t_oldMethodName)

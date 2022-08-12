If (False:C215)
	//Table Form Method Name: [COMPANIES]dAsk_Startup2
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(<>DB_d_CurrentDate; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo)
	C_LONGINT:C283($_l_event; r1)
	C_PICTURE:C286(<>PictLogoMed)
	C_TEXT:C284($_t_oldMethodName; vTitle1)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dAsk_Startup2"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	
	//GET PICTURE FROM LIBRARY(20240; <>PictLogoMed)
	<>PictLogoMed:=Get_Picture(20240)
	OpenHelp(Table:C252(->[COMPANIES:2]); "dAsk_Startup2")
	If (([USER:15]Year PeriodF:22#"") & ([USER:15]Year PeriodT:23#""))
		MESSAGES OFF:C175
		QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[USER:15]Year PeriodF:22)
		SRCH_d_EntryDateFrom:=[PERIODS:33]From_Date:3
		QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[USER:15]Year PeriodT:23)
		MESSAGES ON:C181
		SRCH_d_EntryDateTo:=[PERIODS:33]To_Date:4
	Else 
		SRCH_d_EntryDateFrom:=Date_FromNums(1; 4; Year of:C25(<>DB_d_CurrentDate))
		SRCH_d_EntryDateTo:=Date_FromNums(31; 3; Year of:C25(<>DB_d_CurrentDate)+1)
	End if 
	
	If ([USER:15]VAT CashAcc:211="")
		vTitle1:="A Cash VAT Account should first be defined in Preferences"
		OBJECT SET ENABLED:C1123(r1; False:C215)
	Else 
		vTitle1:="If your business is registered for the Cash VAT  scheme, check here"
		r1:=Num:C11([USER:15]VAT Cash:212)
	End if 
	
	Startup_Page2ch
	INT_SetDialog
	SD2_SetDiaryPopup
End if 
ERR_MethodTrackerReturn("FM [COMPANIES].dAsk_Startup2"; $_t_oldMethodName)

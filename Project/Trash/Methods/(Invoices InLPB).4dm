//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 16:10
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PersAnOver; INV_bo_PeriodSet; vFromIn)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_PeriodID; vAdd; vIN)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; <>SYS_t_BaseCurrency; <>SYS_t_DefaultTelFormat; $_t_oldMethodName; COM_t_TelephoneNumberFormat; INV_t_SetPeriodCode; vButtDisInv; vCompName; vContName; vPeriod; vStage)
	C_TEXT:C284(vTel; vVATTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InLPB")
//Project Method Invoices_InLPB 2/3/2(ID 26176-2412)

//Invoices_InLPB
vCompName:=[COMPANIES:2]Company_Name:2
vTel:=[COMPANIES:2]Telephone:9
If ([COMPANIES:2]Country:8#"")
	If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
		QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
		COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
	End if 
Else 
	COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
End if 
If (COM_t_TelephoneNumberFormat#"")
	OBJECT SET FORMAT:C236(vTel; COM_t_TelephoneNumberFormat)
	
End if 
vContName:=CON_BuildContactNameandJobTitle
vIN:=1

If ([INVOICES:39]Invoice_Date:4=!00-00-00!)
	[INVOICES:39]Invoice_Date:4:=<>DB_d_CurrentDate
	vDate:=<>DB_d_CurrentDate
	If (INV_bo_PeriodSet)
		QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=INV_t_SetPeriodCode)
		INV_bo_PeriodSet:=False:C215
		INV_t_SetPeriodCode:=""
		
		
	Else 
		$_l_PeriodID:=Check_Period
		Check_PerCloseI
	End if 
	[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
	If (<>PersAnOver)
		[INVOICES:39]Analysis_Code:17:=<>Per_t_CurrentDefaultAnalCode
	End if 
	If ([INVOICES:39]Currency_Code:27="")
		[INVOICES:39]Currency_Code:27:=<>SYS_t_BaseCurrency
	End if 
	Layer_Fill(->[INVOICES:39]Layer_Code:38)
	If ((DB_GetLedgerisCashVAT) & (DB_GetLedgerCashvatACC#"") & ([INVOICES:39]State:10#-2))
		[INVOICES:39]Cash_TAX:41:=True:C214
	End if 
End if 
Invoices_InLPSt
RELATE ONE:C42([INVOICES:39]Period_Code:13)
vPeriod:=[PERIODS:33]Period_Name:2
RELATE ONE:C42([INVOICES:39]Credit_Stage:22)
vStage:=[CREDIT_STAGES:54]Stage_Name:2
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
	OBJECT SET ENTERABLE:C238([INVOICES:39]Currency_Code:27; False:C215)
End if 
If ([INVOICES:39]UK_EC:21="")
	Invoices_UKEC
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
	OBJECT SET ENTERABLE:C238([INVOICES:39]Layer_Code:38; False:C215)
End if 

vVATTitle:=Term VATWT("Amount/VAT")
GOTO OBJECT:C206([INVOICES:39]Company_Code:2)
If (vAdd=0)
	DB_MenuAction("Functions"; "Copy Previous"; 3; "")
	DB_MenuAction("Functions"; "Opening Balance"; 3; "")
End if 
If ([INVOICES:39]State:10<-1)
	DB_MenuAction("Functions"; "Print"; 3; "")
Else 
	DB_MenuAction("Functions"; "Print"; 2; "")
	
End if 
If ([INVOICES:39]Posted_Date:8=!00-00-00!)
	vButtDisInv:="I       FSSSRCAD "
Else 
	vButtDisInv:="I  PMO  FSSSRCAD "
End if 
Input_Buttons(->[INVOICES:39]; ->vButtDisInv; "Invoice"; "Invoice Item")
vFromIn:=False:C215
ERR_MethodTrackerReturn("Invoices_InLPB"; $_t_oldMethodName)
//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Menu ListsP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     28/11/2010 21:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MenuProc)
	C_TEXT:C284(<>DB_t_PostcodeLabel; $_t_oldMethodName; $_t_TaxName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu ListsP")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
//  If ((◊Level>1) | (DB_GetModuleSetting(◊ModNo)#2))
//  DISABLE ITEM(3;11;◊MenuProc)
//  End if
If (<>DB_t_PostcodeLabel#"Postcode")
	DB_MenuAction("Core"; "  Postcodes"; 1; "  "+<>DB_t_PostcodeLabel+"s"; <>MenuProc; False:C215)
	//SET_MENU ITEM(3;3;"  "+◊ATPostcode+"s";◊MenuProc)
End if 
If ((DB_GetModuleSettingByNUM(Module_StockControl))<2)  //Stock
	DB_MenuAction("Financials"; "  Stock Types"; 3; " "; <>MenuProc; False:C215)
	DB_MenuAction("Financials"; "  Stock Locations"; 3; " "; <>MenuProc; False:C215)
	DB_MenuAction("Financials"; "  Movement Types"; 3; " "; <>MenuProc; False:C215)
	
End if 


DB_MenuAction("Financials"; "  Stock Types"; 1; Term_StoWT("  Stock Types"); <>MenuProc; False:C215)
DB_MenuAction("Financials"; "  Stock Locations"; 1; Term_StoWT("  Stock Locations "); <>MenuProc; False:C215)

DB_MenuAction("Financials"; "  STOCK CONTROL"; 1; Uppercase:C13(Term_StoWT("STOCK CONTROL")); <>MenuProc; False:C215)

If ((DB_GetModuleSettingByNUM(Module_SalesLedger))<2)  //Sales
	DB_MenuAction("Financials"; "  Credit Stages  "; 3; " "; <>MenuProc; False:C215)
	//DISABLE MENU ITEM(4;7;◊MenuProc)
End if 
If ((DB_GetModuleSettingByNUM(Module_NominalLedger)<2) & (DB_GetModuleSettingByNUM(Module_PurchaseLedger)<2) & (DB_GetModuleSettingByNUM(Module_SalesLedger)<2))  //Nom, Purch, Sales
	DB_MenuAction("Financials"; "GENERAL LEDGER"; 3; " "; <>MenuProc; False:C215)
	DB_MenuAction("Financials"; "  Accounts"; 3; " "; <>MenuProc; False:C215)
	DB_MenuAction("Financials"; "   Account Headings"; 3; " "; <>MenuProc; False:C215)
	DB_MenuAction("Financials"; "  Periods"; 3; " "; <>MenuProc; False:C215)
	DB_MenuAction("Utilities"; "Close Period"; 3; " "; <>MenuProc; False:C215)
	DB_MenuAction("Utilities"; "Close Financial Year"; 3; " "; <>MenuProc; False:C215)
	DB_MenuAction("Utilities"; "Amalgamate Transactions  "; 3; " "; <>MenuProc; False:C215)
	DB_MenuAction("Utilities"; "Check Account Balances"; 3; " "; <>MenuProc; False:C215)
	DB_MenuAction("Utilities"; "Clear Down Accounts"; 3; " "; <>MenuProc; False:C215)
	DB_MenuAction("Utilities"; "Repost Transactions"; 3; " "; <>MenuProc; False:C215)
	DB_MenuAction("Utilities"; "Repost Invoice"; 3; " "; <>MenuProc; False:C215)
	DB_MenuAction("Utilities"; "Check Transactions"; 3; " "; <>MenuProc; False:C215)
	DB_MenuAction("Utilities"; "Check Transactions"; 3; " "; <>MenuProc; False:C215)
	
End if 
//If (◊TermGL)
//SET ITEM(4;9;"GENERAL LEDGER";◊MenuProc)
//End if
$_t_TaxName:=Term VATWT("  Tax Codes")
If ($_t_TaxName#"  Tax Codes")
	DB_MenuAction("Financials"; "  Tax Codes"; 1; $_t_TaxName)
End if 
ERR_MethodTrackerReturn("Menu ListsP"; $_t_oldMethodName)

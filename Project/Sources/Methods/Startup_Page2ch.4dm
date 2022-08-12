//%attributes = {}
If (False:C215)
	//Project Method Name:      Startup_Page2ch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ch1; ch2; ch3; s1; s2)
	C_TEXT:C284(<>SYS_t_ACCOpenBalancesStatus; $_t_oldMethodName)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Startup_Page2ch")
If (<>SYS_t_ACCOpenBalancesStatus="")
	If ((DB_GetLedgerTRANSINVpost="") | (Records in table:C83([ACCOUNTS:32])=0) | (Records in table:C83([PERIODS:33])=0))
		OBJECT SET ENABLED:C1123(ch1; False:C215)
	Else 
		ch1:=1
	End if 
	If ((DB_GetLedgerTRANSPURpost="") | (Records in table:C83([ACCOUNTS:32])=0) | (Records in table:C83([PERIODS:33])=0))
		OBJECT SET ENABLED:C1123(ch2; False:C215)
	Else 
		ch2:=1
	End if 
	If ((Records in table:C83([ACCOUNTS:32])=0) | (Records in table:C83([PERIODS:33])=0))
		OBJECT SET ENABLED:C1123(ch3; False:C215)
		OBJECT SET ENABLED:C1123(s1; False:C215)
		OBJECT SET ENABLED:C1123(s2; False:C215)
	Else 
		ch3:=1
		s1:=1
	End if 
Else 
	//Gen_Alert ("From Startup_Page2ch ")  `26/1/2010
	OK:=1
	ON ERR CALL:C155("Remote_Err")
	vDoc:=DB_OpenDocument("SLOpeBal.TXT")
	If (OK=1)
		ch1:=1
		OBJECT SET TITLE:C194(ch1; "Sales Ledger (In progress)")
		CLOSE DOCUMENT:C267(vDoc)
	End if 
	ON ERR CALL:C155("Remote_Err")
	vDoc:=DB_OpenDocument("PLOpeBal.TXT")
	If (OK=1)
		ch2:=1
		OBJECT SET TITLE:C194(ch2; "Purchase Ledger (In progress)")
		CLOSE DOCUMENT:C267(vDoc)
	End if 
	ON ERR CALL:C155("Remote_Err")
	vDoc:=DB_OpenDocument("GLOpeBal.TXT")
	If (OK=1)
		ch3:=1
		OBJECT SET TITLE:C194(ch3; "General Ledger (In progress)")
		OBJECT SET ENABLED:C1123(s1; False:C215)
		OBJECT SET ENABLED:C1123(s2; False:C215)
		CLOSE DOCUMENT:C267(vDoc)
	End if 
	ON ERR CALL:C155("")
End if 
ERR_MethodTrackerReturn("Startup_Page2ch"; $_t_oldMethodName)

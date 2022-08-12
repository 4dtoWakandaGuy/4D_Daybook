//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_ADSRSt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($1)
	C_TEXT:C284($_t_oldMethodName; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_ADSRSt")
//Invoices_ADSRSt - created for Seymour 4.1.001
QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=$1)
ORDER BY:C49([PERIODS:33]; [PERIODS:33]Period_Code:1; <)

FIRST RECORD:C50([PERIODS:33])
vTitle1:=[PERIODS:33]Period_Code:1
NEXT RECORD:C51([PERIODS:33])
vTitle2:=[PERIODS:33]Period_Code:1
NEXT RECORD:C51([PERIODS:33])
vTitle3:=[PERIODS:33]Period_Code:1
NEXT RECORD:C51([PERIODS:33])
vTitle4:=[PERIODS:33]Period_Code:1
NEXT RECORD:C51([PERIODS:33])
vTitle5:=[PERIODS:33]Period_Code:1
ERR_MethodTrackerReturn("Invoices_ADSRSt"; $_t_oldMethodName)
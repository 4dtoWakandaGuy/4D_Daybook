//%attributes = {}
If (False:C215)
	//Project Method Name:      Periods InDel
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Periods InDel")
QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=[PERIODS:33]Period_Code:1)
If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
	Gen_Alert("This Period has been used and cannot be deleted"; "")
Else 
	Are_You_Sure
	If (OK=1)
		DELETE RECORD:C58([PERIODS:33])
		CANCEL:C270
		ALL RECORDS:C47([PERIODS:33])
		Gen_InNoF(->[PERIODS:33])
	End if 
End if 
ERR_MethodTrackerReturn("Periods InDel"; $_t_oldMethodName)
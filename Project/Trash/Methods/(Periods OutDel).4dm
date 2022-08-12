//%attributes = {}
If (False:C215)
	//Project Method Name:      Periods OutDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 17:36
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

$_t_oldMethodName:=ERR_MethodTracker("Periods OutDel")
//Periods Del
USE SET:C118("Userset")
QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4="zzzz")
FIRST RECORD:C50([PERIODS:33])
While ((Not:C34(End selection:C36([PERIODS:33]))) & (Records in selection:C76([ACCOUNT_BALANCES:34])=0))
	QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=[PERIODS:33]Period_Code:1)
	NEXT RECORD:C51([PERIODS:33])
End while 
If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
	Gen_Alert("At least one selected Period has been used"; "Cancel")
Else 
	Are_You_Sure
	If (OK=1)
		DELETE SELECTION:C66([PERIODS:33])
	End if 
End if 
ALL RECORDS:C47([PERIODS:33])
Gen_OutNo(->[PERIODS:33])
ERR_MethodTrackerReturn("Periods OutDel"; $_t_oldMethodName)
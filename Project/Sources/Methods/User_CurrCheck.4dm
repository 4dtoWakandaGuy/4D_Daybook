//%attributes = {}
If (False:C215)
	//Project Method Name:      User_CurrCheck
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

$_t_oldMethodName:=ERR_MethodTracker("User_CurrCheck")
If ([USER:15]Base Currency:120#"")
	QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=[USER:15]Base Currency:120)
	If (Records in selection:C76([CURRENCIES:71])=0)
		CREATE RECORD:C68([CURRENCIES:71])
		[CURRENCIES:71]Currency_Code:1:=[USER:15]Base Currency:120
		DB_SaveRecord(->[CURRENCIES:71])
		AA_CheckFileUnlocked(->[CURRENCIES:71]X_ID:3)
		UNLOAD RECORD:C212([CURRENCIES:71])
	End if 
End if 
ERR_MethodTrackerReturn("User_CurrCheck"; $_t_oldMethodName)
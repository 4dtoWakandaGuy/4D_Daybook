//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products_SuLPA
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
	//ARRAY TEXT(SVS_at_PreviewNote;0)
	C_REAL:C285(vAmount)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_SuLPA")
//Products_SuLPA
OK:=1
If ([PRODUCTS:9]Subscription_Perpetual:41=False:C215)
	If (vAmount#0)
		Gen_Confirm("There is a difference of "+String:C10(vAmount; "|Accounts")+" on the Amount to be billed.  Are you sure?"; "Continue"; "Try again")
	End if 
End if 
If (OK=1)
	If (Modified record:C314([SUBSCRIPTIONS:93]))
		DB_SaveRecord(->[SUBSCRIPTIONS:93])
		AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
	End if 
	ARRAY TEXT:C222(SVS_at_PreviewNote; 0)
	ACCEPT:C269
End if 
ERR_MethodTrackerReturn("Products_SuLPA"; $_t_oldMethodName)
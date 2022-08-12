//%attributes = {}
If (False:C215)
	//Project Method Name:      Subscriptions_inLPX
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
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_Event)
	C_POINTER:C301($1)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Subscriptions_inLPX")

//NG April 2004
//new method created to handle data modication of subscription
//derived from the subform area scripts of[SUBSCRIPTIONS];"Items Sub" and [SUBSCRIPTIONS];"Subscript_sub"
$_t_oldMethodName:=ERR_MethodTracker("Subscriptions_inLPX"; Form event code:C388)
$_l_Event:=Form event code:C388



Case of 
	: ($1=(->[SUBSCRIPTIONS:93]Type:7))
		[SUBSCRIPTIONS:93]Type:7:=Uppercase:C13([SUBSCRIPTIONS:93]Type:7)
		Case of 
			: ([SUBSCRIPTIONS:93]Type:7="ISS")
				[SUBSCRIPTIONS:93]X_Subscription_Type:12:="Issue"
			: ([SUBSCRIPTIONS:93]Type:7="BIP")
				[SUBSCRIPTIONS:93]X_Subscription_Type:12:="Bill - Invoice & Payment"
			: ([SUBSCRIPTIONS:93]Type:7="BIN")
				[SUBSCRIPTIONS:93]X_Subscription_Type:12:="Bill - Invoice but No Payment"
			: ([SUBSCRIPTIONS:93]Type:7="BNP")
				[SUBSCRIPTIONS:93]X_Subscription_Type:12:="Bill - No Invoice but Payment"
			: ([SUBSCRIPTIONS:93]Type:7="BNN")
				[SUBSCRIPTIONS:93]X_Subscription_Type:12:="Bill - No Invoice & No Payment"
			: ([SUBSCRIPTIONS:93]Type:7="REN")
				[SUBSCRIPTIONS:93]X_Subscription_Type:12:="Renewal Letter"
			Else 
				[SUBSCRIPTIONS:93]X_Subscription_Type:12:=""
		End case 
	: ($1=(->[SUBSCRIPTIONS:93]Unit_Number:6))
		Case of 
			: ([SUBSCRIPTIONS:93]Unit_Number:6=1)
				[SUBSCRIPTIONS:93]X_Units_Type:13:="Day"
			: ([SUBSCRIPTIONS:93]Unit_Number:6=7)
				[SUBSCRIPTIONS:93]X_Units_Type:13:="Week"
			: ([SUBSCRIPTIONS:93]Unit_Number:6=31)
				[SUBSCRIPTIONS:93]X_Units_Type:13:="Month"
			: ([SUBSCRIPTIONS:93]Unit_Number:6=365)
				[SUBSCRIPTIONS:93]X_Units_Type:13:="Year"
			Else 
				[SUBSCRIPTIONS:93]X_Units_Type:13:="Other"
		End case 
	: ($1=(->[SUBSCRIPTIONS:93]Subscription_Date:3))
		If ([SUBSCRIPTIONS:93]Subscription_Date:3#!00-00-00!)
			[SUBSCRIPTIONS:93]X_Dayname:14:=DayName([SUBSCRIPTIONS:93]Subscription_Date:3)
		Else 
			[SUBSCRIPTIONS:93]X_Dayname:14:=""
		End if 
	: ($1=(->[SUBSCRIPTIONS:93]After_Number:5))
		
		
		
	: ($1=(->[SUBSCRIPTIONS:93]Amount_Excluding_Tax:8))
		If (([SUBSCRIPTIONS:93]Amount_Excluding_Tax:8#0) & ([SUBSCRIPTIONS:93]Type:7#"B@"))
			Gen_Alert("NB: Amounts are actually relevant only for Billing items"; "OK")
		End if 
		vTot:=1
	: ($1=(->[SUBSCRIPTIONS:93]Invoice_Number:10))
		If ([SUBSCRIPTIONS:93]Invoice_Number:10="Stop")
			[SUBSCRIPTIONS:93]Date_Done:9:=<>DB_d_CurrentDate
		End if 
		
End case 
Macro_AccTypePt($1)  // note this possibility did not exist in the previous version
ERR_MethodTrackerReturn("Subscriptions_inLPX"; $_t_oldMethodName)
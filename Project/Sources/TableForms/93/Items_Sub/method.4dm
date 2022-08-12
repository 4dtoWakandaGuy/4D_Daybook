If (False:C215)
	//Table Form Method Name: [SUBSCRIPTIONS]items_sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_event)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName; vLongDate; vProblem; vSolution)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [SUBSCRIPTIONS].items_sub"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Data Change:K2:15)
		Case of 
			: ([SUBSCRIPTIONS:93]Type:7="ISS")
				vProblem:="Issue"
			: ([SUBSCRIPTIONS:93]Type:7="BIP")
				vProblem:="Bill - Invoice & Payment"
			: ([SUBSCRIPTIONS:93]Type:7="BIN")
				vProblem:="Bill - Invoice but No Payment"
			: ([SUBSCRIPTIONS:93]Type:7="BNP")
				vProblem:="Bill - No Invoice but Payment"
			: ([SUBSCRIPTIONS:93]Type:7="BNN")
				vProblem:="Bill - No Invoice & No Payment"
			: ([SUBSCRIPTIONS:93]Type:7="REN")
				vProblem:="Renewal Letter"
			Else 
				vProblem:=""
		End case 
		Case of 
			: (Modified:C32([SUBSCRIPTIONS:93]Subscription_Date:3))
				//  If ([SUBSCRIPTIONS]Subs Date#!00/00/00!)
				//  [SUBSCRIPTIONS]After No:=0
				//  End if
			: (Modified:C32([SUBSCRIPTIONS:93]After_Number:5))
				//    If ([SUBSCRIPTIONS]After No#0)
				//     [SUBSCRIPTIONS]Subs Date:=!00/00/00!
				//    End if
			: (Modified:C32([SUBSCRIPTIONS:93]Type:7))
				If (vProblem="")
					Gen_Alert("Only the following Types are allowed: ISS, BIP, BIN, BNP, BNN or REN"; "OK")
					[SUBSCRIPTIONS:93]Type:7:="ISS"
					vProblem:="Issue"
				Else 
					[SUBSCRIPTIONS:93]Type:7:=Uppercase:C13([SUBSCRIPTIONS:93]Type:7)
				End if 
			: (Modified:C32([SUBSCRIPTIONS:93]Amount_Excluding_Tax:8))
				If (([SUBSCRIPTIONS:93]Amount_Excluding_Tax:8#0) & ([SUBSCRIPTIONS:93]Type:7#"B@"))
					Gen_Alert("NB: Amounts are actually relevant only for Billing items"; "OK")
				End if 
				vTot:=1
			: (Modified:C32([SUBSCRIPTIONS:93]Invoice_Number:10))
				If ([SUBSCRIPTIONS:93]Invoice_Number:10="Stop")
					[SUBSCRIPTIONS:93]Date_Done:9:=<>DB_d_CurrentDate
				End if 
		End case 
		
		Case of 
			: ([SUBSCRIPTIONS:93]Unit_Number:6=1)
				vSolution:="Day"
			: ([SUBSCRIPTIONS:93]Unit_Number:6=7)
				vSolution:="Week"
			: ([SUBSCRIPTIONS:93]Unit_Number:6=31)
				vSolution:="Month"
			: ([SUBSCRIPTIONS:93]Unit_Number:6=365)
				vSolution:="Year"
			Else 
				vSolution:="Other"
		End case 
		If ([SUBSCRIPTIONS:93]Subscription_Date:3#!00-00-00!)
			vLongDate:=DayName([SUBSCRIPTIONS:93]Subscription_Date:3)
		Else 
			vLongDate:=""
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[SUBSCRIPTIONS:93]); "items_sub")
		[SUBSCRIPTIONS:93]Order_Item_Number:4:=[ORDER_ITEMS:25]Item_Number:27
		[SUBSCRIPTIONS:93]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
		[SUBSCRIPTIONS:93]Unit_Number:6:=7
		vSolution:="Week"
		[SUBSCRIPTIONS:93]Type:7:="ISS"
		vProblem:="Issue"
End case 
ERR_MethodTrackerReturn("FM [SUBSCRIPTIONS].items_sub"; $_t_oldMethodName)

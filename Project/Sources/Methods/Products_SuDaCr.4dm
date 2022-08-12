//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_SuDaCr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   26/10/2010 10:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; vDateF; vDateT)
	C_LONGINT:C283($_l_AddDays; $_l_Dayof; $_l_ItemNumber)
	C_TEXT:C284($_t_oldMethodName; vButtDisPro)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_SuDaCr")
//xSelect - Products_SuDaCr - Subscriptions Dates Create
Menu_Record("Products_SuDaCr"; "Create Dates")
If (vButtDisPro="IP@")
	$_l_ItemNumber:=0
Else 
	$_l_ItemNumber:=[ORDER_ITEMS:25]Item_Number:27
End if 
vDateF:=Gen_RequestDate("Date From:"; Is date:K8:7)


If ((OK=1) & (vDateF#!00-00-00!))
	vDateT:=Date:C102(Gen_Request("Date To:"))
	If ((OK=1) & (vDateT#!00-00-00!))
		Gen_Confirm("Create Months or Quarters?"; "Months"; "Quarters")
		If (OK=1)
			$_l_AddDays:=31
		Else 
			$_l_AddDays:=92
		End if 
		CREATE RECORD:C68([SUBSCRIPTIONS:93])
		[SUBSCRIPTIONS:93]Product_Code:1:=[PRODUCTS:9]Product_Code:1
		[SUBSCRIPTIONS:93]Subscription_Date:3:=vDateF
		[SUBSCRIPTIONS:93]Order_Item_Number:4:=$_l_ItemNumber
		DB_SaveRecord(->[SUBSCRIPTIONS:93])
		AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
		$_l_Dayof:=Day of:C23(vDateF)
		$_d_Date:=vDateF+$_l_AddDays
		$_d_Date:=Date_FromNums($_l_Dayof; Month of:C24($_d_Date); Year of:C25($_d_Date))
		While ($_d_Date<=vDateT)
			CREATE RECORD:C68([SUBSCRIPTIONS:93])
			[SUBSCRIPTIONS:93]Product_Code:1:=[PRODUCTS:9]Product_Code:1
			[SUBSCRIPTIONS:93]Subscription_Date:3:=$_d_Date
			[SUBSCRIPTIONS:93]Order_Item_Number:4:=$_l_ItemNumber
			DB_SaveRecord(->[SUBSCRIPTIONS:93])
			AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
			$_d_Date:=$_d_Date+$_l_AddDays
			$_d_Date:=Date_FromNums($_l_Dayof; Month of:C24($_d_Date); Year of:C25($_d_Date))
		End while 
	End if 
End if 
QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=$_l_ItemNumber)
ERR_MethodTrackerReturn("Products_SuDaCr"; $_t_oldMethodName)

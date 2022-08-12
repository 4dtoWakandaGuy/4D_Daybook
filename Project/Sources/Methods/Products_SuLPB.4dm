//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_SuLPB
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
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(r1; r2; r3; s1; s2)
	C_REAL:C285(vAmount; vTot; vTotal)
	C_TEXT:C284($_t_oldMethodName; vButtDisPro; vDates)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_SuLPB")
//Products_SuLPB
QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=0)
PROD_LoadSubscriptions
vTotal:=Round:C94(Sum:C1([SUBSCRIPTIONS:93]Amount_Excluding_Tax:8); 2)
vAmount:=Round:C94(([PRODUCTS:9]Sales_Price:9-vTotal); 2)
vTot:=0

If (([PRODUCTS:9]Unit_Number:29=0) | ([PRODUCTS:9]First_Issue_Date:32=!00-00-00!))
	[PRODUCTS:9]Unit_Number:29:=7
	[PRODUCTS:9]Issues_Number:27:=1
	[PRODUCTS:9]Start_Number:30:=7
	[PRODUCTS:9]First_Issue_Date:32:=<>DB_d_CurrentDate
End if 
vDates:=DayName([PRODUCTS:9]First_Issue_Date:32)

Case of 
	: ([PRODUCTS:9]Start_Number:30=7)
		r1:=1
	: ([PRODUCTS:9]Start_Number:30=31)
		r2:=1
	: ([PRODUCTS:9]Start_Number:30=0)
		r3:=1
End case 
Case of 
	: ([PRODUCTS:9]First_Day_Month:33=1)
		s1:=1
	: ([PRODUCTS:9]First_Day_Month:33=0)
		s2:=1
End case 

ARRAY TEXT:C222(SVS_at_PreviewNote; 4)
SVS_at_PreviewNote{1}:="Day"
SVS_at_PreviewNote{2}:="Week"
SVS_at_PreviewNote{3}:="Month"
SVS_at_PreviewNote{4}:="Year"
Case of 
	: ([PRODUCTS:9]Unit_Number:29=7)
		SVS_at_PreviewNote:=2
	: ([PRODUCTS:9]Unit_Number:29=1)
		SVS_at_PreviewNote:=1
	: ([PRODUCTS:9]Unit_Number:29=31)
		SVS_at_PreviewNote:=3
	: ([PRODUCTS:9]Unit_Number:29=365)
		SVS_at_PreviewNote:=4
End case 
//Products_InLPB
vButtDisPro:="IPD     FSS R ADT"
Input_Buttons(->[PRODUCTS:9]; ->vButtDisPro)
Macro_AccType("Load "+String:C10(Table:C252(->[PRODUCTS:9])))
ERR_MethodTrackerReturn("Products_SuLPB"; $_t_oldMethodName)
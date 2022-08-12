//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letter Replace
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 12:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(rComp; rCont; rContr; rDiary; rOrd; rState)
	C_TEXT:C284($_t_oldMethodName; vItems; vName; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter Replace")
//Project Method Letter Replace 2/3/2(ID 19066-2744)

//Letter Replace
RELATE ONE:C42([COMPANIES:2]Area:11)
RELATE ONE:C42([COMPANIES:2]Status:12)
RELATE ONE:C42([COMPANIES:2]Company_Type:13)
RELATE ONE:C42([COMPANIES:2]Source:14)
Case of 
	: (rComp=1)
		If ([COMPANIES:2]Sales_Person:29="")
			RELATE ONE:C42([COMPANIES:2]Taken_By:26)
		Else 
			RELATE ONE:C42([COMPANIES:2]Sales_Person:29)
		End if 
	: (rCont=1)
		If ([COMPANIES:2]Sales_Person:29="")
			RELATE ONE:C42([COMPANIES:2]Taken_By:26)
		Else 
			RELATE ONE:C42([COMPANIES:2]Sales_Person:29)
		End if 
	: (rDiary=1)
		If ([DIARY:12]Product_Code:13#"")
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[DIARY:12]Product_Code:13)
		Else 
			REDUCE SELECTION:C351([PRODUCTS:9]; 0)
		End if 
		If ([DIARY:12]Action_Code:9#"")
			QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
		Else 
			REDUCE SELECTION:C351([ACTIONS:13]; 0)
		End if 
		If ([DIARY:12]Result_Code:11#"")
			QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=[DIARY:12]Result_Code:11)
		Else 
			REDUCE SELECTION:C351([RESULTS:14]; 0)
		End if 
		If ([DIARY:12]Person:8#"")
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[DIARY:12]Person:8)
		Else 
			REDUCE SELECTION:C351([PERSONNEL:11]; 0)
		End if 
		
		If ([DIARY:12]Order_Code:26#"")
			QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[DIARY:12]Order_Code:26)
			RELATE ONE:C42([ORDERS:24]Source:18)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
			Orders_PPQtnIte
		Else 
			REDUCE SELECTION:C351([ORDERS:24]; 0)
			REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
			
		End if 
		If ([DIARY:12]Job_Code:19#"")
			QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[DIARY:12]Job_Code:19)
		Else 
			REDUCE SELECTION:C351([JOBS:26]; 0)
		End if 
		
		If ([DIARY:12]Stage_Code:21#"")
			QUERY:C277([STAGES:45]; [STAGES:45]Stage_Code:1=[DIARY:12]Stage_Code:21)
		Else 
			REDUCE SELECTION:C351([STAGES:45]; 0)
		End if 
		
		If ([DIARY:12]Call_Code:25#"")
			QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=[DIARY:12]Call_Code:25)
		Else 
			REDUCE SELECTION:C351([SERVICE_CALLS:20]; 0)
		End if 
		
		Letter_RepCallP
		
	: (rContr=1)
		If ([CONTRACTS:17]Contract_Code:3#"")
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Contract_Code:29=[CONTRACTS:17]Contract_Code:3)
			vItems:=""
			FIRST RECORD:C50([ORDER_ITEMS:25])
			While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
				If ([ORDER_ITEMS:25]Product_Name:13#"")
					vItems:=vItems+[ORDER_ITEMS:25]Product_Name:13+Char:C90(9)+[ORDER_ITEMS:25]Serial_Number:24+Char:C90(13)
				End if 
				NEXT RECORD:C51([ORDER_ITEMS:25])
			End while 
		End if 
		
	: (rOrd=1)
		If ([ORDERS:24]Order_Code:3#"")
			RELATE ONE:C42([ORDERS:24]Source:18)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
			Orders_PPQtnIte
		End if 
		
	: (rState=2)
		RELATE ONE:C42([INVOICES:39]Period_Code:13)
		RELATE ONE:C42([INVOICES:39]Analysis_Code:17)
		RELATE ONE:C42([INVOICES:39]Credit_Stage:22)
		
		
End case 
vName:=[CONTACTS:1]Forename:4+" "+[CONTACTS:1]Surname:5
If (vText#"")
	vText:=Replace(vText)
End if 
If (Count parameters:C259=0)
	Diary_InLLPQtnR
End if 
ERR_MethodTrackerReturn("Letter Replace"; $_t_oldMethodName)
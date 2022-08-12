//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_LayCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2009 08:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283(rComp; rCont; rContr; rDiary; rOrd; rState)
	C_TEXT:C284($_t_oldMethodName; vLayCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_LayCode")
Case of 
	: (rComp=1)
		If (vLayCode#[COMPANIES:2]Company_Code:1)
			vLayCode:=[COMPANIES:2]Company_Code:1
			$0:=True:C214
		Else 
			$0:=False:C215
		End if 
	: (rCont=1)
		If (vLayCode#[CONTACTS:1]Contact_Code:2)
			vLayCode:=[CONTACTS:1]Contact_Code:2
			$0:=True:C214
		Else 
			$0:=False:C215
		End if 
	: (rContr=1)
		If (vLayCode#[CONTRACTS:17]Contract_Code:3)
			vLayCode:=[CONTRACTS:17]Contract_Code:3
			$0:=True:C214
		Else 
			$0:=False:C215
		End if 
	: (rOrd>0)
		If (vLayCode#[ORDERS:24]Order_Code:3)
			vLayCode:=[ORDERS:24]Order_Code:3
			$0:=True:C214
		Else 
			$0:=False:C215
		End if 
	: (rState=1)
		If (vLayCode#[INVOICES:39]Invoice_Number:1)
			vLayCode:=[INVOICES:39]Invoice_Number:1
			$0:=True:C214
		Else 
			$0:=False:C215
		End if 
		
	: (rDiary=1)
		If (vLayCode#[DIARY:12]Diary_Code:3)
			vLayCode:=[DIARY:12]Diary_Code:3
			$0:=True:C214
		Else 
			$0:=False:C215
		End if 
	Else 
		$0:=True:C214
End case 
ERR_MethodTrackerReturn("Letters_LayCode"; $_t_oldMethodName)
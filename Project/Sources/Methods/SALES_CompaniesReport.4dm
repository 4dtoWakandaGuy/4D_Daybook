//%attributes = {}
If (False:C215)
	//Project Method Name:      SALES_CompaniesReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(Sales_bo_OnScreenMessage)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(Sales_ti_Doc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SALES_CompaniesReport")
//method SALES_COmpaniesReport
//this method will print out for the current selection of companies
//a report of the year on year sales
Sales_bo_OnScreenMessage:=False:C215
If (Records in selection:C76([COMPANIES:2])>0)
	If (Records in selection:C76([COMPANIES:2])>100)
		Sales_bo_OnScreenMessage:=True:C214
	End if 
	
	Sales_ti_Doc:=DB_CreateDocument(""; "TEXT")
	If (Sales_ti_Doc#?00:00:00?)
		If (Sales_bo_OnScreenMessage)
			Open window:C153(40; 100; 300; 200; -1984)
		End if 
		
		FIRST RECORD:C50([COMPANIES:2])
		For ($_l_Index; 1; Records in selection:C76([COMPANIES:2]))
			If (Sales_bo_OnScreenMessage)
				ERASE WINDOW:C160
				
				MESSAGE:C88("Checking "+[COMPANIES:2]Company_Name:2+" Record "+String:C10($_l_Index)+" of "+String:C10(Records in selection:C76([COMPANIES:2])))
			End if 
			
			
			CALL_SalesYearonYEar([COMPANIES:2]Company_Code:1; 4; Sales_ti_Doc)
			NEXT RECORD:C51([COMPANIES:2])
		End for 
		CLOSE DOCUMENT:C267(Sales_ti_Doc)
		If (Sales_bo_OnScreenMessage)
			CLOSE WINDOW:C154
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("SALES_CompaniesReport"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      Company_Sales_Products
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
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Index; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Company_Sales_Products")
//this method calls another as a process
//method SALES_COmpaniesReport
//this method will print out for the current selection of companies
//a report of the year on year sales
Sales_bo_OnScreenMessage:=False:C215
If (Records in selection:C76([COMPANIES:2])>0)
	If (Records in selection:C76([COMPANIES:2])>100)
		Sales_bo_OnScreenMessage:=True:C214
	End if 
	
	$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT")
	If ($_ti_DocumentRef#?00:00:00?)
		If (Sales_bo_OnScreenMessage)
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153(40; 100; 300; 200; -1984)
		End if 
		
		FIRST RECORD:C50([COMPANIES:2])
		For ($_l_Index; 1; Records in selection:C76([COMPANIES:2]))
			If (Sales_bo_OnScreenMessage)
				ERASE WINDOW:C160
				
				MESSAGE:C88("Checking "+[COMPANIES:2]Company_Name:2+" Record "+String:C10($_l_Index)+" of "+String:C10(Records in selection:C76([COMPANIES:2])))
			End if 
			
			
			//CALL_SalesProductsYearonYEar ([COMPANIES]Company Code;4;$_ti_DocumentRef)
			NEXT RECORD:C51([COMPANIES:2])
		End for 
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		If (Sales_bo_OnScreenMessage)
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("Company_Sales_Products"; $_t_oldMethodName)
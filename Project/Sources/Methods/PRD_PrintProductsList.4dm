//%attributes = {}
If (False:C215)
	//Project Method Name:      PRD_PrintProductsList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/11/2010 13:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; vNo2)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; DB_t_CurrentFormUsage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRD_PrintProductsList")
CREATE SET:C116([PRODUCTS:9]; "$Temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (OK=1) & (Records in selection:C76([PRODUCTS:9])>0)
	If (vNo2#Records in selection:C76([PRODUCTS:9]))
		
		ORDER BY:C49([PRODUCTS:9]Group_Code:3; >; [PRODUCTS:9]Brand_Code:4; >; [PRODUCTS:9]Model_Code:5; >)
	End if 
	If (Not:C34(SR_ReportOK("ProdList")))
		Gen_Confirm("Print Supplier details?"; "Yes"; "No")
		If (OK=1)
			DB_t_CurrentFormUsage:="Sup"
		End if 
		
		BREAK LEVEL:C302(2)
		ACCUMULATE:C303([PRODUCTS:9]Sales_Price:9)
		FORM SET OUTPUT:C54([PRODUCTS:9]; "Product_List")
		PRINT SELECTION:C60([PRODUCTS:9])
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("PRD_PrintProductsList"; $_t_oldMethodName)
//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoice TransCo
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_CompanyCode; $_t_oldMethodName; $_t_ParentCompanyCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoice TransCo")
If (([COMPANIES:2]Invoice_Superior:57) & ([COMPANIES:2]Superior:34#""))
	
	If ([INVOICES:39]Delivery_Company:30="")
		[INVOICES:39]Delivery_Company:30:=[INVOICES:39]Company_Code:2
		[INVOICES:39]Delivery_Contact:31:=[INVOICES:39]Contact_Code:3
	End if 
	$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
	$_t_ParentCompanyCode:=[COMPANIES:2]Superior:34
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_ParentCompanyCode; *)
	QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Deleted:61=0)
	
	If ([COMPANIES:2]Company_Code:1#"")  //The superior exists and is not 'deleted'
		If ([COMPANIES:2]Superior:34#[COMPANIES:2]Company_Code:1)  // the superior is not the child!
			[INVOICES:39]Company_Code:2:=[COMPANIES:2]Company_Code:1
			[INVOICES:39]Contact_Code:3:=""
			RELATE ONE:C42([INVOICES:39]Company_Code:2)
			$0:=Invoice TransCo
		Else 
			$0:=True:C214
		End if 
	Else 
		
		Gen_Confirm("Company "+$_t_ParentCompanyCode+" Does not exist. Do you wish to invoice "+$_t_CompanyCode+" instead?"; "Yes"; "No")
		
		If (OK=1)
			
			[INVOICES:39]Company_Code:2:=$_t_CompanyCode
			$0:=True:C214
		Else 
			$0:=False:C215
		End if 
		OK:=1
	End if 
	
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
Else 
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("Invoice TransCo"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Company_docPrintPrefGet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 11:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_emailBookings; $_bo_EmailInvoices; $_bo_EmailPurchOrders; $_bo_EmailSalesOrders; $_bo_EmailStatements; $0)
	C_LONGINT:C283($_l_Offset)
	C_POINTER:C301($_ptr_ValueVariable; $3)
	C_TEXT:C284($_t_AccPayableEmail; $_t_AccReceivableEmail; $_t_oldMethodName; $1; $2; DOC_t_PrintOption; DOC_t_ReportName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Company_docPrintPrefGet")

DOC_t_ReportName:=$1
DOC_t_PrintOption:=$2
//
If (Count parameters:C259>2)
	$_ptr_ValueVariable:=$3
Else 
	$_ptr_ValueVariable:=$_ptr_ValueVariable
End if 

$_bo_EmailStatements:=False:C215
$_bo_EmailInvoices:=False:C215
$_bo_emailBookings:=False:C215
$_bo_EmailSalesOrders:=False:C215
$_bo_EmailPurchOrders:=False:C215
$_l_Offset:=0
If (BLOB size:C605([COMPANIES:2]Document_Print_Preferences:69)>0)
	BLOB TO VARIABLE:C533([COMPANIES:2]Document_Print_Preferences:69; $_bo_EmailStatements; $_l_Offset)
	If ($_l_Offset<BLOB size:C605([COMPANIES:2]Document_Print_Preferences:69))
		BLOB TO VARIABLE:C533([COMPANIES:2]Document_Print_Preferences:69; $_bo_EmailInvoices; $_l_Offset)
		If ($_l_Offset<BLOB size:C605([COMPANIES:2]Document_Print_Preferences:69))
			BLOB TO VARIABLE:C533([COMPANIES:2]Document_Print_Preferences:69; $_bo_emailBookings; $_l_Offset)
			If ($_l_Offset<BLOB size:C605([COMPANIES:2]Document_Print_Preferences:69))
				BLOB TO VARIABLE:C533([COMPANIES:2]Document_Print_Preferences:69; $_bo_EmailSalesOrders; $_l_Offset)
				If ($_l_Offset<BLOB size:C605([COMPANIES:2]Document_Print_Preferences:69))
					BLOB TO VARIABLE:C533([COMPANIES:2]Document_Print_Preferences:69; $_bo_EmailPurchOrders; $_l_Offset)
					If ($_l_Offset<BLOB size:C605([COMPANIES:2]Document_Print_Preferences:69))  //bwalia added 20061011
						BLOB TO VARIABLE:C533([COMPANIES:2]Document_Print_Preferences:69; $_t_AccPayableEmail; $_l_Offset)
						If ($_l_Offset<BLOB size:C605([COMPANIES:2]Document_Print_Preferences:69))  //bwalia added 20061011
							BLOB TO VARIABLE:C533([COMPANIES:2]Document_Print_Preferences:69; $_t_AccReceivableEmail; $_l_Offset)
						Else 
							
						End if 
					Else 
						
					End if 
				Else 
					
				End if 
				
			Else 
				
			End if 
		Else 
			
		End if 
	Else 
		
	End if 
Else 
	
End if 


Case of 
	: ((DOC_t_ReportName="statements") & (DOC_t_PrintOption="email"))
		$0:=$_bo_EmailStatements
		
	: ((DOC_t_ReportName="invoices") & (DOC_t_PrintOption="email"))
		$0:=$_bo_EmailInvoices
		
		
	: (((DOC_t_ReportName="Sales Orders") | (DOC_t_ReportName="Orders")) & (DOC_t_PrintOption="email"))
		$0:=$_bo_EmailSalesOrders
		
	: ((DOC_t_ReportName="Purchase Orders") & (DOC_t_PrintOption="email"))
		$0:=$_bo_EmailPurchOrders
		
	: ((DOC_t_ReportName="AccPayableEmail") & (Not:C34(Is nil pointer:C315($_ptr_ValueVariable))) & (DOC_t_PrintOption="email"))
		$_ptr_ValueVariable->:=$_t_AccPayableEmail
		$0:=False:C215
		
	: ((DOC_t_ReportName="AccReceivableEmail") & (Not:C34(Is nil pointer:C315($_ptr_ValueVariable))) & (DOC_t_PrintOption="email"))
		$_ptr_ValueVariable->:=$_t_AccReceivableEmail
		$0:=False:C215
		
	Else 
		$0:=False:C215
End case 
ERR_MethodTrackerReturn("Company_docPrintPrefGet"; $_t_oldMethodName)
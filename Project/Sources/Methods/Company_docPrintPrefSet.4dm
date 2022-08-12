//%attributes = {}
If (False:C215)
	//Project Method Name:      Company_docPrintPrefSet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 20:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_emailBookings; $_bo_EmailInvoices; $_bo_EmailPurchOrders; $_bo_EmailSalesOrders; $_bo_EmailStatements; $_bo_Flag; $3)
	C_LONGINT:C283($_l_Offset)
	C_TEXT:C284($_t_AccPayableEmail; $_t_AccReceivableEmail; $_t_EmailAddress; $_t_oldMethodName; $1; $2; $4; DOC_t_PrintOption; DOC_t_ReportName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Company_docPrintPrefSet")


DOC_t_ReportName:=$1
DOC_t_PrintOption:=$2

If (Count parameters:C259>2)
	$_bo_Flag:=$3
Else 
	$_bo_Flag:=False:C215
End if 

If (Count parameters:C259>3)
	$_t_EmailAddress:=$4
Else 
	$_t_EmailAddress:=""
End if 

$_l_Offset:=0
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
		$_bo_EmailStatements:=$_bo_Flag
		
	: ((DOC_t_ReportName="invoices") & (DOC_t_PrintOption="email"))
		$_bo_EmailInvoices:=$_bo_Flag
		
	: ((DOC_t_ReportName="Sales Orders") & (DOC_t_PrintOption="email"))
		$_bo_EmailSalesOrders:=$_bo_Flag
		
	: ((DOC_t_ReportName="Purchase Orders") & (DOC_t_PrintOption="email"))
		$_bo_EmailPurchOrders:=$_bo_Flag
		
	: ((DOC_t_ReportName="AccPayableEmail") & ($_t_EmailAddress#"") & (DOC_t_PrintOption="email"))
		$_t_AccPayableEmail:=$_t_EmailAddress
		
	: ((DOC_t_ReportName="AccReceivableEmail") & ($_t_EmailAddress#"") & (DOC_t_PrintOption="email"))
		$_t_AccReceivableEmail:=$_t_EmailAddress
	Else 
End case 

$_l_Offset:=0

VARIABLE TO BLOB:C532($_bo_EmailStatements; [COMPANIES:2]Document_Print_Preferences:69; $_l_Offset)
VARIABLE TO BLOB:C532($_bo_EmailInvoices; [COMPANIES:2]Document_Print_Preferences:69; $_l_Offset)
VARIABLE TO BLOB:C532($_bo_emailBookings; [COMPANIES:2]Document_Print_Preferences:69; $_l_Offset)
VARIABLE TO BLOB:C532($_bo_EmailSalesOrders; [COMPANIES:2]Document_Print_Preferences:69; $_l_Offset)
VARIABLE TO BLOB:C532($_bo_EmailPurchOrders; [COMPANIES:2]Document_Print_Preferences:69; $_l_Offset)
VARIABLE TO BLOB:C532($_t_AccPayableEmail; [COMPANIES:2]Document_Print_Preferences:69; $_l_Offset)
VARIABLE TO BLOB:C532($_t_AccReceivableEmail; [COMPANIES:2]Document_Print_Preferences:69; $_l_Offset)
ERR_MethodTrackerReturn("Company_docPrintPrefSet"; $_t_oldMethodName)
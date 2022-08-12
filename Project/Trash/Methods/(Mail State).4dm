//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Mail State
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_InvoiceAccess)
	C_LONGINT:C283(rState; vIn; vP)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCompany; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail State")
//Mail Statements
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Start_ProcMail
$_bo_InvoiceAccess:=Invoices_File
If ($_bo_InvoiceAccess)
	READ ONLY:C145
	rState:=1
	vCompany:=""
	While (vIn=1)
		DB_t_CurrentFormUsage:="Statement"
		Invoices_Sel
		If (vIn=1)
			If (Records in selection:C76([INVOICES:39])>0)
				//vNo:=Records in selection([INVOICES])
				ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
				//DB_t_CurrentFormUsage:="Print"
				//Open_Pro_Window ("Mail Statements";0;1;->[INVOICES];WIN_t_CurrentOutputform)
				//FS_SetFormSort (WIN_t_CurrentOutputform)
				//WIn_SetFormSize (1;->[INVOICES];WIN_t_CurrentOutputform)
				//D`ISPLAY SELECTION([INVOICES];*)
				
				DBI_MenuSelectRecords(Table name:C256(Table:C252(->[INVOICES:39])); True:C214)
				
				If (OK=1)
					DB_t_CurrentFormUsage:="Statement"
					MAsk_Print(->[INVOICES:39])
					Mail_StateComp
					If (vP=1)
						MAsk_MS(->[INVOICES:39])
						If (OK=1)
							Mail_StateState
						End if 
					End if 
				End if 
				//Close_ProWin
				vIn:=0
			Else 
				Gen_None("Invoices"; ->vIn)
			End if 
		End if 
	End while 
End if 

Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Mail State"; $_t_oldMethodName)

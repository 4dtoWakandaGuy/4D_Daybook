//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_SOA
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
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(vIn; vNo)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_SOA")
//Invoices_SOA
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
If (Invoices_File)
	While (vIn>0)
		vIn:=1
		DB_t_CurrentFormUsage:="StatementOA"
		Invoices_SelP
		If (vIn=1)
			Invoices_StaChk
			If (vIn=1)
				If (Records in selection:C76([INVOICES:39])>0)
					
					vNo:=Records in selection:C76([INVOICES:39])
					DB_t_CurrentFormUsage:="Print"
					ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
					Open_Pro_Window("Statements - Of Acc"; 0; 1; ->[INVOICES:39]; WIN_t_CurrentOutputform)
					
					WIn_SetFormSize(1; ->[INVOICES:39]; WIN_t_CurrentOutputform)
					DISPLAY SELECTION:C59([INVOICES:39]; *)
					If (OK=1)
						Mail_StateComp
						FORM SET OUTPUT:C54([COMPANIES:2]; "StatementOA")
						PRINT SELECTION:C60([COMPANIES:2])
						FORM SET OUTPUT:C54([COMPANIES:2]; "Companies_Out")
						If (OK=1)
							Gen_Confirm("Were the Statements printed OK?"; "Yes"; "No")
							If (OK=1)
								USE SET:C118("Master2")
								QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7=0)
								DB_lockFile(->[INVOICES:39])
								APPLY TO SELECTION:C70([INVOICES:39]; [INVOICES:39]Statement_Date:34:=<>DB_d_CurrentDate)
								
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[INVOICES:39]))
							End if 
						End if 
					End if 
					Close_ProWin
					vIn:=0
				Else 
					Gen_None("Invoices"; ->vIn)
				End if 
			End if 
		End if 
	End while 
End if 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Invoices_SOA"; $_t_oldMethodName)
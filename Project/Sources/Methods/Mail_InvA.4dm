//%attributes = {}
If (False:C215)
	//Project Method Name:      Mail_InvA
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
	C_DATE:C307(<>DB_d_CurrentDate; $_d_DateFrom; $_d_Dateto)
	C_LONGINT:C283(rState; vIn; vP)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; $_t_Search; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_InvA")
//Mail Invoices Auto
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Start_ProcMail
If (Invoices_File)
	rState:=2
	While (vIn=1)
		DB_t_CurrentFormUsage:="Statement"
		Gen_Confirm("Find all Invoices requiring Letters, or other selection?"; "Required"; "Other")
		If (OK=1)
			CREATE EMPTY SET:C140([INVOICES:39]; "Master")
			ALL RECORDS:C47([CREDIT_STAGES:54])
			FIRST RECORD:C50([CREDIT_STAGES:54])
			$_t_Search:=Substring:C12(Gen_Request("Invoice Stage to find:"; [CREDIT_STAGES:54]Stage_Code:1); 1; 51)
			If ((OK=1) & ($_t_Search#""))
				
				QUERY:C277([CREDIT_STAGES:54]; [CREDIT_STAGES:54]Stage_Code:1=$_t_Search)
				If (Records in selection:C76([CREDIT_STAGES:54])=1)
					If ([CREDIT_STAGES:54]Document_Code:5#"")
						//vLetterCode:=[CREDIT STAGES]Document Code
						QUERY:C277([INVOICES:39]; [INVOICES:39]Credit_Stage:22=[CREDIT_STAGES:54]Stage_Code:1; *)
						QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0; *)
						$_d_DateFrom:=!1980-01-01!
						$_d_Dateto:=<>DB_d_CurrentDate-[CREDIT_STAGES:54]Letter_Days:3
						If ([CREDIT_STAGES:54]From_Invoice_Date:4)
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Date:4<=$_d_Dateto)
						Else 
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Due_Date:18>!00-00-00!; *)
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Due_Date:18<=$_d_Dateto)
						End if 
						CREATE SET:C116([INVOICES:39]; "Extra")
						UNION:C120("Extra"; "Master"; "Master")
					Else 
						Gen_Alert("That Invoice Stage has no associated Document"; "Cancel")
					End if 
				Else 
					Gen_Alert("Please select a single valid Invoice Stage"; "Cancel")
				End if 
			End if 
			USE SET:C118("Master")
		Else 
			Invoices_Sel
		End if 
		If (vIn=1)
			If (Records in selection:C76([INVOICES:39])>0)
				//vNo:=Records in selection([INVOICES])
				//ORDER BY([INVOICES];[INVOICES]Company Code;>;[INVOICES]Invoice Date;>)
				//v`Layout:="Print"
				//Open_Pro_Window ("Mail Invoices Auto";0;1;->[INVOICES];WIN_t_CurrentOutputform)
				// FS_SetFormSort (WIN_t_CurrentOutputform)
				//WIn_SetFormSize (1;->[INVOICES];WIN_t_CurrentOutputform)
				//D`ISPLAY SELECTION([INVOICES];*)  `NG may 2004 added table
				
				DBI_MenuSelectRecords(Table name:C256(Table:C252(->[INVOICES:39])))
				If (OK=1)
					DB_t_CurrentFormUsage:="StatementA"
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
ERR_MethodTrackerReturn("Mail_InvA"; $_t_oldMethodName)

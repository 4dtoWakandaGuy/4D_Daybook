//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 13:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK; vPu)
	C_REAL:C285(v0; v31)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentOutputform; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vInvTitle; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases List")
//Purchases List
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Purchases_File
READ ONLY:C145([PURCHASE_INVOICES:37])
READ ONLY:C145([COMPANIES:2])
READ ONLY:C145([PRODUCTS:9])
While (vPu=1)
	Purchases_Sel
	If (vPu=1)
		If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
			//vNo:=Records in selection([PURCHASES])
			//DB_t_CurrentFormUsage:="Print"
			//ORDER BY([PURCHASES];[PURCHASES]Company Code;>)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			
			//Open_Pro_Window (Term_SLPLWT ("List Purchases");0;1;->[PURCHASES];WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[PURCHASES];WIN_t_CurrentOutputform)
			//D`ISPLAY SELECTION([PURCHASES];*)
			
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[PURCHASE_INVOICES:37])))
			If (OK=1)
				If (Not:C34(SR_ReportOK("PurchList")))
					//Gen_Confirm ("Please choose Print Settings of 95% Portrait")
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; "List Purchases")
					
					If ($_l_OK>=0)  // See in Print_Setsizeabout this
						vInvTitle:=Uppercase:C13(Term_SLPLWT("PURCHASE LEDGER LIST"))
						FORM SET OUTPUT:C54([PURCHASE_INVOICES:37]; "Purchases List")
						BREAK LEVEL:C302(1)
						ACCUMULATE:C303([PURCHASE_INVOICES:37]Total_Invoiced:7; [PURCHASE_INVOICES:37]Total_Due:9; v0; v31)
						PRINT SELECTION:C60([PURCHASE_INVOICES:37])
						PRT_SetPrinterPaperOptions("List Purchases")  //NG June 2005
					End if 
				End if 
			End if 
			//Close_ProWin
			vPu:=0
		Else 
			Gen_None(Term_SLPLWT("Purchase Ledger Items"); ->vPu)
		End if 
	End if 
End while 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Purchases List"; $_t_oldMethodName)
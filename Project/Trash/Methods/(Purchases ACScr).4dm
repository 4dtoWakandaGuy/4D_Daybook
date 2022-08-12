//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases_ACScr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 16:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_CompanyCodes2; 0)
	ARRAY TEXT:C222($_at_CompanyCodes3; 0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_Process; $_l_Progress; $i; $j; $sets; $unit; vC; vIn; vNo; xNext)
	C_REAL:C285(vT1)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitle; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_ACScr")
//Invoices_ADSrc

Start_Process(Term_SLPLWT("Creditors Screen Report"))
Gen_Confirm3(Term_SLPLWT("Do you want to find all Purchase Ledger Due figures, "+"or to search the Purchase Ledger yourself, ")+"or to search Companies?"; Term_SLPLWT("PL Due"); "Comp. Search"; Term_SLPLWT("PL Search"))
If (OK=1) | (xNext=1)
	Purchases_File
	READ ONLY:C145([PURCHASE_INVOICES:37])
	READ ONLY:C145([COMPANIES:2])
	DB_t_CurrentFormUsage:="Pay"
	If (xNext=1)
		Purchases_Sel
		If (vIn=1)
			If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
				vNo:=Records in selection:C76([PURCHASE_INVOICES:37])
				
				CREATE SET:C116([PURCHASE_INVOICES:37]; "IMaster")
				DB_t_CurrentFormUsage:="Print"
				Open_Pro_Window(Term_SLPLWT("Creditors Screen Report"); 0; 1; ->[PURCHASE_INVOICES:37]; WIN_t_CurrentOutputform)
				//If (Records in selection([PURCHASES])>10)
				FS_SetFormSort(WIN_t_CurrentOutputform)
				WIn_SetFormSize(1; ->[PURCHASE_INVOICES:37]; WIN_t_CurrentOutputform)
				DISPLAY SELECTION:C59([PURCHASE_INVOICES:37]; *)
				//End if
				If (OK=1)
					Userset
					Join_SelDV(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Company_Code:2; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1)
				End if 
			Else 
				Gen_Alert(Term_SLPLWT("No Purchase Ledger Items found"))
				OK:=0
			End if 
		Else 
			OK:=0
		End if 
	Else 
		QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Total_Due:9#0; *)
		QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Invoice_Date:5<=<>DB_d_CurrentDate)
		QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=1; *)
		QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=2; *)
		QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=3; *)
		QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=-2)
		//SEARCH([Purchases];[Purchases]Total Due#0)
		If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
			Open_Pro_Window(Term_SLPLWT("Creditors Screen Report"))
			Join_SelDV(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Company_Code:2; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1)
			
		Else 
			Gen_Alert(Term_SLPLWT("No Purchase Ledger Items found"))
			OK:=0
		End if 
	End if 
Else 
	Companies_File
	READ ONLY:C145([PURCHASE_INVOICES:37])
	READ ONLY:C145([COMPANIES:2])
	Comp_Sel
	If (vC=1)
		vNo:=Records in selection:C76([COMPANIES:2])
		If (vNo>0)
			If (vNo>10)
				vT1:=Num:C11(Gen_Request("Find Companies with a Total Due >=:"; "0"; "Find"; "All"))
				If (OK=1)
					
					//If (vT1=0)
					//vT1:=0.01
					//End if
					$_l_Progress:=Progress2_Start("Searching ...")
					If ($_l_Progress>0)
						$_l_Process:=$_l_Progress
					Else 
						$_l_Process:=Current process:C322
					End if 
					ARRAY TEXT:C222($_at_CompanyCodes; 0)
					SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
					
					$unit:=Int:C8(vNo/10)
					$j:=0
					$i:=1
					$sets:=0
					ARRAY TEXT:C222($_at_CompanyCodes2; 0)
					QUERY WITH ARRAY:C644([PURCHASE_INVOICES:37]Company_Code:2; $_at_CompanyCodes)
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Total_Due:9#0)
					SELECTION TO ARRAY:C260([PURCHASE_INVOICES:37]Company_Code:2; $_at_CompanyCodes3)
					CREATE SET:C116([PURCHASE_INVOICES:37]; "$WithDueAmounts")
					//While (($i<=vNo) & (<>SYS_l_CancelProcess#$_l_Process))
					For ($i; 1; Size of array:C274($_at_CompanyCodes3))
						USE SET:C118("$WithDueAmounts")
						QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2=$_at_CompanyCodes3{$i})
						//QUERY([PURCHASES]; & ;[PURCHASES]Total Due#0)
						If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
							If (Sum:C1([PURCHASE_INVOICES:37]Total_Due:9)>=vT1)
								If ([PURCHASE_INVOICES:37]Company_Code:2#"")
									APPEND TO ARRAY:C911($_at_CompanyCodes2; [PURCHASE_INVOICES:37]Company_Code:2)
								End if 
								
								
							End if 
						End if 
						
					End for 
					If (Size of array:C274($_at_CompanyCodes2)>0)
						QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_CompanyCodes2)
					Else 
						REDUCE SELECTION:C351([COMPANIES:2]; 0)
					End if 
				End if 
				If (Records in selection:C76([COMPANIES:2])>0)
					vNo:=Records in selection:C76([COMPANIES:2])
					CREATE SET:C116([COMPANIES:2]; "CMaster")
					DB_t_CurrentFormUsage:="Print"
					Open_Pro_Window(Term_SLPLWT("Creditors Screen Report"); 0; 1; ->[COMPANIES:2]; "Companies Out")
					If (Records in selection:C76([COMPANIES:2])>10)
						DISPLAY SELECTION:C59([COMPANIES:2]; *)
					End if 
					If (OK=1)
						Userset
						Purchases_File
						// Project_SelFast (»[COMPANIES];»[COMPANIES]Company Code
						//;»[Purchases];»[Purchases]Company Code)
					End if 
				Else 
					Gen_Alert("No Companies found")
					OK:=0
				End if 
			Else 
				Gen_Alert("No Companies found")
				OK:=0
			End if 
		Else 
			OK:=0
		End if 
		xNext:=0
	End if 
End if 
If (OK=1)
	vTitle:=Uppercase:C13(Term_SLPLWT("CREDITORS SCREEN REPORT"))
	DIALOG:C40([INVOICES:39]; "dScreenReport")
End if 
Close_ProWin
Process_End
ERR_MethodTrackerReturn("Purchases_ACScr"; $_t_oldMethodName)

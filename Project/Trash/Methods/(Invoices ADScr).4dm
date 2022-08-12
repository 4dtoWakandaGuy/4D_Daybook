//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_ADScr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_ValidCompanyCodes; 0)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_CurrentRow; $_l_Process; $_l_Progress; vC; vIn; vNo; xNext)
	C_REAL:C285(vT1)
	C_TEXT:C284($_t_CurrentInputForm; $_t_CurrentOutputForm; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitle; WIN_t_CurrentInputForm; WIN_t_CurrentOutputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_ADScr")
//Invoices_ADSrc
$_t_CurrentOutputForm:=WIN_t_CurrentOutputform

Start_Process(Term_SLPLWT("Debtors Screen Report"))
Gen_Confirm3(Term_SLPLWT("Do you want to find all Sales Ledger Due figures, "+"or to search the Sales Ledger yourself, ")+"or to search Companies?"; Term_SLPLWT("SL Due"); "Comp. Search"; Term_SLPLWT("SL Search"))
If (OK=1) | (xNext=1)
	If (Invoices_File)
		READ ONLY:C145([INVOICES:39])
		READ ONLY:C145([COMPANIES:2])
		DB_t_CurrentFormUsage:="Pay"
		If (xNext=1)
			Invoices_Sel
			If (vIn=1)
				If (Records in selection:C76([INVOICES:39])>0)
					vNo:=Records in selection:C76([INVOICES:39])
					CREATE SET:C116([INVOICES:39]; "IMaster")
					DB_t_CurrentFormUsage:="Print"
					Open_Pro_Window(Term_SLPLWT("Debtors Screen Report"); 0; 1; ->[INVOICES:39]; WIN_t_CurrentOutputform)
					//If (Records in selection([INVOICES])>10)
					FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252(->[INVOICES:39]))
					WIn_SetFormSize(1; ->[INVOICES:39]; WIN_t_CurrentOutputform)
					DISPLAY SELECTION:C59([INVOICES:39]; *)  //NG May 2004 added table
					//End if
					If (OK=1)
						Userset
						Join_SelDV(->[INVOICES:39]; ->[INVOICES:39]Company_Code:2; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1)
					End if 
				Else 
					Gen_Alert(Term_SLPLWT("No Sales Ledger Items found"))
					OK:=0
				End if 
			Else 
				OK:=0
			End if 
		Else 
			//SEARCH([INVOICES];[INVOICES]Total Due#0;*)
			// SEARCH([INVOICES]; & ;[INVOICES]Invoice Date<=◊CDate)
			// SEARCH SELECTION([INVOICES];[INVOICES]State=1;*)
			//SEARCH SELECTION([INVOICES]; | ;[INVOICES]State=2;*)
			//SEARCH SELECTION([INVOICES]; | ;[INVOICES]State=3;*)
			//SEARCH SELECTION([INVOICES]; | ;[INVOICES]State=-2)
			QUERY:C277([INVOICES:39]; [INVOICES:39]Total_Due:7#0)
			If (Records in selection:C76([INVOICES:39])>0)
				Open_Pro_Window(Term_SLPLWT("Debtors Screen Report"))
				Join_SelDV(->[INVOICES:39]; ->[INVOICES:39]Company_Code:2; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1)
				//JOIN([INVOICES];[COMPANIES])
			Else 
				Gen_Alert(Term_SLPLWT("No Sales Ledger Items found"))
				OK:=0
			End if 
		End if 
	End if 
Else 
	If (Companies_File)
		READ ONLY:C145([INVOICES:39])
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
						
						
						
						$_l_CurrentRow:=1
						QUERY WITH ARRAY:C644([INVOICES:39]Company_Code:2; $_at_CompanyCodes)
						CREATE SET:C116([INVOICES:39]; "$ForCompanies")
						ARRAY TEXT:C222($_at_ValidCompanyCodes; 0)
						While (($_l_CurrentRow<=vNo) & (<>SYS_l_CancelProcess#$_l_Process))
							QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=$_at_CompanyCodes{$_l_CurrentRow}; *)
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0)
							//If (Records in selection([INVOICES])>10)
							//SEARCH SELECTION([INVOICES];[INVOICES]Total Due#0)
							//End if
							If (Records in selection:C76([INVOICES:39])>0)
								If (Sum:C1([INVOICES:39]Total_Due:7)>=vT1)
									APPEND TO ARRAY:C911($_at_ValidCompanyCodes; $_at_CompanyCodes{$_l_CurrentRow})
								End if 
							End if 
							
							$_l_CurrentRow:=$_l_CurrentRow+1
						End while 
						ARRAY TEXT:C222($_at_CompanyCodes; 0)
						If (Size of array:C274($_at_ValidCompanyCodes)>0)
							QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_ValidCompanyCodes)
							
						Else 
							REDUCE SELECTION:C351([COMPANIES:2]; 0)
						End if 
						
						Progress2_Call($_l_Progress; "")
						
					End if 
				End if 
				If (Records in selection:C76([COMPANIES:2])>0)
					vNo:=Records in selection:C76([COMPANIES:2])
					CREATE SET:C116([COMPANIES:2]; "CMaster")
					DB_t_CurrentFormUsage:="Print"
					Open_Pro_Window("Debtors Screen Report")
					If (Records in selection:C76([COMPANIES:2])>10)
						FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252(->[COMPANIES:2]))
						WIn_SetFormSize(1; ->[COMPANIES:2]; WIN_t_CurrentOutputform)
						DISPLAY SELECTION:C59([COMPANIES:2]; *)
					End if 
					If (OK=1)
						Userset
						Invoices_File
						// Project_SelFast (»[COMPANIES];»[COMPANIES]Company Code
						//;»[INVOICES];»[INVOICES]Company Code)
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
	
	$_t_CurrentInputForm:=WIN_t_CurrentInputForm
	$_t_CurrentOutputForm:=WIN_t_CurrentOutputForm
	vTitle:=Uppercase:C13(Term_SLPLWT("DEBTORS SCREEN REPORT"))
	WIN_t_CurrentInputForm:="dScreenReport"
	WIN_t_CurrentOutputForm:="dScreenReport"
	DIALOG:C40([INVOICES:39]; "dScreenReport")
	WIN_t_CurrentInputForm:=$_t_CurrentInputForm
	WIN_t_CurrentOutputForm:=$_t_CurrentOutputForm
End if 
Close_ProWin
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputForm
ERR_MethodTrackerReturn("Invoices_ADScr"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Startup_PLOB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 15:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(a01Stri2)
	//ARRAY DATE(LB_ad_01_1;0)
	//ARRAY REAL(LB_ar_01_1;0)
	//ARRAY REAL(LB_ar_01_2;0)
	//ARRAY TEXT(LB_at_01_1;0)
	//ARRAY TEXT(LB_at_01_2;0)
	//ARRAY TEXT(LB_at_01_3;0)
	C_BOOLEAN:C305($0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>SYS_l_DateFormatPreference; $_l_Index; $_l_Progress; $_l_SizeOfArray; xNext)
	C_REAL:C285(vT1; vTot2)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; vCompName; vPeriod; vTitle)
	C_TIME:C306(<>CTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Startup_PLOB")
//Startup_PLOB - Purch Led Opening Balances

If (<>DB_d_CurrentDate=!00-00-00!)
	
	<>DB_d_CurrentDate:=Current date:C33
	<>CTime:=Current time:C178
	<>SYS_l_DateFormatPreference:=Date_Format(<>DB_d_CurrentDate)
End if 
vTitle:="Purchase Ledger Opening Balances"
Open_Pro_Window("New Data Setups"; 0; 3; ->[COMPANIES:2]; "dOpening_Bal")
DIALOG:C40([COMPANIES:2]; "dOpening_Bal")
Close_ProWin

If ((OK=1) & (vPeriod#""))
	$0:=True:C214
	If (xNext=1)
		Startup_Page2Ex
		If ([USER:15]Opening Balance:49="")
			[USER:15]Opening Balance:49:=" 1"
		Else 
			[USER:15]Opening Balance:49:=Substring:C12([USER:15]Opening Balance:49; 1; 1)+"1"+Substring:C12([USER:15]Opening Balance:49; 3; 1)
		End if 
		DB_SaveRecord(->[USER:15])
	Else 
		$_l_SizeOfArray:=Size of array:C274(LB_at_01_1)
		If ($_l_SizeOfArray>0)
			QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURpost)
			If (Records in selection:C76([TRANSACTION_TYPES:31])=1)
				//  START TRANSACTION
				StartTransaction  // 13/05/02 pb
				
				READ WRITE:C146([PURCHASE_INVOICES:37])
				READ WRITE:C146([COMPANIES:2])
				$_l_Progress:=Progress2_Start("PL Opening Balances ...")
				
				For ($_l_Index; 1; $_l_SizeOfArray)
					If ((LB_ar_01_1{$_l_Index}#0) & (LB_at_01_1{$_l_Index}#""))
						
						If (LB_at_01_3{$_l_Index}#"")
							QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Invoice_Number:4=LB_at_01_3{$_l_Index})
							If (Records in selection:C76([PURCHASE_INVOICES:37])=0)
								CREATE RECORD:C68([PURCHASE_INVOICES:37])
								[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4:=LB_at_01_3{$_l_Index}
								Purch_Code
							End if 
						Else 
							CREATE RECORD:C68([PURCHASE_INVOICES:37])
							Purch_Code
							[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4:=[PURCHASE_INVOICES:37]Purchase_Code:1
						End if 
						
						If (a01Stri2{$_l_Index}="")
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=LB_at_01_1{$_l_Index})
						Else 
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=LB_at_01_1{$_l_Index}; *)
							QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Telephone:9=LB_at_01_2{$_l_Index})
						End if 
						If (Records in selection:C76([COMPANIES:2])=0)
							CREATE RECORD:C68([COMPANIES:2])
							vCompName:=LB_at_01_1{$_l_Index}
							Company_No
							[COMPANIES:2]Status:12:="S"
							[COMPANIES:2]Company_Name:2:=LB_at_01_1{$_l_Index}
							[COMPANIES:2]Telephone:9:=LB_at_01_2{$_l_Index}
							DB_SaveRecord(->[COMPANIES:2])
							AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
						End if 
						
						[PURCHASE_INVOICES:37]Company_Code:2:=[COMPANIES:2]Company_Code:1
						If (LB_ad_01_1{$_l_Index}=!00-00-00!)
							[PURCHASE_INVOICES:37]Invoice_Date:5:=<>DB_d_CurrentDate
						Else 
							[PURCHASE_INVOICES:37]Invoice_Date:5:=LB_ad_01_1{$_l_Index}
						End if 
						[PURCHASE_INVOICES:37]Total_Invoiced:7:=LB_ar_01_1{$_l_Index}
						[PURCHASE_INVOICES:37]Total_Due:9:=LB_ar_01_2{$_l_Index}
						[PURCHASE_INVOICES:37]Posted_Date:12:=[PURCHASE_INVOICES:37]Invoice_Date:5
						[PURCHASE_INVOICES:37]State:24:=3
						[PURCHASE_INVOICES:37]Terms:31:=DB_GetLedgerDefaultTerms("Purchase")
						[PURCHASE_INVOICES:37]Period_Code:3:=vPeriod
						[PURCHASE_INVOICES:37]Creditors_Account:13:=[TRANSACTION_TYPES:31]Credit_Account:5
						[PURCHASE_INVOICES:37]Currency_Code:23:=<>SYS_t_BaseCurrency
						[PURCHASE_INVOICES:37]Layer_Code:28:=DB_GetLedgerActualLayer
						DB_SaveRecord(->[PURCHASE_INVOICES:37])
						
					End if 
					
					Progress2_Call($_l_Progress; "PL Opening Balances ..."; $_l_Index; $_l_SizeOfArray)
				End for 
				UNLOAD RECORD:C212([PURCHASE_INVOICES:37])
				UNLOAD RECORD:C212([COMPANIES:2])
				READ ONLY:C145([PURCHASE_INVOICES:37])
				READ ONLY:C145([COMPANIES:2])
				Transact_End
				Progress2_Call($_l_Progress; "")
			End if 
		End if 
		
		If ([USER:15]Opening Balance:49#"")
			[USER:15]Opening Balance:49:=Substring:C12([USER:15]Opening Balance:49; 1; 1)+" "+Substring:C12([USER:15]Opening Balance:49; 3; 1)
			If (([USER:15]Opening Balance:49="   ") | ([USER:15]Opening Balance:49="  ") | ([USER:15]Opening Balance:49=" "))
				[USER:15]Opening Balance:49:=""
			End if 
			DB_SaveRecord(->[USER:15])
		End if 
		
	End if 
	vTot2:=vT1  //used in GLOB to put figure in Trade Creditors
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("Startup_PLOB"; $_t_oldMethodName)

//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Startup SLOB
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
	//C_UNKNOWN(a01Stri1)
	//ARRAY DATE(LB_ad_01_1;0)
	//ARRAY REAL(LB_ar_01_1;0)
	//ARRAY TEXT(LB_at_01_1;0)
	//ARRAY TEXT(LB_at_01_2;0)
	//ARRAY TEXT(LB_at_01_3;0)
	C_BOOLEAN:C305($0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>SYS_l_DateFormatPreference; $_l_Index; $_l_Progress; $_l_SizeOfArray; xNext)
	C_REAL:C285(vT1; vTot)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; vCompName; vPeriod; vTitle)
	C_TIME:C306(<>CTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Startup SLOB")
//Startup SLOB - Sales Ledger Opening Balances
If (<>DB_d_CurrentDate=!00-00-00!)
	
	<>DB_d_CurrentDate:=Current date:C33
	<>CTime:=Current time:C178
	<>SYS_l_DateFormatPreference:=Date_Format(<>DB_d_CurrentDate)
End if 
vTitle:="Sales Ledger Opening Balances"
Open_Pro_Window("New Data Setups"; 0; 3; ->[COMPANIES:2]; "dOpening Bal")
DIALOG:C40([COMPANIES:2]; "dOpening Bal")
Close_ProWin

If ((OK=1) & (vPeriod#""))
	$0:=True:C214
	If (xNext=1)
		Startup_Page2Ex
		[USER:15]Opening Balance:49:="1"+Substring:C12([USER:15]Opening Balance:49; 2; 2)
		DB_SaveRecord(->[USER:15])
	Else 
		$_l_SizeOfArray:=Size of array:C274(a01Stri1)
		If ($_l_SizeOfArray>0)
			QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
			If (Records in selection:C76([TRANSACTION_TYPES:31])=1)
				//  START TRANSACTION
				StartTransaction  // 13/05/02 pb
				
				READ WRITE:C146([INVOICES:39])
				READ WRITE:C146([COMPANIES:2])
				$_l_Progress:=Progress2_Start("SL Opening Balances ...")
				
				For ($_l_Index; 1; $_l_SizeOfArray)
					If ((LB_ar_01_1{$_l_Index}#0) & (LB_at_01_1{$_l_Index}#""))
						
						If (LB_at_01_3{$_l_Index}#"")
							QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=LB_at_01_3{$_l_Index})
							If (Records in selection:C76([INVOICES:39])=0)
								CREATE RECORD:C68([INVOICES:39])
								[INVOICES:39]Invoice_Number:1:=LB_at_01_2{$_l_Index}
							End if 
						Else 
							CREATE RECORD:C68([INVOICES:39])
							Inv_No
						End if 
						
						If (LB_at_01_2{$_l_Index}="")
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=LB_at_01_1{$_l_Index})
						Else 
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=LB_at_01_1{$_l_Index}; *)
							QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Telephone:9=LB_at_01_2{$_l_Index})
						End if 
						If (Records in selection:C76([COMPANIES:2])=0)
							CREATE RECORD:C68([COMPANIES:2])
							vCompName:=LB_at_01_1{$_l_Index}
							Company_No
							[COMPANIES:2]Status:12:="C"
							[COMPANIES:2]Company_Name:2:=LB_at_01_1{$_l_Index}
							[COMPANIES:2]Telephone:9:=LB_at_01_2{$_l_Index}
							DB_SaveRecord(->[COMPANIES:2])
							AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
						End if 
						
						[INVOICES:39]Company_Code:2:=[COMPANIES:2]Company_Code:1
						If (LB_ad_01_1{$_l_Index}=!00-00-00!)
							[INVOICES:39]Invoice_Date:4:=<>DB_d_CurrentDate
						Else 
							[INVOICES:39]Invoice_Date:4:=LB_ad_01_1{$_l_Index}
						End if 
						[INVOICES:39]Total_Invoiced:5:=LB_ar_01_1{$_l_Index}
						[INVOICES:39]Total_Due:7:=LB_ar_01_1{$_l_Index}
						[INVOICES:39]Posted_Date:8:=[INVOICES:39]Invoice_Date:4
						[INVOICES:39]State:10:=3
						[INVOICES:39]Terms:11:=DB_GetLedgerDefaultTerms
						[INVOICES:39]Period_Code:13:=vPeriod
						[INVOICES:39]Debtors_Account:15:=[TRANSACTION_TYPES:31]Debit_Account:4
						[INVOICES:39]Currency_Code:27:=<>SYS_t_BaseCurrency
						[INVOICES:39]Layer_Code:38:=DB_GetLedgerActualLayer
						DB_SaveRecord(->[INVOICES:39])
						
					End if 
					
					Progress2_Call($_l_Progress; "SL Opening Balances ..."; $_l_Index; $_l_SizeOfArray)
				End for 
				UNLOAD RECORD:C212([INVOICES:39])
				UNLOAD RECORD:C212([COMPANIES:2])
				READ ONLY:C145([INVOICES:39])
				READ ONLY:C145([COMPANIES:2])
				Transact_End
				Progress2_Call($_l_Progress; "")
			End if 
		End if 
		
		If ([USER:15]Opening Balance:49#"")
			[USER:15]Opening Balance:49:=" "+Substring:C12([USER:15]Opening Balance:49; 2; 2)
			If (([USER:15]Opening Balance:49="   ") | ([USER:15]Opening Balance:49="  ") | ([USER:15]Opening Balance:49=" "))
				[USER:15]Opening Balance:49:=""
			End if 
			DB_SaveRecord(->[USER:15])
		End if 
		
	End if 
	vTot:=vT1  //used in GLOB to put figure in Trade Debtors
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("Startup SLOB"; $_t_oldMethodName)

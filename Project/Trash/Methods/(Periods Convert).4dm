//%attributes = {}
If (False:C215)
	//Project Method Name:      Periods Convert
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:15
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305($_bo_Unload; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>PER_l_AccessLevel; <>SYS_l_CancelProcess; <>SYS_l_LoggedInaccount; $_l_ApplicationType; $_l_CountUsers; $_l_Process; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>YrPerF; <>YrPerT; $_t_oldMethodName; $Period)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Periods Convert")
//Periods Convert

If ((User in group:C338(Current user:C182; "Administrator")) | (<>PER_l_AccessLevel=0))
	$_l_ApplicationType:=Application type:C494
	If (Application type:C494=4D Remote mode:K5:5)
		
		$_l_CountUsers:=Count users:C342-1
	Else 
		$_l_CountUsers:=Count users:C342
	End if 
	
	If ($_l_CountUsers>1)
		Gen_Alert("This Function can only be used when you are the only Daybook user"; "Cancel")
	Else 
		Gen_Confirm("This Function should be used once only to convert Periods"+" in the format yy/mm to the format yyyy/mm."; "OK"; "Cancel")
		If (OK=1)
			Gen_Confirm("This Function may take MANY HOURS to run, and should preferably be done in "+"single-User_Mode on your fastest machine"; "Cancel"; "Continue")
			If (OK=0)
				COPY NAMED SELECTION:C331([PERIODS:33]; "$Sel")
				Userset
				Gen_Confirm("Are you sure you want to update "+String:C10(Records in selection:C76([PERIODS:33]))+" Periods?"; "No"; "Yes")
				If (OK=0)
					<>SYS_l_CancelProcess:=0
					$_l_Process:=Current process:C322
					ORDER BY:C49([PERIODS:33]; [PERIODS:33]Period_Code:1; >)
					Open_PrD_Window("Periods Conversion")
					MESSAGE:C88(Char:C90(13))
					FIRST RECORD:C50([PERIODS:33])
					$_bo_Unload:=(Records in selection:C76([USER:15])=0)
					While ((Not:C34(End selection:C36([PERIODS:33]))) & (<>SYS_l_CancelProcess#$_l_Process))
						MESSAGE:C88("   "+[PERIODS:33]Period_Code:1+" - ")
						$Period:=Periods_ConvCal([PERIODS:33]Period_Code:1)
						If ($Period#[PERIODS:33]Period_Code:1)
							MESSAGE:C88($Period+Char:C90(13))
							READ WRITE:C146([ORDERS:24])
							READ WRITE:C146([INVOICES:39])
							READ WRITE:C146([PURCHASE_INVOICES:37])
							READ WRITE:C146([TRANSACTIONS:29])
							READ WRITE:C146([TRANSACTION_BATCHES:30])
							READ WRITE:C146([USER:15])
							READ WRITE:C146([ACCOUNT_BALANCES:34])
							QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Period:42=[PERIODS:33]Period_Code:1)
							DB_lockFile(->[ORDERS:24])
							APPLY TO SELECTION:C70([ORDERS:24]; [ORDERS:24]Order_Period:42:=$Period)
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDERS:24]))
							QUERY:C277([INVOICES:39]; [INVOICES:39]Period_Code:13=[PERIODS:33]Period_Code:1)
							DB_lockFile(->[INVOICES:39])
							APPLY TO SELECTION:C70([INVOICES:39]; [INVOICES:39]Period_Code:13:=$Period)
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[INVOICES:39]))
							QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Period_Code:3=[PERIODS:33]Period_Code:1)
							DB_lockFile(->[PURCHASE_INVOICES:37])
							APPLY TO SELECTION:C70([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Period_Code:3:=$Period)
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[PURCHASE_INVOICES:37]))
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12=[PERIODS:33]Period_Code:1)
							DB_lockFile(->[TRANSACTIONS:29])
							APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12:=$Period)
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27=[PERIODS:33]Period_Code:1)
							DB_lockFile(->[TRANSACTIONS:29])
							APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Period:27:=$Period)
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
							QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=[PERIODS:33]Period_Code:1)
							DB_lockFile(->[ACCOUNT_BALANCES:34])
							APPLY TO SELECTION:C70([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4:=$Period)
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[ACCOUNT_BALANCES:34]))
							If ([PERIODS:33]Period_Code:1=<>YrPerF)
								If (<>SYS_l_LoggedInaccount=0)
									QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
								Else 
									QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
								End if 
								[USER:15]Year PeriodF:22:=$Period
								<>YrPerF:=$Period
								DB_SaveRecord(->[USER:15])
							End if 
							If ([PERIODS:33]Period_Code:1=<>YrPerT)
								If (<>SYS_l_LoggedInaccount=0)
									QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
								Else 
									QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
								End if 
								[USER:15]Year PeriodT:23:=$Period
								<>YrPerT:=$Period
								DB_SaveRecord(->[USER:15])
							End if 
							[PERIODS:33]Period_Code:1:=$Period
							DB_SaveRecord(->[PERIODS:33])
							AA_CheckFileUnlocked(->[PERIODS:33]x_ID:10)
						Else 
							MESSAGE:C88("Not converted"+Char:C90(13))
						End if 
						
						NEXT RECORD:C51([PERIODS:33])
					End while 
					If ($_bo_Unload)
						UNLOAD RECORD:C212([USER:15])
					End if 
					CLOSE WINDOW:C154
					If (WIN_bo_TrackerInited)
						$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
						If ($_l_WindowReferenceRow>0)
							WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
						End if 
					End if 
					
				End if 
				USE NAMED SELECTION:C332("$Sel")
				CLEAR NAMED SELECTION:C333("$Sel")
			End if 
		End if 
	End if 
Else 
	Gen_Alert("This Function can only be used at the Administrator password level"; "Cancel")
End if 
ERR_MethodTrackerReturn("Periods Convert"; $_t_oldMethodName)

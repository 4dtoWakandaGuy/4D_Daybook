//%attributes = {}
If (False:C215)
	//Project Method Name:      User_VersionUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/04/2010 16:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(4096\2)
	ARRAY DATE:C224($_ad_Dates; 0)
	ARRAY INTEGER:C220($_ai_BatchStates; 0)
	ARRAY TEXT:C222($_at_Roles; 0)
	//ARRAY TEXT(LIC_at_ReleaseTypes;0)
	C_BLOB:C604(VER_blb_ResourceBlob)
	C_BOOLEAN:C305($_bo_ReadOnlyState)
	C_DATE:C307(<>DB_d_CurrentDate; <>SYS_d_InceptionDate)
	C_LONGINT:C283(<>OINo; $_l_CharPosition; $_l_Index; $_l_LastVerBit; $_l_LongintVersion; $_l_offset; $_l_OptimiseProcess; $_l_OrderItemNumber; $_l_TimeStampProcess; $_l_VersionNEW; $_l_VersionOLD)
	C_TEXT:C284(<>SYS_t_VersionNumber; $_t_Developer; $_t_FullVersiionString; $_t_oldMethodName; $_t_PictureCode; $_t_Place; $_t_Version; $_t_VersionComment; $1; $2; SYS_t_VersionNumber)
	C_TEXT:C284(VER_t_CustomerLicenceVersion; VER_t_LicVerSection1; VER_t_LicVerSection2; VER_t_LicVerSection3; VER_t_LicVerSection4; ver4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_VersionUp")
//TRACE
If (Not:C34(Semaphore:C143("VersUp")))
	OK:=1
	If ([USER:15]Last Version:92><>SYS_t_VersionNumber)
		
		If ((User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator")))
			Gen_Confirm("You have installed a structure file of Daybook Version "+<>SYS_t_VersionNumber+".  Your data file is expecting a Version of "+[USER:15]Last Version:92+" or above.  "+"It is recommended to install the correct version, or revert to a backup data "+"file that matches the structure, but you may continue if you are sure."; Quit_Name; "Continue"; -1984)
			If (OK=1)
				CLEAR SEMAPHORE:C144("VersUp")
				QUIT 4D:C291
				OK:=0
			Else 
				OK:=1
			End if 
		Else 
			Gen_Alert("You have installed a structure file of Daybook Version "+<>SYS_t_VersionNumber+".  Your data file is expecting a Version of "+[USER:15]Last Version:92+" or above.  "+"Please install the correct version, or revert to a backup data file that matches"+" the structure."; Quit_Name; 1984)
			CLEAR SEMAPHORE:C144("VersUp")
			QUIT 4D:C291
			OK:=0
		End if 
	End if 
	If (OK=1)
		If ([USER:15]Town:4="*NEW")
			OK:=1
		Else 
			Gen_Confirm("You have upgraded to Daybook "+<>SYS_t_VersionNumber+".  Data Updates may be required, which may take some time."+"  Other users’ logon will be prevented during this process."+"  Do you wish to Update now, or to "+Quit_Name+"?"; "Update"; Quit_Name; 1984)
		End if 
		If (OK=1)
			
			If ([USER:15]Town:4#"*NEW")
				
				Open_Any_Window(200; 350; -1984)
				MESSAGE:C88(Char:C90(13)+"   Version Updating in progress"+Char:C90(13)+"   Please wait ..."+Char:C90(13))
			End if 
			
			MESSAGES OFF:C175
			$_bo_ReadOnlyState:=Read only state:C362([USER:15])
			If ($_bo_ReadOnlyState=True:C214)
				READ WRITE:C146([USER:15])
				LOAD RECORD:C52([USER:15])
			End if 
			
			$_t_Version:=[USER:15]Last Version:92
			
			//Place to put version update features
			If ($_t_Version<"3.5.210")
				[USER:15]ProdGroupBrand:140:=True:C214
			End if 
			If ($_t_Version<"3.5.211")
				User_Message(Char:C90(13)+"   3.5.211")
				READ WRITE:C146([PURCHASE_INVOICES:37])
				QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=0)
				If (Records in selection:C76([PURCHASE_INVOICES:37])=Records in table:C83([PURCHASE_INVOICES:37]))
					DB_lockFile(->[PURCHASE_INVOICES:37])
					APPLY TO SELECTION:C70([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24:=2)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[PURCHASE_INVOICES:37]))
					QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1="*P@")
					DB_lockFile(->[PURCHASE_INVOICES:37])
					APPLY TO SELECTION:C70([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24:=-2)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[PURCHASE_INVOICES:37]))
					UNLOAD RECORD:C212([PURCHASE_INVOICES:37])
				End if 
				User_CurrCheck
			End if 
			If ($_t_Version<"3.5.214")
				If (Records in table:C83([LAYERS:76])=0)
					User_Message(Char:C90(13)+"   3.5.214")
					[USER:15]Repeat Delay:74:=15
					[USER:15]Check Credit:147:=True:C214
					CREATE RECORD:C68([LAYERS:76])
					[LAYERS:76]Layer_Code:1:="A"
					[LAYERS:76]Layer_Name:2:="Actual"
					[LAYERS:76]Period_Controls:3:=True:C214
					DB_SaveRecord(->[LAYERS:76])
					CREATE RECORD:C68([LAYERS:76])
					[LAYERS:76]Layer_Code:1:="B"
					[LAYERS:76]Layer_Name:2:="Budget 1"
					DB_SaveRecord(->[LAYERS:76])
					CREATE RECORD:C68([LAYERS:76])
					[LAYERS:76]Layer_Code:1:="P"
					[LAYERS:76]Layer_Name:2:="Phantom"
					DB_SaveRecord(->[LAYERS:76])
					UNLOAD RECORD:C212([LAYERS:76])
					[USER:15]Actual Layer:146:="A"
				End if 
			End if 
			If ($_t_Version<"3.5.302")
				User_Message(Char:C90(13)+"   3.5.302")
				If ([USER:15]SL New Date:154=!00-00-00!)
					[USER:15]SL New Date:154:=<>DB_d_CurrentDate
				End if 
			End if 
			If ($_t_Version<"3.5.400")
				[USER:15]Func Palette:162:=True:C214
			End if 
			If ($_t_Version<"3.6.001")
				User_Message(Char:C90(13)+"   3.6.001")
				Headings_Update
			End if 
			If ($_t_Version<"3.6.003")
				[USER:15]Mail Salutation:176:="Dear Sir/Madam"
			End if 
			
			If ([USER:15]Town:4#"*NEW")
				
				If ($_t_Version<"3.6.006")
					User_Message(Char:C90(13)+"   3.6.006")
					$_l_Index:=1
					ON ERR CALL:C155("Remote_Err")
					//ALERT("Method called on error "+Method called on error+"User_VersionUp")
					
					While ($_l_Index<13)
						$_t_PictureCode:=MonthName(Date_FromNums(1; $_l_Index; 94))
						QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=$_t_PictureCode)
						If (Records in selection:C76([PICTURES:85])=0)
							CREATE RECORD:C68([PICTURES:85])
							[PICTURES:85]Picture_Code:1:=Uppercase:C13($_t_PictureCode)
							[PICTURES:85]Picture_Name:2:=$_t_PictureCode+"'s Calendar Picture"
							DB_SaveRecord(->[PICTURES:85])
							AA_CheckFileUnlocked(->[PICTURES:85]x_ID:5)
						End if 
						$_l_Index:=$_l_Index+1
					End while 
					ON ERR CALL:C155("")
					UNLOAD RECORD:C212([PICTURES:85])
				End if 
				If ($_t_Version<"3.6.009")
					User_Message(Char:C90(13)+"   3.6.009")
					READ WRITE:C146([PERIODS:33])
					ALL RECORDS:C47([PERIODS:33])
					DB_lockFile(->[PERIODS:33])
					APPLY TO SELECTION:C70([PERIODS:33]; [PERIODS:33]Profit_Posted:9:=True:C214)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERIODS:33]))
					UNLOAD RECORD:C212([PERIODS:33])
					READ ONLY:C145([PERIODS:33])
				End if 
			End if 
			If ($_t_Version<"3.6.011")
				[USER:15]Assembly Stock:180:="A"
			End if 
			
			If ([USER:15]Town:4#"*NEW")
				If (($_t_Version<"3.6.013") & ([USER:15]User Additions:164#"@+GB@"))
					
					User_Message(Char:C90(13)+"   3.6.013")
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]TAX_Prefix:38#"")
					DB_lockFile(->[COMPANIES:2])
					APPLY TO SELECTION:C70([COMPANIES:2]; [COMPANIES:2]TAX_Prefix:38:=Substring:C12([COMPANIES:2]TAX_Prefix:38; 1; 2))
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[COMPANIES:2]))
					[USER:15]VAT Prefix:70:=Uppercase:C13(Substring:C12([USER:15]VAT Prefix:70; 1; 2))
				End if 
				If ($_t_Version<"3.6.014")
					User_Message(Char:C90(13)+"   3.6.014")
					READ WRITE:C146([DIARY:12])
					QUERY:C277([DIARY:12]; [DIARY:12]Done:14=False:C215)
					DB_lockFile(->[DIARY:12])
					APPLY TO SELECTION:C70([DIARY:12]; Diary_PersPrior)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
					UNLOAD RECORD:C212([DIARY:12])
				End if 
				If ($_t_Version<"3.6.022")
					User_Message(Char:C90(13)+"   3.6.022")
					If (Not:C34(Semaphore:C143("NomUpdate")))
						READ WRITE:C146([TRANSACTION_BATCHES:30])
						ALL RECORDS:C47([TRANSACTION_BATCHES:30])
						User_Message(Char:C90(13)+"    Updating Nominal Ledger")
						ARRAY INTEGER:C220($_ai_BatchStates; Records in selection:C76([TRANSACTION_BATCHES:30]))
						SELECTION TO ARRAY:C260([TRANSACTION_BATCHES:30]Entry_Date:6; $_ad_Dates)
						User_Message(Char:C90(13)+Char:C90(13)+"     Stage 1 of 3 Complete"+Char:C90(13))
						For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCHES:30]))
							$_ai_BatchStates{$_l_Index}:=2
						End for 
						User_Message("     Stage 2 of 3 Complete"+Char:C90(13))
						ARRAY TO SELECTION:C261($_ai_BatchStates; [TRANSACTION_BATCHES:30]State:15; $_ad_Dates; [TRANSACTION_BATCHES:30]Posted_Date:16)
						User_Message("     Completed"+Char:C90(13))
						UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
						READ ONLY:C145([TRANSACTION_BATCHES:30])
					End if 
					CLEAR SEMAPHORE:C144("NomUpdate")
				End if 
			End if 
			
			If ($_t_Version<"3.6.023")
				If ($_t_Version>"3.6.013")
					[USER:15]Stock Analysis:193:=True:C214
				End if 
			End if 
			
			If ([USER:15]Town:4#"*NEW")
				If ($_t_Version<"3.6.025")
					User_Message(Char:C90(13)+"   3.6.025")
					ARRAY TEXT:C222($_at_Roles; 0)
					
					If (Records in table:C83([ROLES:87])=0)
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Role:11#"")
						If (Records in selection:C76([CONTACTS:1])#0)
							DISTINCT VALUES:C339([CONTACTS:1]Role:11; $_at_Roles)
							If (Size of array:C274($_at_Roles)>0)
								ALL RECORDS:C47([ROLES:87])
								ARRAY TO SELECTION:C261($_at_Roles; [ROLES:87]Role_Code:1)
							End if 
							READ ONLY:C145([ROLES:87])
							UNLOAD RECORD:C212([ROLES:87])
						End if 
						UNLOAD RECORD:C212([CONTACTS:1])
					End if 
				End if 
				If ($_t_Version<"3.7.000")
					User_Message(Char:C90(13)+"   3.7.000")
					[USER:15]Waiting Proc:194:=3
					[USER:15]Access Type:195:=True:C214
				End if 
				If ($_t_Version<"3.7.001")
					User_Message(Char:C90(13)+"   3.7.001")
					User_Message(Char:C90(13)+"    Changing Order Items Unique No")
					QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=14)
					$_l_OrderItemNumber:=[IDENTIFIERS:16]Number:2
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27>$_l_OrderItemNumber)
					If (Records in selection:C76([ORDER_ITEMS:25])>0)
						ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27; >)
						LAST RECORD:C200([ORDER_ITEMS:25])
						[IDENTIFIERS:16]Number:2:=[ORDER_ITEMS:25]Item_Number:27+1
						DB_SaveRecord(->[IDENTIFIERS:16])
						<>OINo:=[IDENTIFIERS:16]Number:2
					End if 
					UNLOAD RECORD:C212([IDENTIFIERS:16])
				End if 
				If ($_t_Version<"3.7.004")
					User_Message(Char:C90(13)+"   3.7.004")
					User_Message(Char:C90(13)+"    Creating Companies_Abbrev field in background")
					$_l_Index:=New process:C317("User_Vers37004"; DB_ProcessMemoryinit(4); "3.7.004 Updates")
				End if 
			End if 
			
			If ($_t_Version<"3.7.100")
				User_Vers37100
			Else 
				If ($_t_Version<"3.7.101")
					User_Message(Char:C90(13)+"    Updating Project Record States")
					READ WRITE:C146([TABLE_RECORD_STATES:90])
					ALL RECORDS:C47([TABLE_RECORD_STATES:90])
					DB_lockFile(->[TABLE_RECORD_STATES:90])
					APPLY TO SELECTION:C70([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4:=("0"*(3-Length:C16(String:C10([TABLE_RECORD_STATES:90]Table_number:3))))+String:C10([TABLE_RECORD_STATES:90]Table_number:3)+[TABLE_RECORD_STATES:90]State_Code:1)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[TABLE_RECORD_STATES:90]))
					READ ONLY:C145([TABLE_RECORD_STATES:90])
					UNLOAD RECORD:C212([TABLE_RECORD_STATES:90])
					READ WRITE:C146([PROJECTS:89])
					ALL RECORDS:C47([PROJECTS:89])
					DB_lockFile(->[PROJECTS:89])
					APPLY TO SELECTION:C70([PROJECTS:89]; [PROJECTS:89]State:9:="0"+[PROJECTS:89]State:9)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[PROJECTS:89]))
					READ ONLY:C145([PROJECTS:89])
					UNLOAD RECORD:C212([PROJECTS:89])
				End if 
			End if 
			If ($_t_Version<"3.7.101")
				User_Message(Char:C90(13)+"   3.7.101")
				User_Vers37101
			End if 
			If ($_t_Version<"3.7.102")
				User_Message(Char:C90(13)+"   3.7.102")
				User_Vers37102  //Update DiaryTos to be the same as the Froms
			End if 
			
			If ([USER:15]Town:4#"*NEW")
				If ($_t_Version<"3.7.103")
					User_Message(Char:C90(13)+"   3.7.103")
					User_Vers37103  //new VAT
				End if 
				If (($_t_Version<"3.7.105") & ($_t_Version>"3.7.101"))
					READ WRITE:C146([TRANSACTIONS:29])
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1=""; *)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_invoice_number:19#"")
					If (Records in selection:C76([TRANSACTIONS:29])>0)
						User_Message(Char:C90(13)+"    Updating Purchase Transaction Types")
						DB_lockFile(->[TRANSACTIONS:29])
						APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1:=[USER:15]PurchP Trans:28)
						
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
					End if 
					READ ONLY:C145([TRANSACTIONS:29])
					UNLOAD RECORD:C212([TRANSACTIONS:29])
				End if 
			End if 
			
			If ($_t_Version<"3.7.105")
				User_Message(Char:C90(13)+"   3.7.105")
				User_Vers37105
			End if 
			If ($_t_Version<"3.7.106")
				
				If ($_t_Version="3.7.105")
					If (([USER:15]WIP TR Trans:200#"") & ([USER:15]WIP CI Trans:201#""))
						READ WRITE:C146([JOBS:26])
						QUERY:C277([JOBS:26]; [JOBS:26]JS_WIP_Cost_Amount:45#0)
						If (Records in selection:C76([JOBS:26])>0)
							User_Message(Char:C90(13)+"    Updating Jobs to use WIP")
							DB_lockFile(->[JOBS:26])
							APPLY TO SELECTION:C70([JOBS:26]; [JOBS:26]Use_WIP:47:=True:C214)
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOBS:26]))
							UNLOAD RECORD:C212([JOBS:26])
						End if 
					End if 
				End if 
				User_Vers37106B
			End if 
			
			If ([USER:15]Town:4#"*NEW")
				If ($_t_Version<"3.7.108")
					User_Message(Char:C90(13)+"   3.7.108")
					User_Vers37108
				End if 
				If ($_t_Version<"3.7.110")
					If ($_t_Version="3.7.109")
						User_Message(Char:C90(13)+"   3.7.110")
						READ WRITE:C146([ORDER_ITEMS:25])
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18="COMPONENT*")
						DB_lockFile(->[ORDER_ITEMS:25])
						APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18:="BUNDLE*")
						
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18="COMPONENTS")
						DB_lockFile(->[ORDER_ITEMS:25])
						APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18:="BUNDLE")
						
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
						READ ONLY:C145([ORDER_ITEMS:25])
						UNLOAD RECORD:C212([ORDER_ITEMS:25])
					End if 
				End if 
			End if 
			
			If ($_t_Version<"3.7.111")
				User_Message(Char:C90(13)+"   3.7.111")
				[USER:15]Decimal Price:206:=2
				If (Records in table:C83([JOB_STAGES:47])>0)
					User_Vers37111
				End if 
			End if 
			
			If ([USER:15]Town:4#"*NEW")
				If ($_t_Version<"3.7.113")
					User_Message(Char:C90(13)+"   3.7.113")
					User_Vers37113  //fill in Companies PL Terms; update Price Grps; fill in PO Items' new Orig Cost
				End if 
			End if 
			
			If ($_t_Version<"3.7.115")
				User_Message(Char:C90(13)+"   3.7.115")
				User_Vers37115  //Update Diary_PersPrior & Convert to new-style Lists
			End if 
			If ($_t_Version<"4.0.000")
				User_Message(Char:C90(13)+"   4.0.000")
				[USER:15]ScreenSaverMin:210:=3
			End if 
			If ($_t_Version<"4.0.001")
				User_Message(Char:C90(13)+"   4.0.001")
				User_Vers40001  //Change Module NL to GL
			End if 
			If ($_t_Version<"4.0.003")
				User_Message(Char:C90(13)+"   4.0.003")
				If ([USER:15]VAT CashAcc:211#"")
					[USER:15]VAT Cash:212:=True:C214
				End if 
			End if 
			If ($_t_Version<"4.0.004")
				User_Message(Char:C90(13)+"   4.0.004")
				User_Vers40004  //Create List 'Del Terms'
			End if 
			
			If ($_t_Version<"4.0.005")
				User_Message(Char:C90(13)+"   4.0.005")
				User_Vers40005  //Import SR Pro Forms & update existing List Layout records
			End if 
			
			If ($_t_Version<"4.0.005")
				User_Message(Char:C90(13)+"   4.0.005")
				[USER:15]Palette Delay:80:=45
			End if 
			If ($_t_Version<"4.0.006")
				User_Message(Char:C90(13)+"   4.0.006")
				User_Vers40006  //Apply a unique Code to Qualities
			End if 
			If ($_t_Version<"4.0.010")
				User_Message(Char:C90(13)+"   4.0.010")
				User_Vers40010  //Update things removed from Silver's Prefs
			End if 
			If ($_t_Version<"4.0.011")
				User_Message(Char:C90(13)+"   4.0.011")
				If ((DB_GetModuleSettingByNUM(1))=5)
					[USER:15]Word Processor:14:=2  //set to SuperWrite
				End if 
			End if 
			If ($_t_Version<"4.0.014")
				User_Message(Char:C90(13)+"   4.0.014")
				User_Vers40014  //remove more things from Silver
			End if 
			If ($_t_Version<"4.0.015")
				User_Message(Char:C90(13)+"   4.0.015")
				[USER:15]Opening Balance:49:=""  //clear what was the Stats Act field
				[USER:15]Date FirstRun:214:=<>DB_d_CurrentDate  //set it so that doesn't check every time
				<>SYS_d_InceptionDate:=<>DB_d_CurrentDate
			End if 
			If ($_t_Version<"4.0.017")
				User_Message(Char:C90(13)+"   4.0.017")
				User_Vers40017  //update Pre-Pay & Deposit Trans_Types
			End if 
			If ($_t_Version<"4.0.018")
				User_Message(Char:C90(13)+"   4.0.018")
				User_Vers40018  //NL I/O/N Field
			End if 
			If ($_t_Version<"4.0.029")
				User_Message(Char:C90(13)+"   4.0.029")
				If ((DB_GetModuleSettingByNUM(1))=5)
					QUERY:C277([JOBS:26]; [JOBS:26]Actual_TR:29=False:C215)
					If (Records in selection:C76([JOBS:26])>0)
						User_Message(Char:C90(13)+"      Updating Jobs")
						DB_lockFile(->[JOBS:26])
						APPLY TO SELECTION:C70([JOBS:26]; [JOBS:26]Actual_TR:29:=True:C214)
						
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOBS:26]))
					End if 
				End if 
			End if 
			If ($_t_Version<"4.0.031")
				User_Message(Char:C90(13)+"   4.0.031")
				User_Vers40031  //Convert Lists list to a List
			End if 
			If ($_t_Version<"4.0.034")
				User_Message(Char:C90(13)+"   4.0.034")
				User_Vers40034  //Convert Accept Macros
			End if 
			If ($_t_Version<"4.0.036")
				User_Message(Char:C90(13)+"   4.0.036")
				User_Vers40036  //Update new alloc fld in Stock Types
			End if 
			If ($_t_Version<"4.1.000")
				User_Message(Char:C90(13)+"   4.1.000")
				User_Vers41000  //Creating Pictures List
			End if 
			If ($_t_Version<"4.1.002")
				User_Message(Char:C90(13)+"   4.1.002")
				User_Vers41002  //Creating Macro Groups_List
			End if 
			If ($_t_Version<"4.1.004")
				User_Message(Char:C90(13)+"   4.1.004")
				User_Vers41004  //Updating Personnel email address
			End if 
			If ($_t_Version<"4.1.006")
				User_Message(Char:C90(13)+"   4.1.006")
				User_Vers41006  //Updating Co & Cont email addresses
			End if 
			If ($_t_Version<"4.1.010")
				User_Message(Char:C90(13)+"   4.1.010")
				User_Vers41010  //Creating Curr Rate Types List
			End if 
			
			If ($_t_Version<"4.2.006")
				READ WRITE:C146([SCRIPTS:80])
				ALL RECORDS:C47([SCRIPTS:80])
				DB_lockFile(->[SCRIPTS:80])
				APPLY TO SELECTION:C70([SCRIPTS:80]; [SCRIPTS:80]Recording_Text:4:=Macro_translate([SCRIPTS:80]Recording_Text:4))
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[SCRIPTS:80]))
				UNLOAD RECORD:C212([SCRIPTS:80])
			End if 
			If ($_t_Version<"4.2.010")
				User_Message(Char:C90(13)+"   4.2.010")
				User_Message(Char:C90(13)+"   This version now supports platform specifc SuperReports")
				User_Message(Char:C90(13)+"   PSR...For Macintosh SuperReports")
				User_Message(Char:C90(13)+"   WSR...For Windows SuperReports")
				User_Message(Char:C90(13)+"   SR...For both platforms")
				
			End if 
			If ($_t_Version<"4.2.012")
				User_Message(Char:C90(13)+"   4.2.012")
				User_Message(Char:C90(13)+"   Building Address Field")
				READ WRITE:C146([COMPANIES:2])
				ALL RECORDS:C47([COMPANIES:2])
				DB_lockFile(->[COMPANIES:2])
				APPLY TO SELECTION:C70([COMPANIES:2]; [COMPANIES:2]ADDRESS:60:=WS_BUILDADDRESS)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[COMPANIES:2]))
				UNLOAD RECORD:C212([COMPANIES:2])
				READ WRITE:C146([CONTACTS:1])
				ALL RECORDS:C47([CONTACTS:1])
				User_Message(Char:C90(13)+"   Building Contact Names")
				DB_lockFile(->[CONTACTS:1])
				APPLY TO SELECTION:C70([CONTACTS:1]; [CONTACTS:1]Contact_Name:31:=Cont Name)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[CONTACTS:1]))
				Gen_Confirm("Would you like indexes optimised?")
				If (OK=1)
					If (Application type:C494=4D Remote mode:K5:5)
						Gen_Alert("This will happen on the server")
						$_l_OptimiseProcess:=Execute on server:C373("Set_INDEX_PRIORITIES"; DB_ProcessMemoryinit(1); "OPTIMISE  INDEXES(90%)"; 90; (Application type:C494=4D Remote mode:K5:5))  //this takes a long time!
					Else 
						$_l_OptimiseProcess:=New process:C317("Set_INDEX_PRIORITIES"; DB_ProcessMemoryinit(1); "OPTIMISE  INDEXES(90%)"; 90; (Application type:C494=4D Remote mode:K5:5))  //this takes a long time!
						
					End if 
					
					$_l_OptimiseProcess:=Execute on server:C373("Set_INDEX_PRIORITIES"; DB_ProcessMemoryinit(1); "OPTIMISE  INDEXES(90%)"; 90; (Application type:C494=4D Remote mode:K5:5))  //this takes a long time!
				End if 
				ALL RECORDS:C47([PERSONNEL:11])
				DB_lockFile(->[PERSONNEL:11])
				User_Message(Char:C90(13)+"   Adjusting Personnel Settings")
				
				APPLY TO SELECTION:C70([PERSONNEL:11]; UPD_42012_update_Settings)
				
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERSONNEL:11]))
				
				
			End if 
			
			If ($_t_Version<"4.2.014")
				User_Message(Char:C90(13)+"   4.2.014")
				
				UPG_ConvertDocTemplates
			End if 
			If ($_t_Version<"4.2.015")
				User_Message(Char:C90(13)+"   4.2.015")
				
				$_l_TimeStampProcess:=Execute on server:C373("UPD_DiaryDateTimeStamp"; DB_ProcessMemoryinit(1); "UPDATE VERSION"; 1)
			End if 
			
			If ($_t_Version<"5.0.000")
				User_Message(Char:C90(13)+"   Daybook Version 1.0")
				User_Vers5000
			End if 
			
			
			DB_SaveRecord(->[USER:15])
			FLUSH CACHE:C297
			MESSAGES ON:C181
			If (Count parameters:C259>=2)
				//the sub version number
				//$1 the old vers
				$_l_VersionOLD:=0
				$_l_CharPosition:=Position:C15("/"; $1)
				If ($_l_CharPosition=0)
					$_l_VersionOLD:=0
				Else 
					$_l_VersionOLD:=Num:C11(Substring:C12($1; $_l_CharPosition+1; Length:C16($1)))
				End if 
				$_l_CharPosition:=Position:C15("/"; $2)
				If ($_l_CharPosition=0)
					$_l_VersionNEW:=0
				Else 
					$_l_VersionNEW:=Num:C11(Substring:C12($2; $_l_CharPosition+1; Length:C16($2)))
				End if 
				
				
				//$2=The new Vers
				If (<>SYS_t_VersionNumber>"5.0.000") & ($_t_Version<="5.2.000")
					
					User_Vers50001
					
				End if 
			End if 
			
			
			If ([USER:15]Town:4#"*NEW")
				CLOSE WINDOW:C154
			End if 
			READ WRITE:C146([USER:15])
			LOAD RECORD:C52([USER:15])
			[USER:15]Last Version:92:=<>SYS_t_VersionNumber
			DB_SaveRecord(->[USER:15])
			
		Else 
			CLEAR SEMAPHORE:C144("VersUp")
			QUIT 4D:C291
		End if 
	End if 
End if 

SYS_t_VersionNumber:=VER_GetVersion
VER_t_CustomerLicenceVersion:=VER_GetLicenceVersion
$_l_offset:=0
$_l_LongintVersion:=BLOB to longint:C551(VER_blb_ResourceBlob; Macintosh byte ordering:K22:2; $_l_offset)
VER_t_LicVerSection1:=String:C10($_l_LongintVersion\256)
VER_t_LicVerSection2:=String:C10(($_l_LongintVersion-(($_l_LongintVersion\256)*256))\16)
VER_t_LicVerSection3:=String:C10($_l_LongintVersion%16)
$_l_LongintVersion:=BLOB to longint:C551(VER_blb_ResourceBlob; Macintosh byte ordering:K22:2; $_l_offset)
VER_t_LicVerSection4:=""
LIC_at_ReleaseTypes:=$_l_LongintVersion\4096\2
If (LIC_at_ReleaseTypes<=0)
	LIC_at_ReleaseTypes:=4
End if 
$_t_Place:=BLOB to text:C555(VER_blb_ResourceBlob; Mac Pascal string:K22:8; $_l_offset)
$_t_FullVersiionString:=BLOB to text:C555(VER_blb_ResourceBlob; Mac Pascal string:K22:8; $_l_offset)
If (BLOB size:C605(VER_blb_ResourceBlob)>$_l_offset)
	$_t_Developer:=BLOB to text:C555(VER_blb_ResourceBlob; Mac Pascal string:K22:8; $_l_offset)
	If (BLOB size:C605(VER_blb_ResourceBlob)>$_l_offset)
		$_t_VersionComment:=BLOB to text:C555(VER_blb_ResourceBlob; Mac Pascal string:K22:8; $_l_offset)
	Else 
		$_t_VersionComment:=""
	End if 
Else 
	$_t_VersionComment:=""
	$_t_Developer:=""
End if 
$_l_LastVerBit:=($_l_LongintVersion-($_l_LongintVersion\256*256))
$_l_LastVerBit:=(($_l_LastVerBit\16)*10)+($_l_LastVerBit%16)+1
If ($_l_LastVerBit<0)
	$_l_LastVerBit:=0
End if 
ver4:=String:C10($_l_LastVerBit)
VER_UPDATEVERSION(VER_t_LicVerSection1; VER_t_LicVerSection2; VER_t_LicVerSection3; VER_t_LicVerSection4; LIC_at_ReleaseTypes; VER_t_CustomerLicenceVersion; 1)

CLEAR SEMAPHORE:C144("VersUp")
ERR_MethodTrackerReturn("User_VersionUp"; $_t_oldMethodName)

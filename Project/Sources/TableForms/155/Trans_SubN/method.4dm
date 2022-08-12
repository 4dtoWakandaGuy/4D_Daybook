If (False:C215)
	//Table Form Method Name: [TRANSACTION_BATCH_ITEMS]Trans_SubN
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2009 14:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $currentbottom; $CurrentLeft; $currentright; $currenttop)
	C_TEXT:C284($_t_oldMethodName; VCacc; VCaccIO; vCAccName; vCompany; VDacc; VDaccIO; vDAccName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [TRANSACTION_BATCH_ITEMS].Trans_SubN"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Display Detail:K2:22)
		If ((Modified:C32([TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Job_Code:23)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Description:10)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Total:9)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]UK_EC:18)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Tax_Code:7)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Amount:6)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Period_Code:11)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Company_Code:13)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)))
			Trans_SubLP
		End if 
		If ([TRANSACTION_BATCH_ITEMS:155]Company_Code:13#[COMPANIES:2]Company_Code:1)
			RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Company_Code:13)
		End if 
		vCompany:=[COMPANIES:2]Company_Name:2
		If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")
			vCAccName:=""
		Else 
			RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
			vCAccName:=[ACCOUNTS:32]Account_Name:3
		End if 
		If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3="")
			vDAccName:=""
		Else 
			RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
			vDAccName:=[ACCOUNTS:32]Account_Name:3
		End if 
		
	: ($_l_event=On Data Change:K2:15)
		If ((Modified:C32([TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Job_Code:23)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Description:10)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Total:9)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]UK_EC:18)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Tax_Code:7)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Amount:6)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Period_Code:11)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Company_Code:13)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2)) | (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)))
			Trans_SubLP
		End if 
		If ([TRANSACTION_BATCH_ITEMS:155]Company_Code:13#[COMPANIES:2]Company_Code:1)
			RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Company_Code:13)
		End if 
		vCompany:=[COMPANIES:2]Company_Name:2
		GET WINDOW RECT:C443($CurrentLeft; $currenttop; $currentright; $currentbottom)
		If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")
			vCAccName:=""
		Else 
			RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
			
			vCAccName:=[ACCOUNTS:32]Account_Name:3
			
			
		End if 
		If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3="")
			vDAccName:=""
		Else 
			
			RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
			vDAccName:=[ACCOUNTS:32]Account_Name:3
			
			
			
		End if 
		//OK THIS MIGHT SEEM WIERD
		//TAKE IT OUT AND THE vDaccName and VCaccName dont appear
		//This causes a screen redraw(Yes I tried redrawing!!) which works
		
		SET WINDOW RECT:C444($CurrentLeft; $currenttop; $currentright; $currentbottom-1)
		SET WINDOW RECT:C444($CurrentLeft; $currenttop; $currentright; $currentbottom)
		// SHOW PROCESS(Current process)
		// BRING TO FRONT(Current process)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Trans_SubLPB
		VDacc:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
		VCacc:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
		VDaccIO:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
		VCaccIO:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
End case 
ERR_MethodTrackerReturn("FM [TRANSACTION_BATCH_ITEMS].Trans_SubN"; $_t_oldMethodName)

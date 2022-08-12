//%attributes = {}

If (False:C215)
	//Project Method Name:      SP_UpdatePipeline
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_RRState)
	C_LONGINT:C283($_l_CompanyID; $_l_ContactID; $_l_CurrencyID; $_l_GroupID; $1; $10; $2; $5; $7; CB_SP_Orders)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $11; $12; $3; $4; $6; $8; $9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_UpdatePipeline")

//this method will update a pipeline entry when saving an order etc

SP_LoadGenPrefs

//$1=Sales Table
//$2=Sales record-the record ID not the CODE
//$3=The record Code`
//$4=the sales person intials
//$5=The companyID(Can be 0)
//$6=the company code(can be empty )
//$7=the contactID(can be 0)
//$8=the contact code(can be empty)
//$9=the desciption(Text-if you want it)
//$10=currencyID(can be0)
//$11=
READ WRITE:C146([SALES_PROJECTION:113])
QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]RelatedSaleTableID:8=$1; *)
QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleRecordID:9=$2)
If (Records in selection:C76([SALES_PROJECTION:113])=0)
	//  $_t_oldMethodName:=ERR_MethodTracker ("SP_UpdatePipeline")  ` 26/02/03 pb
	
	//we only auto create if it is a preference
	If (CB_SP_Orders>0)
		//   $_t_oldMethodName:=ERR_MethodTracker ("SP_UpdatePipeline")  ` 26/02/03 pb
		CREATE RECORD:C68([SALES_PROJECTION:113])
		
		[SALES_PROJECTION:113]Forcast_LevelID:3:=1
		If ($4#"")
			READ ONLY:C145([PERSONNEL:11])
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$4)
			$_l_GroupID:=[PERSONNEL:11]UserGroupIDs:39
			[SALES_PROJECTION:113]PersonnelOwnerID:4:=[PERSONNEL:11]Personnel_ID:48
			[SALES_PROJECTION:113]PersonnelGroupID:5:=[PERSONNEL:11]UserGroupIDs:39
			UNLOAD RECORD:C212([PERSONNEL:11])
		End if 
		If ($5>0)
			[SALES_PROJECTION:113]CompanyID:6:=$5
		Else 
			//    $_t_oldMethodName:=ERR_MethodTracker ("SP_UpdatePipeline")  ` 26/02/03 pb
			If ($6#"")
				$_l_CompanyID:=[COMPANIES:2]x_ID:63
				$_bo_RRState:=Read only state:C362([COMPANIES:2])
				READ ONLY:C145([COMPANIES:2])
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$6)
				[SALES_PROJECTION:113]CompanyID:6:=[COMPANIES:2]x_ID:63
				UNLOAD RECORD:C212([COMPANIES:2])
				If ($_bo_RRState=False:C215)
					READ WRITE:C146([COMPANIES:2])
				End if 
				If ($_l_CompanyID>0)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$_l_CompanyID)
				End if 
			End if 
		End if 
		If ($7>0)
			[SALES_PROJECTION:113]ContactID:7:=$7
		Else 
			If ($8#"")
				$_l_ContactID:=[CONTACTS:1]x_ID:33
				$_bo_RRState:=Read only state:C362([CONTACTS:1])
				READ ONLY:C145([CONTACTS:1])
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$8)
				[SALES_PROJECTION:113]ContactID:7:=[CONTACTS:1]x_ID:33
				UNLOAD RECORD:C212([CONTACTS:1])
				If ($_bo_RRState=False:C215)
					READ WRITE:C146([CONTACTS:1])
				End if 
				If ($_l_ContactID>0)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$_l_ContactID)
				End if 
			End if 
		End if 
		[SALES_PROJECTION:113]RelatedSaleTableID:8:=$1
		[SALES_PROJECTION:113]RelatedSaleRecordID:9:=$2
		[SALES_PROJECTION:113]Date_Entered:10:=Current date:C33(*)
		If ($9#"")
			[SALES_PROJECTION:113]Description:11:=$9
		Else 
			If (Is table number valid:C999($1))
				[SALES_PROJECTION:113]Description:11:="Automatically Created by "+Table name:C256(Table:C252($1))
			Else 
				[SALES_PROJECTION:113]Description:11:="Automatically Created by unknown "
			End if 
		End if 
		//    $_t_oldMethodName:=ERR_MethodTracker ("SP_UpdatePipeline")  ` 26/02/03 pb
		
		If ($10>0)
			[SALES_PROJECTION:113]CurrencyID:12:=$10
		Else 
			//     $_t_oldMethodName:=ERR_MethodTracker ("SP_UpdatePipeline")  ` 26/02/03 pb
			If ($11#"")
				$_l_CurrencyID:=[CURRENCIES:71]X_ID:3
				$_bo_RRState:=Read only state:C362([CURRENCIES:71])
				READ ONLY:C145([CURRENCIES:71])
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=$11)
				[SALES_PROJECTION:113]ContactID:7:=[CURRENCIES:71]X_ID:3
				UNLOAD RECORD:C212([CURRENCIES:71])
				If ($_bo_RRState=False:C215)
					READ WRITE:C146([CURRENCIES:71])
				End if 
				If ($_l_CurrencyID>0)
					QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=$_l_CurrencyID)
				End if 
			Else 
				$_l_CurrencyID:=[CURRENCIES:71]X_ID:3
				$_bo_RRState:=Read only state:C362([CURRENCIES:71])
				READ ONLY:C145([CURRENCIES:71])
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=<>SYS_t_BaseCurrency)
				[SALES_PROJECTION:113]ContactID:7:=[CURRENCIES:71]X_ID:3
				UNLOAD RECORD:C212([CURRENCIES:71])
				If ($_bo_RRState=False:C215)
					READ WRITE:C146([CURRENCIES:71])
				End if 
				If ($_l_CurrencyID>0)
					QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=$_l_CurrencyID)
				End if 
			End if 
		End if 
		//    $_t_oldMethodName:=ERR_MethodTracker ("SP_UpdatePipeline")  ` 26/02/03 pb
		[SALES_PROJECTION:113]Class_ID:2:=SP_GetSaleType([SALES_PROJECTION:113]RelatedSaleTableID:8; [SALES_PROJECTION:113]RelatedSaleRecordID:9; False:C215)
		[SALES_PROJECTION:113]Status:20:=SP_GetSalesOrderState([SALES_PROJECTION:113]RelatedSaleTableID:8; $3; [SALES_PROJECTION:113]Status:20; False:C215)
		[SALES_PROJECTION:113]GrossValue:13:=SP_GetSalesOrderValue([SALES_PROJECTION:113]RelatedSaleTableID:8; $3; ->[SALES_PROJECTION:113]ConvertedSaleValue:19; ->[SALES_PROJECTION:113]Probability:17; ->[SALES_PROJECTION:113]Expected_date:16; ->[SALES_PROJECTION:113]ConvertedSaleCosts:28)
		[SALES_PROJECTION:113]Expected_date:16:=SP_GetSalesOrderDate([SALES_PROJECTION:113]RelatedSaleTableID:8; $3; [SALES_PROJECTION:113]ConvertedSaleValue:19)
		[SALES_PROJECTION:113]GrossMargin:15:=SP_CalcMargin([SALES_PROJECTION:113]GrossValue:13; [SALES_PROJECTION:113]GrossCosts:14)
		If ([SALES_PROJECTION:113]ConvertedSaleValue:19>0)
			[SALES_PROJECTION:113]Probability:17:=100
		End if 
		If ($12#"")
			[SALES_PROJECTION:113]Title:21:=$12
		Else 
			[SALES_PROJECTION:113]Title:21:="Automatically Created by "+Table name:C256(Table:C252($1))
		End if 
		
		[SALES_PROJECTION:113]RelatedDiaryID:27:=0
		DB_SaveRecord(->[SALES_PROJECTION:113])
		AA_CheckFileUnlocked(->[SALES_PROJECTION:113]x_ID:1)
		
	End if 
Else 
	//  $_t_oldMethodName:=ERR_MethodTracker ("SP_UpdatePipeline")  ` 26/02/03 pb
	//load the record
	//update the status
	//update the converted values
	[SALES_PROJECTION:113]Status:20:=SP_GetSalesOrderState([SALES_PROJECTION:113]RelatedSaleTableID:8; $3; [SALES_PROJECTION:113]Status:20; False:C215)
	[SALES_PROJECTION:113]GrossValue:13:=SP_GetSalesOrderValue([SALES_PROJECTION:113]RelatedSaleTableID:8; $3; ->[SALES_PROJECTION:113]ConvertedSaleValue:19; ->[SALES_PROJECTION:113]Probability:17; ->[SALES_PROJECTION:113]Expected_date:16; ->[SALES_PROJECTION:113]ConvertedSaleCosts:28)
	[SALES_PROJECTION:113]Expected_date:16:=SP_GetSalesOrderDate([SALES_PROJECTION:113]RelatedSaleTableID:8; $3; [SALES_PROJECTION:113]ConvertedSaleValue:19)
	[SALES_PROJECTION:113]GrossMargin:15:=SP_CalcMargin([SALES_PROJECTION:113]GrossValue:13; [SALES_PROJECTION:113]GrossCosts:14)
	//  $_t_oldMethodName:=ERR_MethodTracker ("SP_UpdatePipeline")  ` 26/02/03 pb
	
	DB_SaveRecord(->[SALES_PROJECTION:113])
	//  $_t_oldMethodName:=ERR_MethodTracker ("SP_UpdatePipeline")  ` 26/02/03 pb
	AA_CheckFileUnlocked(->[SALES_PROJECTION:113]x_ID:1)
	//  $_t_oldMethodName:=ERR_MethodTracker ("SP_UpdatePipeline")  ` 26/02/03 pb
	
End if 

UNLOAD RECORD:C212([SALES_PROJECTION:113])
ERR_MethodTrackerReturn("SP_UpdatePipeline"; $_t_oldMethodName)

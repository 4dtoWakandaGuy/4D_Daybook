//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_GetFormcolour
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/10/2011 10:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_BackGroundColor; $_l_Blue; $_l_BlueLIGHT; $_l_Brown; $_l_BrownLIGHT; $_l_Green; $_l_GreenLIGHT; $_l_InputColor; $_l_Orange; $_l_OrangeLIGHT; $_l_Purple)
	C_LONGINT:C283($_l_PurpleLIGHT; $_l_SkinsID; $_l_Steel; $_l_SteelLIGHT; $_l_TitleColour; $_l_Turquoise; $_l_TurquoiseLIGHT; $_l_WIne; $_l_WIneLIGHT; $1; INT_l_GreySheen)
	C_LONGINT:C283(INT_l_OSXGrey; INT_l_OutputColor; INT_l_PlainGrey; INT_l_PlainWhite)
	C_POINTER:C301($3; $4)
	C_REAL:C285($0)
	C_TEXT:C284($_t_ColorName; $_t_OldMethodName; $2; $sSizeObject)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("LB_GetFormcolour")


//see definitions also in INT_SetOutput

$_l_Blue:=223
$_l_BlueLIGHT:=209

$_l_Turquoise:=205
$_l_TurquoiseLIGHT:=193

$_l_Green:=190
$_l_GreenLIGHT:=177

$_l_Brown:=13
$_l_BrownLIGHT:=160

$_l_Purple:=239
$_l_PurpleLIGHT:=224

$_l_WIne:=142
$_l_WIneLIGHT:=128

$_l_Orange:=153
$_l_OrangeLIGHT:=144

$_l_Steel:=11
$_l_SteelLIGHT:=241

$_t_ColorName:="Blue"  //default

Case of 
	: ($1=Table:C252(->[INFORMATION:55]))
		
	: ($1=Table:C252(->[CONTACTS:1]))
		
	: ($1=Table:C252(->[COMPANIES:2]))
		
		
		
	: ($1=Table:C252(->[JOB_TYPES:65]))
		$_t_ColorName:="Green"
		
	: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
		
	: ($1=Table:C252(->[X_URL_LInks:101]))
		
	: ($1=Table:C252(->[CONTRACT_TYPES:19]))
		$_t_ColorName:="Brown"
		
	: ($1=Table:C252(->[CONTRACTS:17]))
		$_t_ColorName:="Brown"
		
	: ($1=Table:C252(->[DOCUMENTS:7]))
		$_t_ColorName:="Brown"
		If (Count parameters:C259<3)
		Else 
			//If ($3->="Reports")
			//$_t_ColorName:="Steel"
			//End if
		End if 
		
	: ($1=Table:C252(->[COUNTRIES:73]))
		
	: ($1=Table:C252(->[CREDIT_STAGES:54]))
		$_t_ColorName:="Green"
		
	: ($1=Table:C252(->[CURRENCIES:71]))
		$_t_ColorName:="Turquoise"
		
	: ($1=Table:C252(->[CURRENCY_RATES:72]))
		$_t_ColorName:="Turquoise"
		
	: ($1=Table:C252(->[CURRENT_STOCK:62]))
		$_t_ColorName:="Purple"
		
	: ($1=Table:C252(->[DIARY:12]))
		If (Count parameters:C259>=3)
			//RESOLVE POINTER($3;$_t_VariableName;$_l_TableNumber;$_l_FieldNumber)
			//If ($_t_VariableName#"VordTItle")
			//  `$_t_ColorName:="Orange"
			//Else
			$_t_ColorName:="Brown"
			//End if
		Else 
			//$_t_ColorName:="Orange
		End if 
		
		
	: ($1=Table:C252(->[TYPES:5]))
		
	: ($1=Table:C252(->[TRANSACTIONS:29]))
		$_t_ColorName:="Turquoise"
		
	: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
		$_t_ColorName:="Turquoise"
		
	: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
		$_t_ColorName:="Turquoise"
		
	: ($1=Table:C252(->[TERMINOLOGY:75]))
		
	: ($1=Table:C252(->[TAX_CODES:35]))
		$_t_ColorName:="Turquoise"
		
	: ($1=Table:C252(->[STOCK_TYPES:59]))
		$_t_ColorName:="Purple"
		
	: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
		$_t_ColorName:="Purple"
		
	: ($1=Table:C252(->[STOCK_LEVELS:58]))
		$_t_ColorName:="Purple"
		
	: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		$_t_ColorName:="Purple"
		
	: ($1=Table:C252(->[STATUS:4]))
		
	: ($1=Table:C252(->[STAGES:45]))
		$_t_ColorName:="Green"
		
	: ($1=Table:C252(->[SOURCES:6]))
		
	: ($1=Table:C252(->[SOLUTIONS:23]))
		$_t_ColorName:="Brown"
		
	: ($1=Table:C252(->[SMS_Log:124]))
		
	: ($1=Table:C252(->[SERVICE_CALLS:20]))
		$_t_ColorName:="Brown"
		
	: ($1=Table:C252(->[ROLES:87]))
		
	: ($1=Table:C252(->[RESULTS:14]))
		//$_t_ColorName:="Orange"
		
	: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
		$_t_ColorName:="Turquoise"
		
	: ($1=Table:C252(->[PURCHASE_INVOICES:37])) | ($1=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
		$_t_ColorName:="Wine"
		
	: ($1=Table:C252(->[PURCHASE_ORDERS:57])) | ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
		$_t_ColorName:="Wine"
		
	: ($1=Table:C252(->[PUBLICATIONS:52]))
		
	: ($1=Table:C252(->[PROJECTS:89]))
		$_t_ColorName:="Green"
		
	: ($1=Table:C252(->[PRODUCTS:9]))
		
	: ($1=Table:C252(->[PROBLEMS:22]))
		$_t_ColorName:="Brown"
		
	: ($1=Table:C252(->[PRICE_TABLE:28]))
		
	: ($1=Table:C252(->[PRICE_GROUPS:18]))
		
	: ($1=Table:C252(->[POSTAL_CODES:50]))
		
	: ($1=Table:C252(->[PICTURES:85]))
		
	: ($1=Table:C252(->[PERSONNEL:11]))
		
	: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
		
	: ($1=Table:C252(->[PERIODS:33]))
		$_t_ColorName:="Turquoise"
		
	: ($1=Table:C252(->[ORDERS:24]))
		$_t_ColorName:="Green"
		
	: ($1=Table:C252(->[ORDER_ITEMS:25]))
		$_t_ColorName:="Green"
		
	: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
		$_t_ColorName:="Purple"
		
	: ($1=Table:C252(->[MAILSORT_MAIL:83]))
		
	: ($1=Table:C252(->[SCRIPTS:80]))
		
	: ($1=Table:C252(->[LOCATIONS:61]))
		$_t_ColorName:="Purple"
		
	: ($1=Table:C252(->[LIST_LAYOUTS:96]))
		$_t_ColorName:="Steel"
		
	: ($1=Table:C252(->[LAYERS:76]))
		$_t_ColorName:="Turquoise"
		
	: ($1=Table:C252(->[JOBS:26]))
		$_t_ColorName:="Green"
		
	: ($1=Table:C252(->[JOBS:26]))
		$_t_ColorName:="Green"
		
	: ($1=Table:C252(->[JOB_STAGES:47]))
		$_t_ColorName:="Green"
		
	: ($1=Table:C252(->[JOB PERSONNEL:48]))
		$_t_ColorName:="Green"
		
	: ($1=Table:C252(->[INVOICES:39])) | ($1=Table:C252(->[INVOICES_ITEMS:161]))
		$_t_ColorName:="Green"
		
	: ($1=Table:C252(->[HEADINGS:84]))
		$_t_ColorName:="Turquoise"
		
	: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
		
	: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
		$_t_ColorName:="Steel"
		
	: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		
	: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
		$_t_ColorName:="Steel"
		
		
		
	: ($1=Table:C252(->[AREAS:3]))
		
		
	: ($1=Table:C252(->[ANALYSES:36]))
		$_t_ColorName:="Turquoise"
		
	: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
		
	: ($1=Table:C252(->[ACTIONS:13]))
		//$_t_ColorName:="Orange"
		
	: ($1=Table:C252(->[ACCOUNTS:32]))
		$_t_ColorName:="Turquoise"
		
	: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
		$_t_ColorName:="Turquoise"
		
	: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
		//$_t_ColorName:="Orange"
		
	: ($1=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
		$_t_ColorName:="Green"
		
	: ($1=Table:C252(->[WEB_ACCESS:130]))
	: ($1=Table:C252(->[xCreditCardDetails:132]))
		
End case 

Case of 
	: ($_t_ColorName="Blue")
		$_l_InputColor:=$_l_Blue
		
	: ($_t_ColorName="Green")
		$_l_InputColor:=$_l_Green
		
	: ($_t_ColorName="Brown")
		$_l_InputColor:=$_l_Brown
		
	: ($_t_ColorName="Steel")
		$_l_InputColor:=$_l_Steel
		
	: ($_t_ColorName="Turquoise")
		$_l_InputColor:=$_l_Turquoise
		
	: ($_t_ColorName="Purple")
		$_l_InputColor:=$_l_Purple
		
	: ($_t_ColorName="Wine")
		$_l_InputColor:=$_l_WIne
		
	: ($_t_ColorName="Orange")
		$_l_InputColor:=$_l_Orange
		
End case 
$_l_SkinsID:=INT_SkinsPrefs
Case of 
	: (INT_l_PlainWhite=1) | ($_l_SkinsID=3)
		
		$0:=1
		$_l_BackGroundColor:=0
	: (INT_l_PlainGrey=1) | ($_l_SkinsID=4)
		
		
		$0:=2
		$_l_BackGroundColor:=12
	: (INT_l_OSXGrey=1) | ($_l_SkinsID=5)
		
		$_l_BackGroundColor:=12
		$0:=0
		
	: (INT_l_GreySheen=1) | ($_l_SkinsID=2)
		
		$_l_BackGroundColor:=12
		$0:=3
		
	Else 
		$_l_BackGroundColor:=12
		$0:=4
		
End case 
Case of 
	: ($_t_ColorName="Blue")
		$_l_InputColor:=-(0+(256*$_l_Blue))
		
	: ($_t_ColorName="Green")
		$_l_InputColor:=-(0+(256*$_l_Green))
		
	: ($_t_ColorName="Brown")
		$_l_InputColor:=-(0+(256*$_l_Brown))
		
	: ($_t_ColorName="Steel")
		$_l_InputColor:=-(0+(256*$_l_Steel))
		
	: ($_t_ColorName="Turquoise")
		$_l_InputColor:=-($_l_BackGroundColor+(256*$_l_Turquoise))
		
	: ($_t_ColorName="Purple")
		$_l_InputColor:=-($_l_BackGroundColor+(256*$_l_Purple))
		
	: ($_t_ColorName="Wine")
		$_l_InputColor:=-($_l_BackGroundColor+(256*$_l_WIne))
		
	: ($_t_ColorName="Orange")
		$_l_InputColor:=-($_l_BackGroundColor+(256*$_l_Orange))
		
End case 




$3->:=$_l_InputColor
$4->:=$_t_ColorName
ERR_MethodTrackerReturn("LB_GetFormcolour"; $_t_OldMethodName)
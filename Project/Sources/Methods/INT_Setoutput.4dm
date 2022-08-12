//%attributes = {}
If (False:C215)
	//Project Method Name:      INT_Setoutput
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 11:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Get; INT_bo_SkinsPrefsLoaded)
	C_LONGINT:C283($_l_BackGroundColor; $_l_BackGroundColour; $_l_Blue; $_l_BlueLight; $_l_Brown; $_l_BrownLight; $_l_FieldNumber; $_l_ForegroundColor; $_l_ForegroundColour; $_l_FormDefaultHeight; $_l_FormDefaultWidth)
	C_LONGINT:C283($_l_Green; $_l_GreenLight; $_l_Orange; $_l_OrangeLight; $_l_Purple; $_l_PurpleLight; $_l_Steel; $_l_SteelLight; $_l_TableNumber; $_l_TitleColour; $_l_Turquoise)
	C_LONGINT:C283($_l_TurquoiseLight; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $_l_Wine; $_l_WineLight; $_t_WidthAddition; $_t_WindowRight2; $1; $4)
	C_LONGINT:C283(INT_l_GreySheen; INT_l_OSXGrey; INT_l_OutputColor; INT_l_PlainGrey; INT_l_PlainWhite; vNo)
	C_PICTURE:C286(INT_p_OutButtons; INT_p_OutStrip)
	C_POINTER:C301($3)
	C_TEXT:C284($_t_BackGroundColour; $_t_BackGroundColour2; $_t_ColourName; $_t_ForegroundColour; $_t_oldMethodName; $_t_PlatformVersion; $_t_SizingObject; $_t_VariableName; $2; CUR_CompanyTypes; INT_T_OutputTitle)
	C_TEXT:C284(Vtitle; VtitleR; WIN_CURRENTOUTPUTFORMSET)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("INT_Setoutput")

//INT_Setoutput

//Rollo 8/7/2004
//introduced light colour vars & code to set
//added compiler directives
//made much easier to maintain
//spelling error in $_l_Turquoise fixed
//spelling error fixed CATAGORIES!
//added OutButtons picture and setting code
//falsed out Windows backround setting
//added OutStrip picture and setting code
//added OutSheen picture and setting code - NO - didn't work
//added OutSheen object - pictures pasted in - and made visible or not
//added code to right-justify vNo
//added $4 - optional pixel position of the Footer, used to stretch the sheen for deep forms
//made it only move things if they need it!



//see definitions also in INT_SetInput

$_l_Blue:=223
$_l_BlueLight:=209

$_l_Turquoise:=205
$_l_TurquoiseLight:=193

$_l_Green:=190
$_l_GreenLight:=177

$_l_Brown:=13
$_l_BrownLight:=160

$_l_Purple:=239
$_l_PurpleLight:=224

$_l_Wine:=142
$_l_WineLight:=128

$_l_Orange:=153
$_l_OrangeLight:=144

$_l_Steel:=11
$_l_SteelLight:=241

$_t_ColourName:="Blue"  //default

Case of 
	: ($1=Table:C252(->[INFORMATION:55]))
		INT_T_OutputTitle:="INFORMATION"
		
	: ($1=Table:C252(->[CONTACTS:1]))
		INT_T_OutputTitle:="CONTACTS"
		
	: ($1=Table:C252(->[COMPANIES:2]))
		If (CUR_CompanyTypes#"")
			INT_T_OutputTitle:=CUR_CompanyTypes
		Else 
			INT_T_OutputTitle:="COMPANIES"
		End if 
		
		
	: ($1=Table:C252(->[JOB_TYPES:65]))
		$_t_ColourName:="Green"
		INT_T_OutputTitle:="JOB TYPES"
		
	: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
		INT_T_OutputTitle:="PRODUCT BRANDS"
		
	: ($1=Table:C252(->[X_URL_LInks:101]))
		INT_T_OutputTitle:="CARD PREFIX RANGES"
		
	: ($1=Table:C252(->[CONTRACT_TYPES:19]))
		$_t_ColourName:="Brown"
		INT_T_OutputTitle:="CONTRACT TYPES"
		
	: ($1=Table:C252(->[CONTRACTS:17]))
		$_t_ColourName:="Brown"
		INT_T_OutputTitle:="CONTRACTS"
		
	: ($1=Table:C252(->[DOCUMENTS:7]))
		$_t_ColourName:="Brown"
		If (Count parameters:C259<3)
			INT_T_OutputTitle:="DOCUMENTS"
		Else 
			If ($3->="Reports")
				$_t_ColourName:="Steel"
				INT_T_OutputTitle:="REPORTS"
			Else 
				INT_T_OutputTitle:=$3->
				If (INT_T_OutputTitle="")
					INT_T_OutputTitle:="REPORTS"
				End if 
			End if 
		End if 
		
	: ($1=Table:C252(->[COUNTRIES:73]))
		INT_T_OutputTitle:="COUNTRIES"
		
	: ($1=Table:C252(->[CREDIT_STAGES:54]))
		$_t_ColourName:="Green"
		INT_T_OutputTitle:="CREDIT STAGES"
		
	: ($1=Table:C252(->[CURRENCIES:71]))
		$_t_ColourName:="Turquoise"
		INT_T_OutputTitle:="CURRENCIES"
		
	: ($1=Table:C252(->[CURRENCY_RATES:72]))
		$_t_ColourName:="Turquoise"
		INT_T_OutputTitle:="CURRENCY RATES"
		
	: ($1=Table:C252(->[CURRENT_STOCK:62]))
		$_t_ColourName:="Purple"
		INT_T_OutputTitle:=Vtitle
		
	: ($1=Table:C252(->[DIARY:12]))
		If (Count parameters:C259>=3)
			RESOLVE POINTER:C394($3; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			Case of 
				: ($_t_VariableName="VordTItle")
					$_t_ColourName:="Brown"
				: ($_t_VariableName="vTimesTitle")
					$_t_ColourName:="Green"
				Else 
					//$_t_ColourName:="Orange"
			End case 
		Else 
			//$_t_ColourName:="Orange"
		End if 
		
		
		
	: ($1=Table:C252(->[TYPES:5]))
		INT_T_OutputTitle:="TYPES"
		
	: ($1=Table:C252(->[TRANSACTIONS:29]))
		$_t_ColourName:="Turquoise"
		If (Count parameters:C259<3)
			INT_T_OutputTitle:="TRANSACTIONS"
		Else 
			INT_T_OutputTitle:=$3->
			If (INT_T_OutputTitle="")
				INT_T_OutputTitle:="TRANSACTIONS"
			End if 
		End if 
		
	: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
		$_t_ColourName:="Turquoise"
		INT_T_OutputTitle:="TRANSACTION TYPES"
		
	: ($1=Table:C252(->[TRANSACTION_BATCHES:30])) | ($1=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
		$_t_ColourName:="Turquoise"
		If ($1=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
			INT_T_OutputTitle:="TRANSACTION BATCH ITEMS"
		Else 
			
			INT_T_OutputTitle:="TRANSACTION BATCHES"
		End if 
		
	: ($1=Table:C252(->[TERMINOLOGY:75]))
		INT_T_OutputTitle:="TERMINOLOGY"
		
	: ($1=Table:C252(->[TAX_CODES:35]))
		$_t_ColourName:="Turquoise"
		INT_T_OutputTitle:="TAX CODES"
		
	: ($1=Table:C252(->[STOCK_TYPES:59]))
		$_t_ColourName:="Purple"
		INT_T_OutputTitle:=VtitleR
		
	: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
		$_t_ColourName:="Purple"
		INT_T_OutputTitle:=VtitleR
		
	: ($1=Table:C252(->[STOCK_LEVELS:58]))
		$_t_ColourName:="Purple"
		INT_T_OutputTitle:=Vtitle
		
	: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		$_t_ColourName:="Purple"
		INT_T_OutputTitle:=VtitleR
		
	: ($1=Table:C252(->[STATUS:4]))
		INT_T_OutputTitle:="STATUS"
		
	: ($1=Table:C252(->[STAGES:45]))
		$_t_ColourName:="Green"
		INT_T_OutputTitle:="JOB STAGES"
		
	: ($1=Table:C252(->[SOURCES:6]))
		INT_T_OutputTitle:="SOURCES"
		
	: ($1=Table:C252(->[SOLUTIONS:23]))
		$_t_ColourName:="Brown"
		INT_T_OutputTitle:="SOLUTIONS"
		
	: ($1=Table:C252(->[SMS_Log:124]))
		INT_T_OutputTitle:="SMS LOG"
		
	: ($1=Table:C252(->[SERVICE_CALLS:20]))
		$_t_ColourName:="Brown"
		If (Count parameters:C259<3)
			INT_T_OutputTitle:="SERVICE CALLS"
		Else 
			INT_T_OutputTitle:=$3->
			If (INT_T_OutputTitle="")
				INT_T_OutputTitle:="SERVICE CALLS"
			End if 
		End if 
		
	: ($1=Table:C252(->[ROLES:87]))
		INT_T_OutputTitle:="ROLES"
		
	: ($1=Table:C252(->[RESULTS:14]))
		//$_t_ColourName:="Orange"
		INT_T_OutputTitle:="RESULTS"
		
	: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
		$_t_ColourName:="Turquoise"
		INT_T_OutputTitle:="RECURRING JOURNALS"
		
	: ($1=Table:C252(->[PURCHASE_INVOICES:37])) | ($1=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
		$_t_ColourName:="Wine"
		If (Count parameters:C259<3)
			If ($1=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				INT_T_OutputTitle:="PURCHASE ITEMS"
			Else 
				
				INT_T_OutputTitle:="PURCHASES"
			End if 
		Else 
			INT_T_OutputTitle:=$3->
		End if 
		
	: ($1=Table:C252(->[PURCHASE_ORDERS:57])) | ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
		$_t_ColourName:="Wine"
		If (Count parameters:C259<3)
			If ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				INT_T_OutputTitle:="PURCHASE ORDER ITEMS"
			Else 
				
				INT_T_OutputTitle:="PURCHASE ORDERS"
			End if 
		Else 
			INT_T_OutputTitle:=$3->
			If (INT_T_OutputTitle="")
				If ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
					INT_T_OutputTitle:="PURCHASE ORDER ITEMS"
				Else 
					
					INT_T_OutputTitle:="PURCHASE ORDERS"
				End if 
			End if 
		End if 
		
	: ($1=Table:C252(->[PUBLICATIONS:52]))
		INT_T_OutputTitle:="ROLES"
		
	: ($1=Table:C252(->[PROJECTS:89]))
		$_t_ColourName:="Green"
		INT_T_OutputTitle:="PROJECTS"
		
	: ($1=Table:C252(->[PRODUCTS:9]))
		INT_T_OutputTitle:="PRODUCTS"
		
	: ($1=Table:C252(->[PROBLEMS:22]))
		$_t_ColourName:="Brown"
		INT_T_OutputTitle:="PROBLEMS"
		
	: ($1=Table:C252(->[PRICE_TABLE:28]))
		INT_T_OutputTitle:="PRICE TABLE"
		
	: ($1=Table:C252(->[PRICE_GROUPS:18]))
		INT_T_OutputTitle:="PRICE GROUPS"
		
	: ($1=Table:C252(->[POSTAL_CODES:50]))
		If (Count parameters:C259>=3)
			INT_T_OutputTitle:=$3->
		Else 
			INT_T_OutputTitle:="POST CODES"
		End if 
		
	: ($1=Table:C252(->[PICTURES:85]))
		INT_T_OutputTitle:="PICTURES"
		
	: ($1=Table:C252(->[PERSONNEL:11]))
		INT_T_OutputTitle:="PERSONNEL & RESOURCES"
		
	: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
		INT_T_OutputTitle:="PERSONNEL GROUPS"
		
	: ($1=Table:C252(->[PERIODS:33]))
		$_t_ColourName:="Turquoise"
		
		INT_T_OutputTitle:="PERIODS"
		
	: ($1=Table:C252(->[ORDERS:24]))
		$_t_ColourName:="Green"
		If (Count parameters:C259>=3)
			INT_T_OutputTitle:=$3->
			If (INT_T_OutputTitle="")
				INT_T_OutputTitle:="ORDERS"
			End if 
		Else 
			INT_T_OutputTitle:="ORDERS"
		End if 
		
	: ($1=Table:C252(->[ORDER_ITEMS:25]))
		$_t_ColourName:="Green"
		INT_T_OutputTitle:="ORDER ITEMS"
		
	: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
		$_t_ColourName:="Purple"
		INT_T_OutputTitle:="MOVEMENT TYPES"
		
End case 

Case of 
		
	: ($1=Table:C252(->[MAILSORT_MAIL:83]))
		INT_T_OutputTitle:="MAILSORT MAIL"
		
	: ($1=Table:C252(->[SCRIPTS:80]))
		INT_T_OutputTitle:="MACROS"
		
	: ($1=Table:C252(->[LOCATIONS:61]))
		$_t_ColourName:="Purple"
		If (Count parameters:C259>=3)
			INT_T_OutputTitle:=$3->
			If (INT_T_OutputTitle="")
				INT_T_OutputTitle:="LOCATIONS"
			End if 
		Else 
			INT_T_OutputTitle:="LOCATIONS"
		End if 
		
	: ($1=Table:C252(->[LIST_LAYOUTS:96]))
		$_t_ColourName:="Steel"
		INT_T_OutputTitle:="LISTING LAYOUT DEFINITIONS"
		
	: ($1=Table:C252(->[LAYERS:76]))
		$_t_ColourName:="Turquoise"
		INT_T_OutputTitle:="LAYERS"
		
	: ($1=Table:C252(->[JOBS:26]))
		$_t_ColourName:="Green"
		INT_T_OutputTitle:="JOBS"
		
	: ($1=Table:C252(->[JOB_TYPES:65]))
		$_t_ColourName:="Green"
		INT_T_OutputTitle:="JOB & ORDER TYPES"
		
	: ($1=Table:C252(->[JOB_STAGES:47]))
		$_t_ColourName:="Green"
		INT_T_OutputTitle:="JOB STAGES"
		
	: ($1=Table:C252(->[JOB PERSONNEL:48]))
		$_t_ColourName:="Green"
		INT_T_OutputTitle:="JOB PERSONNEL"
		
	: ($1=Table:C252(->[INVOICES:39])) | ($1=Table:C252(->[INVOICES_ITEMS:161]))
		$_t_ColourName:="Green"
		If (Count parameters:C259>=3)
			INT_T_OutputTitle:=$3->
			If (INT_T_OutputTitle="")
				If ($1=Table:C252(->[INVOICES_ITEMS:161]))
					INT_T_OutputTitle:="INVOICE ITEMS"
				Else 
					INT_T_OutputTitle:="INVOICES"
				End if 
			End if 
		Else 
			If ($1=Table:C252(->[INVOICES_ITEMS:161]))
				INT_T_OutputTitle:="INVOICE ITEMS"
			Else 
				INT_T_OutputTitle:="INVOICES"
			End if 
		End if 
		
	: ($1=Table:C252(->[HEADINGS:84]))
		$_t_ColourName:="Turquoise"
		INT_T_OutputTitle:="ACCOUNTS REPORT HEADINGS"
		
	: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
		INT_T_OutputTitle:="PRODUCT GROUPS"
		
	: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
		$_t_ColourName:="Steel"
		INT_T_OutputTitle:="FURTHER FIELDS"
		
	: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		INT_T_OutputTitle:="FURTHER ANALYSES"
		
	: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
		$_t_ColourName:="Steel"
		INT_T_OutputTitle:="FURTHER FIELD DEFINITIONS"
		
		
		
		
		
	: ($1=Table:C252(->[AREAS:3]))
		INT_T_OutputTitle:="AREAS"
		
	: ($1=Table:C252(->[ANALYSES:36]))
		$_t_ColourName:="Turquoise"
		INT_T_OutputTitle:="ANALYSES"
		
	: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
		INT_T_OutputTitle:="ADDRESS FORMATS"
		
	: ($1=Table:C252(->[ACTIONS:13]))
		//$_t_ColourName:="Orange"
		INT_T_OutputTitle:="ACTIONS"
		
	: ($1=Table:C252(->[ACCOUNTS:32]))
		$_t_ColourName:="Turquoise"
		If (Count parameters:C259<3)
			INT_T_OutputTitle:="ACCOUNTS"
		Else 
			INT_T_OutputTitle:=$3->
			If (INT_T_OutputTitle="")
				INT_T_OutputTitle:="ACCOUNTS"
			End if 
		End if 
		
	: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
		$_t_ColourName:="Turquoise"
		If (Count parameters:C259<3)
			INT_T_OutputTitle:="ACCOUNT BALANCES"
		Else 
			INT_T_OutputTitle:=$3->
			If (INT_T_OutputTitle="")
				INT_T_OutputTitle:="ACCOUNT BALANCES"
			End if 
		End if 
		
	: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
		//$_t_ColourName:="Orange"
		INT_T_OutputTitle:="SEQUENCES"
		
	: ($1=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
		$_t_ColourName:="Green"
		INT_T_OutputTitle:="CATEGORIES"
		
	: ($1=Table:C252(->[WEB_ACCESS:130]))
		INT_T_OutputTitle:="WEB ACCESS"
		
End case 
$_l_ForegroundColor:=0
Case of 
	: ($_t_ColourName="Blue")
		INT_l_OutputColor:=(0+(256*$_l_Blue))
		$_l_BackGroundColor:=$_l_Blue
		$_l_TitleColour:=$_l_BlueLight
	: ($_t_ColourName="Green")
		INT_l_OutputColor:=(0+(256*$_l_Green))
		$_l_TitleColour:=$_l_GreenLight
		$_l_BackGroundColor:=$_l_Green
	: ($_t_ColourName="Brown")
		INT_l_OutputColor:=(0+(256*$_l_Brown))
		$_l_TitleColour:=$_l_BrownLight
		$_l_BackGroundColor:=$_l_Brown
	: ($_t_ColourName="Steel")
		INT_l_OutputColor:=(0+(256*$_l_Steel))
		$_l_TitleColour:=$_l_SteelLight
		$_l_BackGroundColor:=$_l_Steel
	: ($_t_ColourName="Turquoise")
		INT_l_OutputColor:=(0+(256*$_l_Turquoise))
		$_l_TitleColour:=$_l_TurquoiseLight
		$_l_BackGroundColor:=$_l_Turquoise
	: ($_t_ColourName="Purple")
		INT_l_OutputColor:=(0+(256*$_l_Purple))
		$_l_TitleColour:=$_l_PurpleLight
		$_l_BackGroundColor:=$_l_Purple
	: ($_t_ColourName="Wine")
		INT_l_OutputColor:=(0+(256*$_l_Wine))
		$_l_TitleColour:=$_l_WineLight
		$_l_BackGroundColor:=$_l_Wine
	: ($_t_ColourName="Orange")
		INT_l_OutputColor:=(0+(256*$_l_Orange))
		$_l_TitleColour:=$_l_OrangeLight
		$_l_BackGroundColor:=$_l_Orange
End case 
If (Not:C34(Undefined:C82($2)))
	If ($2#"")
		If (WIN_CurrentOutputformSet=$2)  //used to store name of form the output image settings were last loaded for
			$_bo_Get:=False:C215
		Else 
			WIN_CurrentOutputformSet:=$2
			$_bo_Get:=True:C214
		End if 
	Else 
		$_bo_Get:=True:C214
	End if 
Else 
	$_bo_Get:=False:C215
End if 

If ($_bo_Get)
	//_O_OBJECT SET COLOR(*;"oStrapHeader";-INT_l_OutputColor)
	$_t_ForegroundColour:=UTIL_4DColorToRGB($_l_ForegroundColour)
	$_t_BackGroundColour:=UTIL_4DColorToRGB($_l_BackGroundColour)
	
	OBJECT SET RGB COLORS:C628(INT_T_OutputTitle; $_t_ForegroundColour; $_t_BackGroundColour)
	OBJECT SET RGB COLORS:C628(vNo; $_t_ForegroundColour; $_t_BackGroundColour)
	
	//_O_OBJECT SET COLOR(INT_T_OutputTitle;-$_l_TitleColour)
	//_O_OBJECT SET COLOR(vNo;-$_l_TitleColour)
	
	//GET PICTURE FROM LIBRARY("OutButtons"+$_t_ColourName; INT_p_OutButtons)
	INT_p_OutButtons:=Get_Picture("OutButtons"+$_t_ColourName)
	
	//GET PICTURE FROM LIBRARY("OutStrip"+$_t_ColourName; INT_p_OutStrip)
	INT_p_OutStrip:=Get_Picture("OutStrip"+$_t_ColourName)
	
	//Get Picture FROM LIBRARY("OutSheen"+$_t_ColourName;INT_p_OutSheen)
	
End if 

OBJECT SET VISIBLE:C603(*; "oOutSheenBlue"; False:C215)
OBJECT SET VISIBLE:C603(*; "oOutSheenGreen"; False:C215)
OBJECT SET VISIBLE:C603(*; "oOutSheenWine"; False:C215)
OBJECT SET VISIBLE:C603(*; "oOutSheenBrown"; False:C215)
OBJECT SET VISIBLE:C603(*; "oOutSheenSteel"; False:C215)
OBJECT SET VISIBLE:C603(*; "oOutSheenTurquoise"; False:C215)
OBJECT SET VISIBLE:C603(*; "oOutSheenPurple"; False:C215)
OBJECT SET VISIBLE:C603(*; "oOutSheenOrange"; False:C215)

If (INT_bo_SkinsPrefsLoaded=False:C215)
	INT_SkinsPrefs
End if 
$_l_ForegroundColour:=0
$_t_ForegroundColour:=UTIL_4DColorToRGB($_l_ForegroundColour)

Case of 
	: (INT_l_PlainWhite=1)
		//SET COLOR(*;"oBackground";1)
		$_t_SizingObject:="oBackground"
		//SET COLOR(*;"oWhiteness";1)
		
	: (INT_l_PlainGrey=1)
		
		$_t_BackGroundColour:=UTIL_4DColorToRGB($_l_BackGroundColour)
		$_t_BackGroundColour2:=UTIL_4DColorToRGB($_l_BackGroundColour-10)
		
		//_O_OBJECT SET COLOR(*;"oBackground";-(256*241))
		$_t_SizingObject:="oBackground"
		//_O_OBJECT SET COLOR(*;"oWhiteness";-(256*241))
		OBJECT SET RGB COLORS:C628(*; "oBackground"; $_t_ForegroundColour; $_t_BackGroundColour)
		OBJECT SET RGB COLORS:C628(*; "oWhiteness"; $_t_BackgroundColour; $_t_BackgroundColour)
		
	: (INT_l_OSXGrey=1)
		OBJECT SET VISIBLE:C603(*; "oBackground"; False:C215)
		$_t_SizingObject:="oBackground"
		OBJECT SET VISIBLE:C603(*; "oWhiteness"; False:C215)
		
	: (INT_l_GreySheen=1)
		OBJECT SET VISIBLE:C603(*; "oBackground"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oOutSheenSteel"; True:C214)
		$_t_ColourName:="Steel"
		$_t_SizingObject:="oOutSheenSteel"
		
	Else 
		OBJECT SET VISIBLE:C603(*; "oBackground"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oOutSheen"+$_t_ColourName; True:C214)
		$_t_SizingObject:="oOutSheen"+$_t_ColourName
		
End case 
If (Not:C34(Undefined:C82($2)))
	If ($2#"")
		
		$_t_WidthAddition:=10
		
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_FormDefaultWidth:=$_l_WindowRight-$_l_WindowLeft
		OBJECT GET COORDINATES:C663(vNo; $_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		If ($_l_WindowLeft#($_l_FormDefaultWidth-170))  //only move if needs it
			OBJECT MOVE:C664(vNo; $_l_FormDefaultWidth-130; $_l_WindowTop; $_l_FormDefaultWidth-40; $_l_WindowTop+16; *)
		End if 
		
		FORM GET PROPERTIES:C674(Table:C252($1)->; $2; $_l_FormDefaultWidth; $_l_FormDefaultHeight)
		
		OBJECT GET COORDINATES:C663(*; "oStrapHeader"; $_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		If ($_l_WindowRight#($_l_FormDefaultWidth+$_t_WidthAddition))  //only move if needs it
			OBJECT SET COORDINATES:C1248(*; "oStrapHeader@"; $_l_WindowLeft; $_l_WindowTop; $_l_FormDefaultWidth+$_t_WidthAddition; $_l_WindowBottom)
		End if 
		
		OBJECT GET COORDINATES:C663(*; "oOutStrip"; $_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		If ($_l_WindowRight#($_l_FormDefaultWidth+$_t_WidthAddition))  //only move if needs it
			OBJECT MOVE:C664(*; "oOutStrip"; $_l_WindowLeft; $_l_WindowTop; $_l_FormDefaultWidth+$_t_WidthAddition; $_l_WindowBottom; *)
		End if 
		
		//GET OBJECT RECT(*;"INT_p_OutSheen";$_l_WindowLeft;$_l_WindowTop;$_l_WindowRight;$_l_WindowBottom)
		//MOVE OBJECT(*;"INT_p_OutSheen";$_l_WindowLeft;$_l_WindowTop;$_l_FormDefaultWidth+$_t_WidthAddition;$_l_WindowBottom;*)
		
		OBJECT GET COORDINATES:C663(*; "oOutSheen"+$_t_ColourName; $_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		If (Count parameters:C259>3)
			If ($4>0)
				If (($_l_WindowRight#($_l_FormDefaultWidth+$_t_WidthAddition)) | ($_l_WindowBottom#$4))  //only move if needs it
					OBJECT MOVE:C664(*; "oOutSheen"+$_t_ColourName; $_l_WindowLeft; $_l_WindowTop; $_l_FormDefaultWidth+$_t_WidthAddition; $4; *)
				End if 
			Else 
				If ($_l_WindowRight#($_l_FormDefaultWidth+$_t_WidthAddition))  //only move if needs it
					OBJECT MOVE:C664(*; "oOutSheen"+$_t_ColourName; $_l_WindowLeft; $_l_WindowTop; $_l_FormDefaultWidth+$_t_WidthAddition; $_l_WindowBottom; *)
				End if 
			End if 
		Else 
			If ($_l_WindowRight#($_l_FormDefaultWidth+$_t_WidthAddition))  //only move if needs it
				OBJECT MOVE:C664(*; "oOutSheen"+$_t_ColourName; $_l_WindowLeft; $_l_WindowTop; $_l_FormDefaultWidth+$_t_WidthAddition; $_l_WindowBottom; *)
			End if 
		End if 
		
		If (False:C215)
			$_t_PlatformVersion:=DBGetOSVersion
			If (Position:C15("Windows™ 2000"; $_t_PlatformVersion)>0)
				//with no background this
				OBJECT GET COORDINATES:C663(*; "oWin2KBackground"; $_l_WindowLeft; $_l_WindowTop; $_t_WindowRight2; $_l_WindowBottom)
				OBJECT MOVE:C664(*; "oWin2KBackground"; $_l_WindowLeft; $_l_WindowTop; $_l_FormDefaultWidth; $_l_WindowBottom+2000; *)
			Else 
				//we could do things here to set the colour if we wanted
				OBJECT SET VISIBLE:C603(*; "oWin2KBackground"; False:C215)
				
			End if 
		End if 
		
	End if 
End if 
Out_Buttons



//End if
ERR_MethodTrackerReturn("INT_Setoutput"; $_t_oldMethodName)

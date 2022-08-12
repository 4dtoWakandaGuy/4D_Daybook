//%attributes = {}
If (False:C215)
	//Project Method Name:      INT_SetInput
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/02/2010 12:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Get; $_bo_Resibable; $_bo_Visible; INT_bo_SkinsPrefsLoaded)
	C_LONGINT:C283($_l_BackBottom; $_l_BackgroundColour; $_l_BackLeft; $_l_BackRight; $_l_BackTop; $_l_Blue; $_l_BlueLIGHT; $_l_Bottom; $_l_Brown; $_l_BrownLIGHT; $_l_ButtonBottom)
	C_LONGINT:C283($_l_ButtonLeft; $_l_ButtonRIght; $_l_BUttonTop; $_l_FieldNumber; $_l_FindLastButton; $_l_FirstButtonRight; $_l_FirstOffset; $_l_ForegroundColour; $_l_Gap; $_l_Green; $_l_GreenLIGHT)
	C_LONGINT:C283($_l_Height; $_l_InputColour; $_l_MaxWidth; $_l_MinWidth; $_l_NavbuttonsBottom; $_l_NextButtonRight; $_l_Orange; $_l_OrangeLIGHT; $_l_ParametersColour; $_l_Purple; $_l_PurpleLIGHT)
	C_LONGINT:C283($_l_Right; $_l_Steel; $_l_SteelLIGHT; $_l_StrapBottom; $_l_StrapLeft; $_l_StrapLength; $_l_StrapRight; $_l_StrapTop; $_l_StrapWidth; $_l_StripBottom; $_l_StripLeft)
	C_LONGINT:C283($_l_StripRight; $_l_StripTop; $_l_TableNumber; $_l_TitleColour; $_l_Turquoise; $_l_TurquoiseLIGHT; $_l_WIdth; $_l_WIdthAddition; $_l_WinBottom; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowTop; $_l_Wine; $_l_WineLIGHT; $_l_WinLeft; $_l_WinRight; $_l_WinTop; $1; INT_l_GreySheen; INT_l_OSXGrey; INT_l_OutputColor; INT_l_PlainGrey)
	C_LONGINT:C283(INT_l_PlainWhite)
	C_OBJECT:C1216($_obj_Form; $3)
	C_PICTURE:C286(INT_p_OutStrip)
	C_POINTER:C301($_ptr_Button3; $_ptr_CurrentFormTable)
	C_TEXT:C284($_t_BackGroundColour; $_t_ColourName; $_t_CurrentFormName; $_t_ForeGroundColour; $_t_objectName; $_t_oldMethodName; $_t_SizeObject; $_t_VariableName; $2; WIN_t_CurrentInputForm; WIN_t_FormSettingsLoaded)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INT_SetInput")


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

$_l_Wine:=142
$_l_WineLIGHT:=128

$_l_Orange:=153
$_l_OrangeLIGHT:=144

$_l_Steel:=11
$_l_SteelLIGHT:=241

$_t_ColourName:="Blue"  //default


Case of 
	: ($1=Table:C252(->[INFORMATION:55]))
		
	: ($1=Table:C252(->[CONTACTS:1]))
		
	: ($1=Table:C252(->[COMPANIES:2]))
		
		
		
	: ($1=Table:C252(->[JOB_TYPES:65]))
		$_t_ColourName:="Green"
		
	: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
		
	: ($1=Table:C252(->[X_URL_LInks:101]))
		
	: ($1=Table:C252(->[CONTRACT_TYPES:19]))
		$_t_ColourName:="Brown"
		
	: ($1=Table:C252(->[CONTRACTS:17]))
		$_t_ColourName:="Brown"
		
	: ($1=Table:C252(->[DOCUMENTS:7]))
		$_t_ColourName:="Brown"
		If (Count parameters:C259<3)
		Else 
			If ($3->="Reports")
				$_t_ColourName:="Steel"
			End if 
		End if 
		
	: ($1=Table:C252(->[COUNTRIES:73]))
		
	: ($1=Table:C252(->[CREDIT_STAGES:54]))
		$_t_ColourName:="Green"
		
	: ($1=Table:C252(->[CURRENCIES:71]))
		$_t_ColourName:="Turquoise"
		
	: ($1=Table:C252(->[CURRENCY_RATES:72]))
		$_t_ColourName:="Turquoise"
		
	: ($1=Table:C252(->[CURRENT_STOCK:62]))
		$_t_ColourName:="Purple"
	: ($1=Table:C252(->[SF_STOCK_SUMMARY:196]))
		$_t_ColourName:="Purple"
	: ($1=Table:C252(->[DIARY:12]))
		
		If (Count parameters:C259>=3)
			// POINTER($3; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			//Case of 
			//: ($_t_VariableName="VordTItle")
			//$_t_ColourName:="Brown"
			//: ($_t_VariableName="vTimesTitle")
			//$_t_ColourName:="Green"
			//Else 
			//$_t_ColourName:="Orange"
			//End case 
		Else 
			$_t_ColourName:="Orange"
		End if 
		
		
		
		
		
		
	: ($1=Table:C252(->[TYPES:5]))
		
	: ($1=Table:C252(->[TRANSACTIONS:29]))
		$_t_ColourName:="Turquoise"
		
	: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
		$_t_ColourName:="Turquoise"
		
	: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
		$_t_ColourName:="Turquoise"
		
	: ($1=Table:C252(->[TERMINOLOGY:75]))
		
	: ($1=Table:C252(->[TAX_CODES:35]))
		$_t_ColourName:="Turquoise"
		
	: ($1=Table:C252(->[STOCK_TYPES:59]))
		$_t_ColourName:="Purple"
		
	: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
		$_t_ColourName:="Purple"
	: ($1=Table:C252(->[SF_STOCKMOVEMENTS:193]))
		$_t_ColourName:="Purple"
		
	: ($1=Table:C252(->[STOCK_LEVELS:58]))
		$_t_ColourName:="Purple"
		
	: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		$_t_ColourName:="Purple"
	: ($1=Table:C252(->[SF_STOCKMOVEMENT_ITEMS:194]))
		$_t_ColourName:="Purple"
	: ($1=Table:C252(->[STATUS:4]))
		
	: ($1=Table:C252(->[STAGES:45]))
		$_t_ColourName:="Green"
		
	: ($1=Table:C252(->[SOURCES:6]))
		
	: ($1=Table:C252(->[SOLUTIONS:23]))
		$_t_ColourName:="Brown"
		
	: ($1=Table:C252(->[SMS_Log:124]))
		
	: ($1=Table:C252(->[SERVICE_CALLS:20]))
		$_t_ColourName:="Brown"
		
	: ($1=Table:C252(->[ROLES:87]))
		
	: ($1=Table:C252(->[RESULTS:14]))
		//$_t_ColourName:="Orange"
		
	: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
		$_t_ColourName:="Turquoise"
		
	: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
		$_t_ColourName:="Wine"
		
	: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
		$_t_ColourName:="Wine"
		
	: ($1=Table:C252(->[PUBLICATIONS:52]))
		
	: ($1=Table:C252(->[PROJECTS:89]))
		$_t_ColourName:="Green"
		
	: ($1=Table:C252(->[PRODUCTS:9]))
		
	: ($1=Table:C252(->[PROBLEMS:22]))
		$_t_ColourName:="Brown"
		
	: ($1=Table:C252(->[PRICE_TABLE:28]))
		
	: ($1=Table:C252(->[PRICE_GROUPS:18]))
		
	: ($1=Table:C252(->[POSTAL_CODES:50]))
		
	: ($1=Table:C252(->[PICTURES:85]))
		
	: ($1=Table:C252(->[PERSONNEL:11]))
		
	: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
		
	: ($1=Table:C252(->[PERIODS:33]))
		$_t_ColourName:="Turquoise"
		
	: ($1=Table:C252(->[ORDERS:24]))
		$_t_ColourName:="Green"
		
	: ($1=Table:C252(->[ORDER_ITEMS:25]))
		$_t_ColourName:="Green"
		
	: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
		$_t_ColourName:="Purple"
		
	: ($1=Table:C252(->[MAILSORT_MAIL:83]))
		
	: ($1=Table:C252(->[SCRIPTS:80]))
		
	: ($1=Table:C252(->[LOCATIONS:61]))
		$_t_ColourName:="Purple"
		
	: ($1=Table:C252(->[LIST_LAYOUTS:96]))
		$_t_ColourName:="Steel"
		
	: ($1=Table:C252(->[LAYERS:76]))
		$_t_ColourName:="Turquoise"
		
	: ($1=Table:C252(->[JOBS:26]))
		$_t_ColourName:="Green"
		
	: ($1=Table:C252(->[JOBS:26]))
		$_t_ColourName:="Green"
		
	: ($1=Table:C252(->[JOB_STAGES:47]))
		$_t_ColourName:="Green"
		
	: ($1=Table:C252(->[JOB PERSONNEL:48]))
		$_t_ColourName:="Green"
		
	: ($1=Table:C252(->[INVOICES:39]))
		$_t_ColourName:="Green"
		
	: ($1=Table:C252(->[HEADINGS:84]))
		$_t_ColourName:="Turquoise"
		
	: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
		
	: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
		$_t_ColourName:="Steel"
		
	: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		
	: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
		$_t_ColourName:="Steel"
		
		
	: ($1=Table:C252(->[AREAS:3]))
		
	: ($1=Table:C252(->[ANALYSES:36]))
		$_t_ColourName:="Turquoise"
		
	: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
		
	: ($1=Table:C252(->[ACTIONS:13]))
		//$_t_ColourName:="Orange"
		
	: ($1=Table:C252(->[ACCOUNTS:32]))
		$_t_ColourName:="Turquoise"
		
	: ($1=Table:C252(->[ACCOUNT_BALANCES:34])) | ($1=Table:C252(->[ACC_Bank_Statements:198]))
		$_t_ColourName:="Turquoise"
		
	: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
		//$_t_ColourName:="Orange"
		
	: ($1=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
		$_t_ColourName:="Green"
		
	: ($1=Table:C252(->[WEB_ACCESS:130]))
	: ($1=Table:C252(->[xCreditCardDetails:132]))
		
End case 
$_l_ForegroundColour:=0
Case of 
	: ($_t_ColourName="Blue")
		$_l_BackgroundColour:=$_l_Blue
		$_l_InputColour:=(0+(256*$_l_Blue))
		$_l_TitleColour:=$_l_BlueLIGHT
	: ($_t_ColourName="Green")
		$_l_BackgroundColour:=$_l_Green
		$_l_InputColour:=(0+(256*$_l_Green))
		$_l_TitleColour:=$_l_GreenLIGHT
	: ($_t_ColourName="Brown")
		$_l_BackgroundColour:=$_l_Brown
		$_l_InputColour:=(0+(256*$_l_Brown))
		$_l_TitleColour:=$_l_BrownLIGHT
	: ($_t_ColourName="Steel")
		$_l_BackgroundColour:=$_l_Steel
		$_l_InputColour:=(0+(256*$_l_Steel))
		$_l_TitleColour:=$_l_SteelLIGHT
	: ($_t_ColourName="Turquoise")
		$_l_BackgroundColour:=$_l_Turquoise
		$_l_InputColour:=(0+(256*$_l_Turquoise))
		$_l_TitleColour:=$_l_TurquoiseLIGHT
	: ($_t_ColourName="Purple")
		$_l_BackgroundColour:=$_l_Purple
		$_l_InputColour:=(0+(256*$_l_Purple))
		$_l_TitleColour:=$_l_PurpleLIGHT
	: ($_t_ColourName="Wine")
		$_l_BackgroundColour:=$_l_Wine
		$_l_InputColour:=(0+(256*$_l_Wine))
		$_l_TitleColour:=$_l_WineLIGHT
	: ($_t_ColourName="Orange")
		$_l_BackgroundColour:=$_l_Orange
		$_l_InputColour:=(0+(256*$_l_Orange))
		$_l_TitleColour:=$_l_OrangeLIGHT
End case 


If ($2#"")
	If (WIN_t_FormSettingsLoaded=$2)  //used to store name of form the output image settings were last loaded for
		
		$_bo_Get:=False:C215
	Else 
		WIN_t_FormSettingsLoaded:=$2
		$_bo_Get:=True:C214
	End if 
Else 
	$_bo_Get:=True:C214
End if 

//If ($_bo_Get)
//SET COLOR(INT_T_OutputTitle;-$_l_TitleColour)
//SET COLOR(vNo;-$_l_TitleColour)

//GET PICTURE FROM LIBRARY("OutStrip"+$_t_ColourName; INT_p_OutStrip)
INT_p_OutStrip:=Get_Picture("OutStrip"+$_t_ColourName)

//End if


//_O_OBJECT SET COLOR(*;"oStrapHeader";-$_l_InputColour)
$_t_ForeGroundColour:=UTIL_4DColorToRGB(0)
$_t_BackGroundColour:=UTIL_4DColorToRGB($_l_BackgroundColour)
OBJECT SET RGB COLORS:C628(*; "oStrapHeader"; $_t_ForegroundColour; $_t_BackgroundColour)

OBJECT SET VISIBLE:C603(*; "oInSheenBlue"; False:C215)
OBJECT SET VISIBLE:C603(*; "oInSheenGreen"; False:C215)
OBJECT SET VISIBLE:C603(*; "oInSheenWine"; False:C215)
OBJECT SET VISIBLE:C603(*; "oInSheenBrown"; False:C215)
OBJECT SET VISIBLE:C603(*; "oInSheenSteel"; False:C215)
OBJECT SET VISIBLE:C603(*; "oInSheenTurquoise"; False:C215)
OBJECT SET VISIBLE:C603(*; "oInSheenPurple"; False:C215)
OBJECT SET VISIBLE:C603(*; "oInSheenOrange"; False:C215)
//oBalanceEntryTitle
If (INT_bo_SkinsPrefsLoaded=False:C215)
	INT_SkinsPrefs
End if 
//$_t_ForeGroundColour:=UTIL_4DColorToRGB (1)
//$_t_BackGroundColour:=UTIL_4DColorToRGB (0)
//OBJECT SET RGB COLORS(*;"oStrapHeader";$_t_ForegroundColour;$_t_BackgroundColour)
//
Case of 
	: (INT_l_PlainWhite=1)
		//$_t_BackGroundColour:=UTIL_4DColorToRGB (0)
		$_t_ForeGroundColour:=UTIL_4DColorToRGB(1)
		$_t_BackGroundColour:=UTIL_4DColorToRGB(0)
		//_O_OBJECT SET COLOR(*;"oBackground";-1)
		$_t_SizeObject:="oBackground"
		//$_l_BackgroundColour:=$_l_Blue
		OBJECT SET RGB COLORS:C628(*; "oBackground"; $_t_ForegroundColour; $_t_BackgroundColour)
		
	: (INT_l_PlainGrey=1)
		$_t_ForeGroundColour:=UTIL_4DColorToRGB(0)
		$_t_BackGroundColour:=UTIL_4DColorToRGB(241)
		
		///_O_OBJECT SET COLOR(*;"oBackground";-(256*241))
		$_t_SizeObject:="oBackground"
		OBJECT SET RGB COLORS:C628(*; "oBackground"; $_t_ForegroundColour; $_t_BackgroundColour)
		
	: (INT_l_OSXGrey=1)
		OBJECT SET VISIBLE:C603(*; "oBackground"; False:C215)
		$_t_SizeObject:="oBackground"
		
	: (INT_l_GreySheen=1)
		OBJECT SET VISIBLE:C603(*; "oBackground"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oInSheenSteel"; True:C214)
		$_t_ColourName:="Steel"
		$_t_SizeObject:="oInSheenSteel"
		$_t_ForeGroundColour:=UTIL_4DColorToRGB(0)
		$_t_BackGroundColour:=UTIL_4DColorToRGB(232)
		
		
	Else 
		OBJECT SET VISIBLE:C603(*; "oBackground"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oInSheen"+$_t_ColourName; True:C214)
		$_t_SizeObject:="oInSheen"+$_t_ColourName
		
End case 
$_t_SizeObject:="oBackground"
$_l_WIdthAddition:=10
If (Count parameters:C259>=3)
	$_obj_Form:=$3
	$_obj_Form.foregroundColour:=$_t_ForeGroundColour
	$_obj_Form.backgroundColour:=$_t_BackGroundColour
End if 
OBJECT GET COORDINATES:C663(*; "oBackground"; $_l_BackLeft; $_l_BackTop; $_l_BackRight; $_l_BackBottom)""

GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_Right; $_l_WindowBottom)

$_l_WIdth:=$_l_Right-$_l_WindowLeft
$_l_Height:=$_l_WindowBottom-$_l_WindowTop
//Gen_SetobjectPositionByname ("oStrapHeader";0;0;$_l_Bottom)

OBJECT GET COORDINATES:C663(*; "oStrapHeader"; $_l_StrapLeft; $_l_StrapTop; $_l_StrapRight; $_l_StrapBottom)
$_l_StrapLength:=$_l_StrapRight-$_l_StrapLeft
If ($_l_StrapLength<($_l_WIdth+$_l_WIdthAddition)) | (True:C214)  //only move if needs it
	$_l_StrapLength:=($_l_WIdth+$_l_WIdthAddition)
	//Gen_SetobjectPositionByname ("oStrapHeader";0;0;$_l_Bottom)
	
	//OBJECT MOVE(*; "oStrapHeader"; $_l_WindowLeft; $_l_WindowTop; $_l_WIdth+$_l_WIdthAddition+30; $_l_Bottom; *)
	OBJECT SET COORDINATES:C1248(*; "oStrapHeader"; $_l_StrapLeft; $_l_StrapTop; $_l_StrapLeft+$_l_StrapLength; $_l_StrapBottom)
	
End if 

//OBJECT GET COORDINATES(*; "oOutStrip"; $_l_StripLeft; $_l_StripTop; $_l_StripRight; $_l_StripBottom)
//OBJECT SET COORDINATES(*; "oOutStrip@"; $_l_StripLeft; $_l_StripTop; $_l_StripLeft+$_l_WIdth+$_l_WIdthAddition+30; $_l_StripTop+5)

$_t_CurrentFormName:=Current form name:C1298
If ($_t_CurrentFormName#"")
	$_ptr_CurrentFormTable:=Current form table:C627
	FORM GET HORIZONTAL RESIZING:C1077($_bo_Resibable; $_l_MinWidth; $_l_MaxWidth)
	For ($_l_FindLastButton; 33; 1; -1)
		$_ptr_Button3:=Get pointer:C304("PAL_BUTTON_"+String:C10($_l_FindLastButton))
		$_bo_Visible:=OBJECT Get visible:C1075(*; "oBarButton"+String:C10($_l_FindLastButton))
		If ($_bo_Visible)
			
			OBJECT GET COORDINATES:C663(*; "oBarButton"+String:C10($_l_FindLastButton); $_l_ButtonLeft; $_l_BUttonTop; $_l_ButtonRIght; $_l_ButtonBottom)
			If (($_l_Right-$_l_WindowLeft)<$_l_ButtonRIght)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+$_l_ButtonRIght+15; $_l_WindowBottom)
				OBJECT SET COORDINATES:C1248(*; "oStrapHeader"; 0; 0; $_l_ButtonRIght+20; 71)
				OBJECT SET COORDINATES:C1248(*; "oOutStrip@"; 0; 68; $_l_ButtonRIght+20; 70)
				//SET WINDOW RECT($_l_WinLeft; $_l_WinTop; $_l_ButtonRIght+5; $_l_WinBottom)
			End if 
			If ($_l_ButtonRIght>$_l_MinWidth)
				If ($_l_MaxWidth<$_l_ButtonRIght)
					$_l_MaxWidth:=$_l_ButtonRIght
				End if 
				$_l_MinWidth:=$_l_ButtonRIght
				FORM SET HORIZONTAL RESIZING:C892($_bo_Resibable; $_l_MinWidth+5; $_l_MaxWidth)
			End if 
			$_l_FindLastButton:=0
		End if 
	End for 
End if 




GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_Right; $_l_WindowBottom)
OBJECT GET COORDINATES:C663(*; $_t_SizeObject; $_l_WindowLeft; $_l_WindowTop; $_l_Right; $_l_Bottom)
OBJECT SET COORDINATES:C1248(*; $_t_SizeObject; $_l_WindowLeft; $_l_WindowTop; $_l_WIdth+$_l_WIdthAddition+30; $_l_Height+30)
$_l_FirstButtonRight:=INT_setButtonsPosition


ERR_MethodTrackerReturn("INT_SetInput"; $_t_oldMethodName)

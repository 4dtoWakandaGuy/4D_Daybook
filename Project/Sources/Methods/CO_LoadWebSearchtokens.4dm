//%attributes = {}

If (False:C215)
	//Project Method Name:      CO_LoadWebSearchtokens
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
	//ARRAY LONGINT(CO_al_FieldNos;0)
	//ARRAY LONGINT(CO_al_TokenFields;0)
	//ARRAY TEXT(CO_at_FIeldNames;0)
	//ARRAY TEXT(CO_at_TokenOptions;0)
	C_BOOLEAN:C305($_bo_Load; $_bo_OK; $1)
	C_LONGINT:C283($_l_Delay; $_l_Index; $_l_ItemID; $_l_offset; $_l_Repeats; $_l_Retries; $_l_TableNumber; $2)
	C_POINTER:C301($3; $4)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CO_LoadWebSearchtokens")

//CO_LoadWebsearchPrefs

//This method loads preferences for the dairy tabs on the diary viewer
//there are 3 primary things we need to know
//1) The Preferred tab to open at(if this is not set we open at 'ALL")
//2)The definitions to use with each tab. Because the number of tabs in use witht the diary is flexible we cannot hardcode the definitions to use with any given tab. Therefore these definitions will be 3+String(Table(»[diary]))+nn
//3) The parameters to use with that definition-filters

//NG this method loads the problem type settings. Each problem type may create one or more Diary Actions(workflows)
$_t_oldMethodName:=ERR_MethodTracker("CO_LoadWebSearchTokens")

//NG March 2005
// New method to load diary action classes
$_l_Retries:=0
While (Semaphore:C143("LoadingWebTokenPrefs"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(10*(1+$_l_Retries))
	
End while 
$_l_ItemID:=PREF_GetPreferenceID("Company Web Search Tokens Prefs")

QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)  //One record for the database
If (Count parameters:C259>=2)
	$_l_TableNumber:=$2
Else 
	$_l_TableNumber:=0
End if 
If ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
	$_l_TableNumber:=0
End if 
If (Records in selection:C76([PREFERENCES:116])>0)
	
	QUERY SELECTION:C341([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=$_l_TableNumber)
	
End if 
If (Records in selection:C76([PREFERENCES:116])>0)  //The preference exists
	$_bo_OK:=False:C215
	$_l_Repeats:=0
	$_l_Delay:=1
	Repeat 
		$_l_Repeats:=$_l_Repeats+1
		$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 1)
		If (Not:C34($_bo_OK))
			If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
				//only increase every 10 tries
				$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
			End if 
			DelayTicks(2*$_l_Delay)
			
			
		End if 
	Until ($_bo_OK=True:C214)
	
End if 

If (Records in selection:C76([PREFERENCES:116])=0)
	//add the the preferences list here
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	[PREFERENCES:116]Pref_OwnerTable:3:=$_l_TableNumber
	DB_SaveRecord(->[PREFERENCES:116])
	
End if 
$_bo_Load:=True:C214
If (Count parameters:C259>=1)
	$_bo_Load:=$1
End if 
If ($_bo_Load=False:C215)  // save updated values
	READ WRITE:C146([PREFERENCES:116])
	$_l_Retries:=0
	While (Not:C34(Check_Locked(->[PREFERENCES:116]; 1)))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(10*(1+$_l_Retries))
	End while 
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532(CO_at_TokenOptions; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CO_al_TokenFields; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
Else 
	$_l_offset:=0
	ARRAY TEXT:C222(CO_at_TokenOptions; 0)  //List of Definitions for the user
	ARRAY LONGINT:C221(CO_al_TokenFields; 0)  //This array will contain preference to filter values etc
	ARRAY LONGINT:C221(CO_al_FieldNos; 0)
	ARRAY TEXT:C222(CO_at_FIeldNames; 0)
	If ($_l_TableNumber=0)
		$_l_TableNumber:=Table:C252(->[COMPANIES:2])
	End if 
	For ($_l_Index; 1; Get last field number:C255($_l_TableNumber))
		$_t_FieldName:=Field name:C257($_l_TableNumber; $_l_Index)
		//some special handling here
		Case of 
			: ($_t_FieldName="Add1")
				$_t_FieldName:="Address Line 1"
			: ($_t_FieldName="Add2")
				$_t_FieldName:="Address Line 2"
			: ($_t_FieldName="County or State")
				$_t_FieldName:="Address Line 2"
			: ($_t_FieldName="County or State")
				$_t_FieldName:="Address Line 2"
			: ($_t_FieldName="CUS_LabelPrint")
				$_t_FieldName:=""
			: ($_t_FieldName="DocumentPrintPreferences")
				$_t_FieldName:=""
			: ($_t_FieldName="FURTHERS")
				$_t_FieldName:=""
			: ($_t_FieldName="iAdd1")
				$_t_FieldName:="Invoice address Line1"
			: ($_t_FieldName="iAdd2")
				$_t_FieldName:="Invoice address Line2"
			: ($_t_FieldName="iCountry")
				$_t_FieldName:="Invoice Country"
			: ($_t_FieldName="iCounty")
				$_t_FieldName:="Invoice County"
			: ($_t_FieldName="iCounty")
				$_t_FieldName:="Invoice County"
			: ($_t_FieldName="iDept")
				$_t_FieldName:="Invoice Dept"
			: ($_t_FieldName="iName")
				$_t_FieldName:="Invoice Name"
			: ($_t_FieldName="inv Superior")
				$_t_FieldName:=""
			: ($_t_FieldName="iPostCode")
				$_t_FieldName:="Invoice Postcode"
			: ($_t_FieldName="iTown")
				$_t_FieldName:="InvoiceTown"
			: ($_t_FieldName="Mailsort OEN")
				$_t_FieldName:=""
			: ($_t_FieldName="Mailsort SSC")
				$_t_FieldName:=""
			: ($_t_FieldName="Omit")
				$_t_FieldName:=""
			: ($_t_FieldName="PhoneticName")
				$_t_FieldName:=""
			: ($_t_FieldName="Postal Code")
				$_t_FieldName:="Post Code"
			: ($_t_FieldName="Private")
				$_t_FieldName:=""
			: ($_t_FieldName="Record_state")
				$_t_FieldName:=""
			: ($_t_FieldName="Value")
				$_t_FieldName:=""
			: ($_t_FieldName="XFurthers")
				$_t_FieldName:=""
			: ($_t_FieldName="x_ID")
				$_t_FieldName:=""
			: ($_t_FieldName="zProductBuildFormat")
				$_t_FieldName:=""
			: ($_t_FieldName="xSupplierUpdateOption")
				$_t_FieldName:=""
			: ($_t_FieldName="xProductNolongerAvailble")
				$_t_FieldName:=""
			: ($_t_FieldName="xProductGraphicExists")
				$_t_FieldName:=""
			: ($_t_FieldName="xProductEntryClass")
				$_t_FieldName:=""
			: ($_t_FieldName="xProductBuildSectionCode")
				$_t_FieldName:=""
			: ($_t_FieldName="xPreviousProductID")
				$_t_FieldName:=""
			: ($_t_FieldName="xPicturesInfo")
				$_t_FieldName:=""
			: ($_t_FieldName="xBatchNumbering")
				$_t_FieldName:=""
			: ($_t_FieldName="x_ID")
				$_t_FieldName:=""
			: ($_t_FieldName="Subs Perpetual")
				$_t_FieldName:=""
			: ($_t_FieldName="Price Updates")
				$_t_FieldName:=""
			: ($_t_FieldName="ProductGraphicFileName")
				$_t_FieldName:="Picture Name"
			: ($_t_FieldName="Price Per")
				$_t_FieldName:=""
			: ($_t_FieldName="Mod Date")
				$_t_FieldName:=""
			: ($_t_FieldName="Minimum")
				$_t_FieldName:=""
			: ($_t_FieldName="Maximum")
				$_t_FieldName:=""
			: ($_t_FieldName="Maintain Stock")
				$_t_FieldName:=""
			: ($_t_FieldName="Issues No")
				$_t_FieldName:=""
			: ($_t_FieldName="Exported")
				$_t_FieldName:=""
			: ($_t_FieldName="ExpectedEndDate")
				$_t_FieldName:=""
			: ($_t_FieldName="Every No")
				$_t_FieldName:=""
			: ($_t_FieldName="DefaultPriceCurrencyID")
				$_t_FieldName:=""
			: ($_t_FieldName="Bundle Show")
				$_t_FieldName:=""
			: ($_t_FieldName="Bundle Assembly")
				$_t_FieldName:=""
			: ($_t_FieldName="AvailableFromDate")
				$_t_FieldName:=""
			: ($_t_FieldName="Append Month")
				$_t_FieldName:=""
			: ($_t_FieldName="Append Issue")
				$_t_FieldName:=""
			: ($_t_FieldName="ActualEndDate")
				$_t_FieldName:=""
			: ($_t_FieldName="1st Issue Date")
				$_t_FieldName:=""
			: ($_t_FieldName="1st Day Month")
				$_t_FieldName:=""
		End case 
		If ($_t_FieldName#"")
			APPEND TO ARRAY:C911(CO_al_FieldNos; $_l_Index)
			APPEND TO ARRAY:C911(CO_at_FIeldNames; $_t_FieldName)
		End if 
	End for 
	If ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
		APPEND TO ARRAY:C911(CO_al_FieldNos; -2)
		APPEND TO ARRAY:C911(CO_at_FIeldNames; "Supplier Web Site")
		APPEND TO ARRAY:C911(CO_al_FieldNos; -3)
		APPEND TO ARRAY:C911(CO_at_FIeldNames; "Supplier Product Code")
		
	End if 
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CO_at_TokenOptions; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CO_al_TokenFields; $_l_offset)
		End if 
		
	Else 
		// The Web search options have not been created
		// so we create some defaults here
		Case of 
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				APPEND TO ARRAY:C911(CO_at_TokenOptions; "PRDName")
				APPEND TO ARRAY:C911(CO_al_TokenFields; Field:C253(->[PRODUCTS:9]Product_Name:2))
				APPEND TO ARRAY:C911(CO_at_TokenOptions; "PRDCode")
				APPEND TO ARRAY:C911(CO_al_TokenFields; Field:C253(->[PRODUCTS:9]Product_Code:1))
				
			Else 
				APPEND TO ARRAY:C911(CO_at_TokenOptions; "CoWebURL")
				APPEND TO ARRAY:C911(CO_al_TokenFields; Field:C253(->[COMPANIES:2]Home_Page_URL:56))
				APPEND TO ARRAY:C911(CO_at_TokenOptions; "COPostalCode")
				APPEND TO ARRAY:C911(CO_al_TokenFields; Field:C253(->[COMPANIES:2]Postal_Code:7))
				APPEND TO ARRAY:C911(CO_at_TokenOptions; "CoName")
				APPEND TO ARRAY:C911(CO_al_TokenFields; Field:C253(->[COMPANIES:2]Company_Name:2))
		End case 
		//NOTE THIS FORMAT FOR geocode SW6+4rn
		
		READ WRITE:C146([PREFERENCES:116])
		$_l_Retries:=0
		While (Not:C34(Check_Locked(->[PREFERENCES:116]; 1)))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(10*(1+$_l_Retries))
		End while 
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532(CO_at_TokenOptions; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(CO_al_TokenFields; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	End if 
End if 
UNLOAD RECORD:C212([PREFERENCES:116])
ERR_MethodTrackerReturn("CO_LoadWebsearchPrefs"; $_t_oldMethodName)
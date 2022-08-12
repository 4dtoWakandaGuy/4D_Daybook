//%attributes = {}

If (False:C215)
	//Project Method Name:      CO_LoadWebsearchPrefs
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
	//ARRAY TEXT(CO_at_SearchConstructs;0)
	//ARRAY TEXT(CO_at_SearchOptions;0)
	C_BOOLEAN:C305($_bo_Load; $_bo_OK; $1)
	C_LONGINT:C283($_l_Delay; $_l_ItemID; $_l_offset; $_l_Repeats; $_l_Retries; $_l_TableNumber; $2)
	C_POINTER:C301($3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CO_LoadWebsearchPrefs")

//CO_LoadWebsearchPrefs

//This method loads preferences for the dairy tabs on the diary viewer
//there are 3 primary things we need to know
//1) The Preferred tab to open at(if this is not set we open at 'ALL")
//2)The definitions to use with each tab. Because the number of tabs in use witht the diary is flexible we cannot hardcode the definitions to use with any given tab. Therefore these definitions will be 3+String(Table(»[diary]))+nn
//3) The parameters to use with that definition-filters

//NG this method loads the problem type settings. Each problem type may create one or more Diary Actions(workflows)
$_t_oldMethodName:=ERR_MethodTracker("CO_LoadWebsearchPrefs")

//NG March 2005
// New method to load diary action classes
$_l_Retries:=0
While (Semaphore:C143("LoadingWebSearchPrefs"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(10*(1+$_l_Retries))
End while 
$_l_ItemID:=PREF_GetPreferenceID("Web Search Prefs")

QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)  //One record for the database
If (Count parameters:C259>=2)
	$_l_TableNumber:=$2
Else 
	$_l_TableNumber:=0
End if 
If ($_l_TableNumber>0)
	If (Records in selection:C76([PREFERENCES:116])>0)
		QUERY SELECTION:C341([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=$_l_TableNumber)
	End if 
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
	VARIABLE TO BLOB:C532(CO_at_SearchOptions; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CO_at_SearchConstructs; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
Else 
	$_l_offset:=0
	ARRAY TEXT:C222(CO_at_SearchOptions; 0)  //List of Definitions for the user
	ARRAY TEXT:C222(CO_at_SearchConstructs; 0)  //This array will contain preference to filter values etc
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CO_at_SearchOptions; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CO_at_SearchConstructs; $_l_offset)
		End if 
		
	Else 
		// The Web search options have not been created
		// so we create some defaults here
		If ($_l_TableNumber=0)  //companies
			APPEND TO ARRAY:C911(CO_at_SearchOptions; "No Search")
			APPEND TO ARRAY:C911(CO_at_SearchConstructs; "")
			APPEND TO ARRAY:C911(CO_at_SearchOptions; "Company Website")
			APPEND TO ARRAY:C911(CO_at_SearchConstructs; "<CoWebURL>")
			//APPEND TO ARRAY(CO_at_SearchOptions;"Google Map")
			//APPEND TO ARRAY(CO_at_SearchConstructs;"http://maps.google.co.uk/maps?f=q&hl=en&geocode=&q="+"<COPostalCode>"+"&ie=UTF8&z=16&iwloc=add"+"r&om=1")
			APPEND TO ARRAY:C911(CO_at_SearchOptions; "Google")
			APPEND TO ARRAY:C911(CO_at_SearchConstructs; "http://www.google.com/search?num=100&hl=en&safe=active&q=%22"+"<CoName>")
			APPEND TO ARRAY:C911(CO_at_SearchOptions; "Google UK")
			APPEND TO ARRAY:C911(CO_at_SearchConstructs; "http://www.google.co.uk/search?num=100&hl=en&safe=active&q=%22"+"<CoName>"+"%22&btnG=Search&meta=cr%3DcountryUK%7CcountryGB")
			APPEND TO ARRAY:C911(CO_at_SearchOptions; "Google News")
			APPEND TO ARRAY:C911(CO_at_SearchConstructs; "http://news.google.com/news?hl=en&ned=uk&q=%22"+"<CoName>"+"%22&btnG=Search+News")
			APPEND TO ARRAY:C911(CO_at_SearchOptions; "Wikipedia")
			APPEND TO ARRAY:C911(CO_at_SearchConstructs; "http://en.wikipedia.org/wiki/Special:Search?search="+"<CoName>"+"&go=Go")
			//NOTE THIS FORMAT FOR geocode SW6+4rn
			READ WRITE:C146([PREFERENCES:116])
			$_l_Retries:=0
			While (Not:C34(Check_Locked(->[PREFERENCES:116]; 1)))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(10*(1+$_l_Retries))
			End while 
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		Else 
			Case of 
				: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
					APPEND TO ARRAY:C911(CO_at_SearchOptions; "Google")
					APPEND TO ARRAY:C911(CO_at_SearchConstructs; "http://www.google.com/search?num=100&hl=en&safe=active&q=%22"+"<PrdName>")
					
			End case 
		End if 
		VARIABLE TO BLOB:C532(CO_at_SearchOptions; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(CO_at_SearchConstructs; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		
		
	End if 
End if 
UNLOAD RECORD:C212([PREFERENCES:116])
CLEAR SEMAPHORE:C144("LoadingWebSearchPrefs")
ERR_MethodTrackerReturn("CO_LoadWebsearchPrefs"; $_t_oldMethodName)
//%attributes = {}

If (False:C215)
	//Project Method Name:      Camp_LoadDotMailerAccount
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  27/02/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY TEXT:C222($_at_DataFieldLabels; 0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	C_BOOLEAN:C305($_bo_Save; $3)
	C_LONGINT:C283($_l_ItemID; $_l_PropertyRow; $0)
	C_OBJECT:C1216($_obj_DataPrefernces)
	C_REAL:C285($_l_AccountID; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Camp_LoadDotMailerAccount")
If (Count parameters:C259>=1)
	$_l_AccountID:=$1  //this is stored JUST for validation!
	READ ONLY:C145([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("Dot Digital Preference")
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)  //this should NEVER happen in here!!!
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		ARRAY TEXT:C222($_at_DataFieldLabels; 0)
		APPEND TO ARRAY:C911($_at_DataFieldLabels; "Dot Mailer End Point")
		APPEND TO ARRAY:C911($_at_DataFieldLabels; "Dot Mailer User Name")
		APPEND TO ARRAY:C911($_at_DataFieldLabels; "Dot Mailer Password")
		//Note here changing from using the blob for storing the data-the object is easier to manage
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "Labels"; $_at_DataFieldLabels)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		
	End if 
	
	If (Count parameters:C259>=3)
		$_bo_Save:=$3
	End if 
	If ($_bo_Save)
		READ WRITE:C146([PREFERENCES:116])
		LOAD RECORD:C52([PREFERENCES:116])
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "AccountID"; $_l_AccountID)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		
		
	Else 
		
		OB GET PROPERTY NAMES:C1232([PREFERENCES:116]DataObject:8; $_at_PropertyNames; $_al_PropertyTypes)
		$_l_PropertyRow:=Find in array:C230($_at_PropertyNames; "AccountID")
		If ($_l_PropertyRow>0)
			$_l_AccountID:=OB Get:C1224([PREFERENCES:116]DataObject:8; "AccountID")
		End if 
		$0:=$_l_AccountID
		
	End if 
End if 
ERR_MethodTrackerReturn("Camp_LoadDotMailerAccount"; $_t_oldMethodName)
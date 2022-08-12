//%attributes = {}

If (False:C215)
	//Project Method Name:      CAMP_LoadDotMailerPrefs
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
	ARRAY TEXT:C222($_at_DataFieldValues; 0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	C_BOOLEAN:C305($_bo_Save; $3)
	C_LONGINT:C283($_l_ItemID; $_l_PropertyRow)
	C_OBJECT:C1216($_obj_DataPrefernces)
	C_POINTER:C301($_ptr_FieldLabels; $_ptr_FieldValues; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CAMP_LoadDotMailerPrefs")
If (Count parameters:C259>=2)
	
	$_ptr_FieldLabels:=$1
	$_ptr_FieldValues:=$2
	
	READ ONLY:C145([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("Dot Digital Preference")
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
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
		COPY ARRAY:C226($_ptr_FieldLabels->; $_at_DataFieldLabels)
		COPY ARRAY:C226($_ptr_FieldValues->; $_at_DataFieldValues)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "Labels"; $_at_DataFieldLabels)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "Values"; $_at_DataFieldValues)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		
		
	Else 
		ARRAY TEXT:C222($_at_DataFieldLabels; 0)
		ARRAY TEXT:C222($_at_DataFieldValues; 0)
		OB GET PROPERTY NAMES:C1232([PREFERENCES:116]DataObject:8; $_at_PropertyNames; $_al_PropertyTypes)
		$_l_PropertyRow:=Find in array:C230($_at_PropertyNames; "Labels")
		If ($_l_PropertyRow>0)
			OB GET ARRAY:C1229([PREFERENCES:116]DataObject:8; "Labels"; $_at_DataFieldLabels)
		End if 
		$_l_PropertyRow:=Find in array:C230($_at_PropertyNames; "Values")
		If ($_l_PropertyRow>0)
			OB GET ARRAY:C1229([PREFERENCES:116]DataObject:8; "Values"; $_at_DataFieldValues)
			
		End if 
		
	End if 
	ARRAY TEXT:C222($_at_DataFieldValues; Size of array:C274($_at_DataFieldLabels))
	
	COPY ARRAY:C226($_at_DataFieldLabels; $_ptr_FieldLabels->)
	COPY ARRAY:C226($_at_DataFieldValues; $_ptr_FieldValues->)
End if 
ERR_MethodTrackerReturn("CAMP_LoadDotMailerPrefs"; $_t_oldMethodName)
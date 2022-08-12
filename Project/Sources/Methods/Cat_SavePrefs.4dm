//%attributes = {}
If (False:C215)
	//Project Method Name:      Cat_SavePrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_ImageSources;0)
	//ARRAY LONGINT(CAT_al_SupportedPicTypes;0)
	//ARRAY TEXT(CAT_at_ImageNameConvention;0)
	//ARRAY TEXT(CAT_at_ImageSources;0)
	//ARRAY TEXT(CAT_at_PictureMacTypes;0)
	//ARRAY TEXT(CAT_at_PictureTypeExtensions;0)
	C_BOOLEAN:C305(CAT_bo_CataloguesEnabled; CAT_bo_MaintainAllProds; CAT_bo_MaintainPriceList)
	C_LONGINT:C283($_l_ItemID; $_l_offset; $_l_Retries; CAT_l_MaxFolderSize; CAT_l_PictureSource)
	C_TEXT:C284($_t_oldMethodName; CAT_t_PictureNaming; CAT_T_PicturePath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cat_SavePrefs")
// Cat_SavePrefs
If (False:C215)
	//Modified NG March 2004
	// to store default image path prefs
	//these will be inherited by the catalogues
	//Variables used
	//CB_bo_PrefsLoaded
	//tells us if the prefs are alre(set to false to cause a reload)
	//CAT_bo_CataloguesEnabled
	//tells us if the catalogues are enabled for this system
	//CAT_T_PicturePath
	//Text variable containing default path to pictures
	//CAT_l_PictureSource
	//Longint variable defining whether the souce is on disk or in data
	//this variable relates to the arrays
	ARRAY LONGINT:C221(CAT_al_ImageSources; 3)
	ARRAY TEXT:C222(CAT_at_ImageSources; 3)
	
	CAT_at_ImageSources{1}:="No Images"
	CAT_at_ImageSources{2}:="On Disk"
	CAT_at_ImageSources{3}:="In Database"
	CAT_al_ImageSources{1}:=0
	CAT_al_ImageSources{2}:=1
	CAT_al_ImageSources{3}:=2
	
	//CAT_t_PictureNaming
	//This relates to the follow array
	ARRAY TEXT:C222(CAT_at_ImageNameConvention; 3)
	CAT_at_ImageNameConvention{1}:="Use Product Code"
	CAT_at_ImageNameConvention{2}:="Use Product Short Code"
	CAT_at_ImageNameConvention{3}:="Use Image Name on Product"
	//Alpha numeric variable indication the naming convention for pictures
	//CAT_l_MaxFolderSize
	//This variable is used to store the maximum number of items in the default directory before a sub directory is created
	
End if 
$_l_Retries:=0
While (Semaphore:C143("LoadingCataloguePrefs"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*(1+$_l_Retries))
End while 
$_l_ItemID:=PREF_GetPreferenceID("Catalogue Preferences")
READ WRITE:C146([PREFERENCES:116])
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	$_l_offset:=0
	VARIABLE TO BLOB:C532(CAT_bo_CataloguesEnabled; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_T_PicturePath; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_l_PictureSource; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_t_PictureNaming; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_l_MaxFolderSize; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_al_SupportedPicTypes; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_at_PictureTypeExtensions; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_at_PictureMacTypes; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_bo_MaintainPriceList; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_bo_MaintainAllProds; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
Else 
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532(CAT_bo_CataloguesEnabled; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_T_PicturePath; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_l_PictureSource; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_t_PictureNaming; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_l_MaxFolderSize; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_al_SupportedPicTypes; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_at_PictureTypeExtensions; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_at_PictureMacTypes; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_bo_MaintainPriceList; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(CAT_bo_MaintainAllProds; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
End if 
CLEAR SEMAPHORE:C144("LoadingCataloguePrefs")
ERR_MethodTrackerReturn("Cat_SavePrefs"; $_t_oldMethodName)
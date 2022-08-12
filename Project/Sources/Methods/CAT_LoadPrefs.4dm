//%attributes = {}
If (False:C215)
	//Project Method Name:      CAT_LoadPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/11/2009 15:03`Method: CAT_LoadPrefs
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_SupportedPicTypes; 0)
	ARRAY LONGINT:C221($_al_SupportedPicTypes; 0)
	//ARRAY LONGINT(CAT_al_ImageSources;0)
	//ARRAY LONGINT(CAT_al_SupportedPicTypes;0)
	ARRAY TEXT:C222($_at_ValidPictureTypeNames; 0)
	ARRAY TEXT:C222($_at_ValidPictureTypes; 0)
	ARRAY TEXT:C222($_at_PictureMacTypes; 0)
	ARRAY TEXT:C222($_at_PictureTypeExtensions; 0)
	//ARRAY TEXT(CAT_at_ImageNameConvention;0)
	//ARRAY TEXT(CAT_at_ImageSources;0)
	//ARRAY TEXT(CAT_at_PictureMacTypes;0)
	//ARRAY TEXT(CAT_at_PictureTypeExtensions;0)
	//ARRAY TEXT(DS_S3_aFileMap;0)
	//ARRAY TEXT(DS_S4_aFileMap;0)
	C_BOOLEAN:C305($_bo_CataloguesEnabled; $_bo_MaintainAllProds; $_bo_MaintainPriceList; $_bo_SaveDate; CAT_bo_CataloguesEnabled; CAT_bo_FixFlag; CAT_bo_MaintainAllProds; CAT_bo_MaintainPriceList; CAT_bo_PrefsLoaded; CB_bo_PrefsLoaded)
	C_LONGINT:C283($_l_FillIndex; $_l_Index; $_l_ItemID; $_l_offset; $_l_OffSetOLD; $_l_PictureTypeSize; $_l_Retries; $CAT_l_MaxFolderSize; $CAT_l_PictureSource; CAT_l_MaxFolderSize; CAT_l_MAXLEVELS)
	C_LONGINT:C283(CAT_l_MINLEVELS; CAT_l_PictureSource)
	C_TEXT:C284($_t_CurrentErrMethod; $_t_oldMethodName; $_t_OldMethodName2; $_t_PictureNaming; $CAT_T_PicturePath; CAT_t_CatImageSource; CAT_t_PictureNaming; CAT_T_PicturePath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAT_LoadPrefs")

If (False:C215)
	//Modified NG March 2004 to include variables holding the default picture naming
	//Variables used
	CB_bo_PrefsLoaded:=False:C215
	
	//tells us if the prefs are alre(set to false to cause a reload)
	CAT_bo_CataloguesEnabled:=True:C214
	//tells us if the catalogues are enabled for this system
	CAT_T_PicturePath:=""
	//Text variable containing default path to pictures
	CAT_l_PictureSource:=0
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
	
	CAT_t_PictureNaming:=""
	//This relates to the follow array
	ARRAY TEXT:C222(CAT_at_ImageNameConvention; 3)
	CAT_at_ImageNameConvention{1}:="Use Product Code"
	CAT_at_ImageNameConvention{2}:="Use Product Short Code"
	CAT_at_ImageNameConvention{3}:="Use Image Name on Product"
	//Alpha numeric variable indication the naming convention for pictures
	CAT_l_MaxFolderSize:=0
	//This variable is used to store the maximum number of items in the default directory before a sub directory is created
	ARRAY LONGINT:C221(CAT_al_SupportedPicTypes; 0)
	ARRAY TEXT:C222(CAT_at_PictureTypeExtensions; 0)
	ARRAY TEXT:C222(CAT_at_PictureMacTypes; 0)
	//these array contain the supported picture types.
	CAT_l_MINLEVELS:=0
	//THIS IS USED TO SPECIFYTHE PREFERRED STARTING POINT
	//.E.G IF 1 MYPICTURES\A\APICTURE.JPG
	//IF2 MYPICTURES\A\P\APICTURE.JPG
	//IF 3 MYPICTURES\A\P\I\APICTURE.JPG
	//ETC
	CAT_l_MAXLEVELS:=0
	//INDICATES THE MAX LEVEL
	//NOTE THIS MUST BE GREATER THAN OR EQUAL TO MIN
	//e.g. if min=2 and max=3
	//MYPICTURES/A/P/APICTURE.JPG
	
End if 

If (Not:C34(CAT_bo_PrefsLoaded))
	$_l_Retries:=0
	While (Semaphore:C143("LoadingCataloguePrefs"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
	End while 
	READ ONLY:C145([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("Catalogue Preferences")
	ARRAY LONGINT:C221(CAT_al_ImageSources; 3)
	ARRAY TEXT:C222(CAT_at_ImageSources; 3)
	CAT_at_ImageSources{1}:="No Images"
	CAT_at_ImageSources{2}:="On Disk"
	CAT_at_ImageSources{3}:="In Database"
	CAT_al_ImageSources{1}:=0
	CAT_al_ImageSources{2}:=1
	CAT_al_ImageSources{3}:=2
	ARRAY TEXT:C222(CAT_at_ImageNameConvention; 3)
	CAT_at_ImageNameConvention{1}:="Use Product Code"
	CAT_at_ImageNameConvention{2}:="Use Product Short Code"
	CAT_at_ImageNameConvention{3}:="Use Image Name on Product"
	CAT_t_PictureNaming:=""
	CAT_t_CatImageSource:=""
	//this method load the prefs for Catalogues
	ARRAY LONGINT:C221(CAT_al_SupportedPicTypes; 0)
	ARRAY TEXT:C222(CAT_at_PictureTypeExtensions; 0)
	ARRAY TEXT:C222(CAT_at_PictureMacTypes; 0)
	
	CAT_bo_CataloguesEnabled:=False:C215
	$_l_offset:=0
	$_t_CurrentErrMethod:=Method called on error:C704  //
	$_bo_SaveDate:=False:C215
	//TRACE
	CAT_bo_FixFlag:=False:C215
	ON ERR CALL:C155("CAT_FixPrefs")
	//ALERT("Method called on error "+Method called on error+"Cal4D_iCal_DeleteCalendarFile")
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
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
		$_t_OldMethodName2:=ERR_MethodTracker("CAT_LoadPrefs:2")
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_bo_CataloguesEnabled; $_l_offset)
		If (Type:C295($_bo_CataloguesEnabled)=Is boolean:K8:9)
			CAT_bo_CataloguesEnabled:=$_bo_CataloguesEnabled
		Else 
			CAT_bo_CataloguesEnabled:=False:C215
		End if 
		If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
			
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $CAT_T_PicturePath; $_l_offset)
			If (Type:C295($CAT_T_PICTUREPATH)=Is text:K8:3)  //| (Type($CAT_T_PICTUREPATH)=Is string)
				CAT_T_PICTUREPATH:=$CAT_T_PICTUREPATH
			Else 
				CAT_T_PICTUREPATH:=""
			End if 
			If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
				
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $CAT_l_PictureSource; $_l_offset)
				If (Type:C295($CAT_l_PictureSource)=Is integer:K8:5) | (Type:C295($CAT_l_PictureSource)=Is longint:K8:6) | (Type:C295($CAT_l_PictureSource)=Is real:K8:4)
					CAT_l_PictureSource:=$CAT_l_PictureSource
				Else 
					CAT_l_PictureSource:=0
				End if 
				If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
					
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_t_PictureNaming; $_l_offset)
					If (Type:C295($_t_PictureNaming)=Is string var:K8:2) | (Type:C295($_t_PictureNaming)=Is text:K8:3)
						CAT_t_PictureNaming:=$_t_PictureNaming
					Else 
						CAT_t_PictureNaming:=""
					End if 
					If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
						
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $CAT_l_MaxFolderSize; $_l_offset)
						If (Type:C295($CAT_l_MaxFolderSize)=Is integer:K8:5) | (Type:C295($CAT_l_MaxFolderSize)=Is longint:K8:6) | (Type:C295($CAT_l_MaxFolderSize)=Is real:K8:4)
							CAT_l_MaxFolderSize:=$CAT_l_MaxFolderSize
						Else 
							CAT_l_MaxFolderSize:=0
						End if 
						If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
							ARRAY LONGINT:C221($_al_SupportedPicTypes; 0)
							$_l_OffSetOLD:=$_l_offset
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_SupportedPicTypes; $_l_offset)
							If (CAT_bo_FixFlag)
								CAT_bo_FixFlag:=False:C215
								$_bo_SaveDate:=True:C214
								ARRAY LONGINT:C221($_al_SupportedPicTypes; 0)
								$_l_offset:=$_l_OffSetOLD
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_SupportedPicTypes; $_l_offset)
								ARRAY LONGINT:C221($_al_SupportedPicTypes; Size of array:C274($_al_SupportedPicTypes))
								For ($_l_FillIndex; 1; Size of array:C274($_al_SupportedPicTypes))
									$_al_SupportedPicTypes{$_l_Index}:=$_al_SupportedPicTypes{$_l_FillIndex}
								End for 
								
							End if 
							
							If (Type:C295($_al_SupportedPicTypes)=Integer array:K8:18) | (Type:C295($_al_SupportedPicTypes)=LongInt array:K8:19) | (Type:C295($_al_SupportedPicTypes)=Real array:K8:17)
								ARRAY LONGINT:C221(CAT_al_SupportedPicTypes; Size of array:C274($_al_SupportedPicTypes))
								For ($_l_FillIndex; 1; Size of array:C274($_al_SupportedPicTypes))
									CAT_al_SupportedPicTypes{$_l_FillIndex}:=$_al_SupportedPicTypes{$_l_FillIndex}
								End for 
							Else 
								ARRAY LONGINT:C221(CAT_al_SupportedPicTypes; 0)
							End if 
							If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
								ARRAY TEXT:C222($_at_PictureTypeExtensions; 0)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_PictureTypeExtensions; $_l_offset)
								If (CAT_bo_FixFlag)
									CAT_bo_FixFlag:=False:C215
									$_bo_SaveDate:=True:C214
									ARRAY TEXT:C222($_at_PictureTypeExtensions; 0)
									$_l_offset:=$_l_OffSetOLD
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_PictureTypeExtensions; $_l_offset)
									ARRAY TEXT:C222($_at_PictureTypeExtensions; Size of array:C274($_at_PictureTypeExtensions))
									For ($_l_FillIndex; 1; Size of array:C274($_at_PictureTypeExtensions))
										$_at_PictureTypeExtensions{$_l_Index}:=$_at_PictureTypeExtensions{$_l_FillIndex}
									End for 
									
								End if 
								
								If (Type:C295($_at_PictureTypeExtensions)=String array:K8:15) | (Type:C295($_at_PictureTypeExtensions)=Text array:K8:16)
									ARRAY TEXT:C222(CAT_at_PictureTypeExtensions; Size of array:C274($_at_PictureTypeExtensions))
									For ($_l_FillIndex; 1; Size of array:C274($_at_PictureTypeExtensions))
										CAT_at_PictureTypeExtensions{$_l_FillIndex}:=$_at_PictureTypeExtensions{$_l_FillIndex}
									End for 
								Else 
									ARRAY TEXT:C222(CAT_at_PictureTypeExtensions; 0)
								End if 
								If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
									ARRAY TEXT:C222($_at_PictureMacTypes; 0)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_PictureMacTypes; $_l_offset)
									If (CAT_bo_FixFlag)
										CAT_bo_FixFlag:=False:C215
										$_bo_SaveDate:=True:C214
										ARRAY TEXT:C222($_at_PictureTypeExtensions; 0)
										$_l_offset:=$_l_OffSetOLD
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_PictureTypeExtensions; $_l_offset)
										ARRAY TEXT:C222($_at_PictureMacTypes; Size of array:C274($_at_PictureTypeExtensions))
										For ($_l_FillIndex; 1; Size of array:C274($_at_PictureMacTypes))
											$_at_PictureMacTypes{$_l_Index}:=$_at_PictureTypeExtensions{$_l_FillIndex}
										End for 
										
									End if 
									
									If (Type:C295($_at_PictureMacTypes)=String array:K8:15) | (Type:C295($_at_PictureMacTypes)=Text array:K8:16)
										ARRAY TEXT:C222(CAT_at_PictureMacTypes; Size of array:C274($_at_PictureMacTypes))
										For ($_l_FillIndex; 1; Size of array:C274($_at_PictureMacTypes))
											CAT_at_PictureMacTypes{$_l_FillIndex}:=$_at_PictureMacTypes{$_l_FillIndex}
										End for 
									Else 
										ARRAY TEXT:C222(CAT_at_PictureMacTypes; 0)
									End if 
									
									If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
										$_t_OldMethodName2:=ERR_MethodTracker("CAT_LoadPrefs:10")
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_bo_MaintainPriceList; $_l_offset)
										If (Type:C295($_bo_MaintainPriceList)=Is boolean:K8:9)
											CAT_bo_MaintainPriceList:=$_bo_MaintainPriceList
										Else 
											CAT_bo_MaintainPriceList:=False:C215
										End if 
										If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
											$_t_OldMethodName2:=ERR_MethodTracker("CAT_LoadPrefs:11")
											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_bo_MaintainAllProds; $_l_offset)
											If (Type:C295($_bo_MaintainAllProds)=Is boolean:K8:9)
												CAT_bo_MaintainAllProds:=$_bo_MaintainAllProds
											Else 
												CAT_bo_MaintainAllProds:=False:C215
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
					
				End if 
			End if 
		End if 
		
		UNLOAD RECORD:C212([PREFERENCES:116])
		
	End if 
	CLEAR SEMAPHORE:C144("LoadingCataloguePrefs")
	If ($_t_CurrentErrMethod#"")  //
		ON ERR CALL:C155($_t_CurrentErrMethod)
	End if 
	If ($_bo_SaveDate)
		Cat_SavePrefs
	End if 
	$_t_OldMethodName2:=ERR_MethodTracker("CAT_LoadPrefs:12")
	ARRAY TEXT:C222($_at_ValidPictureTypes; 0)
	ARRAY TEXT:C222($_at_ValidPictureTypeNames; 0)
	PICTURE CODEC LIST:C992($_at_ValidPictureTypes; $_at_ValidPictureTypeNames; *)
	
	//_O_PICTURE TYPE LIST($_at_ValidPictureTypes;$_at_ValidPictureTypeNames)
	//$_at_ValidPictureTypes contains the four char Quicktime type
	//ARRAY TEXT(DS_S3_aFileMap;0)
	//ARRAY TEXT(DS_S4_aFileMap;0)
	//DS_GETFILEMAP (->DS_S3_aFileMap;->DS_S4_aFileMap)
	//$_l_PictureTypeSize:=Find in array(DS_S4_aFileMap;"JPEG")
	//If ($_l_PictureTypeSize<0)
	//INSERT IN ARRAY(DS_S3_aFileMap;Size of array(DS_S3_aFileMap)+1;1)
	//INSERT IN ARRAY(DS_S4_aFileMap;Size of array(DS_S4_aFileMap)+1;1)
	//DS_S4_aFileMap{Size of array(DS_S4_aFileMap)}:="JPEG"
	//DS_S3_aFileMap{Size of array(DS_S3_aFileMap)}:="JPG"
	//End if 
	//$_l_PictureTypeSize:=Find in array(DS_S4_aFileMap;"BMPf")
	//If ($_l_PictureTypeSize<0)
	//INSERT IN ARRAY(DS_S3_aFileMap;Size of array(DS_S3_aFileMap)+1;1)
	//INSERT IN ARRAY(DS_S4_aFileMap;Size of array(DS_S4_aFileMap)+1;1)
	//DS_S4_aFileMap{Size of array(DS_S4_aFileMap)}:="BMPf"
	//DS_S3_aFileMap{Size of array(DS_S3_aFileMap)}:="BMP"
	//End if 
	//$_l_PictureTypeSize:=Find in array(DS_S4_aFileMap;".SGI")
	//If ($_l_PictureTypeSize<0)
	//INSERT IN ARRAY(DS_S3_aFileMap;Size of array(DS_S3_aFileMap)+1;1)
	//INSERT IN ARRAY(DS_S4_aFileMap;Size of array(DS_S4_aFileMap)+1;1)
	//DS_S4_aFileMap{Size of array(DS_S4_aFileMap)}:=".SGI"
	//DS_S3_aFileMap{Size of array(DS_S3_aFileMap)}:="SGI"
	//End if 
	//$_l_PictureTypeSize:=Find in array(DS_S4_aFileMap;"PNGf")
	//If ($_l_PictureTypeSize<0)
	//INSERT IN ARRAY(DS_S3_aFileMap;Size of array(DS_S3_aFileMap)+1;1)
	//INSERT IN ARRAY(DS_S4_aFileMap;Size of array(DS_S4_aFileMap)+1;1)
	//DS_S4_aFileMap{Size of array(DS_S4_aFileMap)}:="PNGf"
	//DS_S3_aFileMap{Size of array(DS_S3_aFileMap)}:="PNG"
	//End if 
	//$_l_PictureTypeSize:=Find in array(DS_S4_aFileMap;"TIFF")
	//If ($_l_PictureTypeSize<0)
	///INSERT IN ARRAY(DS_S3_aFileMap;Size of array(DS_S3_aFileMap)+1;1)
	//INSERT IN ARRAY(DS_S4_aFileMap;Size of array(DS_S4_aFileMap)+1;1)
	//DS_S4_aFileMap{Size of array(DS_S4_aFileMap)}:="TIFF"
	//DS_S3_aFileMap{Size of array(DS_S3_aFileMap)}:="TIF"
	//End if 
	//$_l_PictureTypeSize:=Find in array(DS_S4_aFileMap;"TPIC")
	//If ($_l_PictureTypeSize<0)
	//INSERT IN ARRAY(DS_S3_aFileMap;Size of array(DS_S3_aFileMap)+1;1)
	//INSERT IN ARRAY(DS_S4_aFileMap;Size of array(DS_S4_aFileMap)+1;1)
	//DS_S4_aFileMap{Size of array(DS_S4_aFileMap)}:="TPIC"
	//DS_S3_aFileMap{Size of array(DS_S3_aFileMap)}:="TGA"
	//End if 
	//$Startup:=(Size of array(CAT_at_PictureTypeExtensions)=0)
	
	// if this is the first time set the default defaults! JPEG AND GIF
	//If ($Startup)  // size was 0
	$_l_PictureTypeSize:=Find in array:C230(CAT_at_PictureMacTypes; "JPEG")
	If ($_l_PictureTypeSize>0)
		CAT_al_SupportedPicTypes{$_l_PictureTypeSize}:=1
		//GIFF
	End if 
	$_l_PictureTypeSize:=Find in array:C230(CAT_at_PictureMacTypes; "GIFf")
	If ($_l_PictureTypeSize>0)
		CAT_al_SupportedPicTypes{$_l_PictureTypeSize}:=1
		//GIFF
	End if 
	//End if 
	
	
	
	If (CAT_t_PictureNaming#"")
		$_l_PictureTypeSize:=Find in array:C230(CAT_at_ImageNameConvention; CAT_t_PictureNaming)
		If ($_l_PictureTypeSize>0)
			CAT_t_PictureNaming:=CAT_t_PictureNaming
		End if 
	End if 
	If (CAT_l_PictureSource>0)
		ARRAY LONGINT:C221(CAT_al_ImageSources; 3)
		ARRAY TEXT:C222(CAT_at_ImageSources; 3)
		
		$_l_PictureTypeSize:=Find in array:C230(CAT_al_ImageSources; CAT_l_PictureSource)
		If ($_l_PictureTypeSize>0)
			CAT_t_CatImageSource:=CAT_at_ImageSources{$_l_PictureTypeSize}
		End if 
	End if 
	If (CAT_l_MaxFolderSize=0)  // i have not put this on screen at the moment
		CAT_l_MaxFolderSize:=50
	End if 
	
	CAT_bo_PrefsLoaded:=True:C214
	
End if 
ERR_MethodTrackerReturn("CAT_LoadPrefs"; $_t_oldMethodName)
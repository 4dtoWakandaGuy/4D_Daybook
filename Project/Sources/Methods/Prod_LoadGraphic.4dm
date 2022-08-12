//%attributes = {}
If (False:C215)
	//Project Method Name:      Prod_LoadGraphic
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 00:12
	//`Method: Prod_LoadGraphic
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PRD_al_CatalogueID;0)
	//ARRAY LONGINT(PRD_al_CatalogueSource;0)
	//ARRAY LONGINT(PRD_al_CatItemNamePREF;0)
	//ARRAY LONGINT(PRD_al_ImageNamePrefs;0)
	//ARRAY LONGINT(PRD_al_PictureDesCatalogueIDs;0)
	//ARRAY TEXT(CAT_at_ImageNameConvention;0)
	//ARRAY TEXT(PRD_at_CatalogueNames;0)
	//ARRAY TEXT(PRD_at_CataloguePath;0)
	//ARRAY TEXT(PRD_at_PictureDestination;0)
	//ARRAY TEXT(PROD_at_MultipleImageNames;0)
	//ARRAY TEXT(PROD_at_MultipleImages;0)
	C_BOOLEAN:C305($_bo_UseGeneralSetting; $0; WS_bo_ImageArrayLoaded)
	C_LONGINT:C283($_l_CatalogueRow; $_l_DestinationRow; $_l_NamingRow; $_l_PicMonitorProcess; $_l_SourceIndex; $_l_SourceRow; CAT_l_PictureSource)
	C_PICTURE:C286($_pic_Nul; PRD_Pic_Graphic)
	C_REAL:C285($_l_ImageWidth; $_r_Ratio; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName; CAT_t_PictureNaming; CAT_T_PicturePath; PROD_t_GraphicPath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod_LoadGraphic")
ARRAY TEXT:C222(PROD_at_MultipleImages; 0)
ARRAY TEXT:C222(PROD_at_MultipleImageNames; 0)
$0:=False:C215
PRD_Pic_Graphic:=$_pic_Nul
PROD_t_GraphicPath:=""
//SET VISIBLE([PRODUCTS]ProductGraphicFileName;False)
//SET VISIBLE(BaddGraphic;False)
If ($1>0)
	//this button will add a graphic to use with this product
	If (Count parameters:C259>=2)
		
		Case of 
			: ($2>0)
				QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=$2)  //NG modified march 2004
				//DS_FindCachedImagePath([Products]ProductCode;computer nam
				PROD_t_GraphicPath:=DS_GetPicturefromDrive([CATALOGUE:108]Image_Path:4; [CATALOGUE:108]Image_NamePref:5; [CATALOGUE:108]Catalogue_Name:2; [PRODUCTS:9]Product_Code:1; [PRODUCTS:9]Short_Code:19; [PRODUCTS:9]Picture_File_Name:44)
				If (Is a document:K24:1=Test path name:C476(PROD_t_GraphicPath))
					READ PICTURE FILE:C678(PROD_t_GraphicPath; PRD_Pic_Graphic)
					$0:=True:C214
					If (Count parameters:C259>=3)
						If ($3>0)  //make low res sized pic($3 is the square to fit in)
							//thumbnail
							PICTURE PROPERTIES:C457(PRD_Pic_Graphic; $_l_ImageWidth; $_l_ImageWidth)
							$_r_Ratio:=$_l_ImageWidth/$3
							CREATE THUMBNAIL:C679(PRD_Pic_Graphic; PRD_Pic_Graphic; $_l_ImageWidth/$_r_Ratio; $3)
							
						End if 
						
					End if 
					//here store cached picture location for this user.
					
					//        SET VISIBLE(BaddGraphic;False)
					//       If (PRD_al_CatItemNamePREF{$ref}=3)
					//         SET VISIBLE([PRODUCTS]ProductGraphicFileName;True)
					//      End if
				Else 
					//       SET VISIBLE(BaddGraphic;False)
					//      SET VISIBLE(PRD_Pic_Graphic;False)
					//      If (PRD_al_CatItemNamePREF{$ref}=3)
					//       SET VISIBLE([PRODUCTS]ProductGraphicFileName;True)
					//     End if
				End if 
			: ($2=0)
				If (CAT_l_PictureSource>0)
					If (Not:C34(WS_bo_ImageArrayLoaded))
						ARRAY TEXT:C222(CAT_at_ImageNameConvention; 3)
						CAT_at_ImageNameConvention{1}:="Use Product Code"
						CAT_at_ImageNameConvention{2}:="Use Product Short Code"
						CAT_at_ImageNameConvention{3}:="Use Image Name on Product"
						WS_bo_ImageArrayLoaded:=True:C214
					End if 
					//Gen_Alert ("Starting to Get_Picture now")
					
					PROD_t_GraphicPath:=DS_GetPicturefromDrive(CAT_T_PicturePath; Find in array:C230(CAT_at_ImageNameConvention; CAT_t_PictureNaming); ""; [PRODUCTS:9]Product_Code:1; [PRODUCTS:9]Short_Code:19; [PRODUCTS:9]Picture_File_Name:44)
					//Gen_Alert ("Got picture")
					
					If (Is a document:K24:1=Test path name:C476(PROD_t_GraphicPath))
						READ PICTURE FILE:C678(PROD_t_GraphicPath; PRD_Pic_Graphic)
						$0:=True:C214
						If (Count parameters:C259>=3)
							If ($3>0)  //make low res sized pic($3 is the square to fit in)
								//thumbnail
								PICTURE PROPERTIES:C457(PRD_Pic_Graphic; $_l_ImageWidth; $_l_ImageWidth)
								$_r_Ratio:=$_l_ImageWidth/$3
								CREATE THUMBNAIL:C679(PRD_Pic_Graphic; PRD_Pic_Graphic; $_l_ImageWidth/$_r_Ratio; $3)
							End if 
							
						End if 
					Else 
						//       SET VISIBLE(BaddGraphic;False)
						//      SET VISIBLE(PRD_Pic_Graphic;False)
						//      If (PRD_al_CatItemNamePREF{$ref}=3)
						//       SET VISIBLE([PRODUCTS]ProductGraphicFileName;True)
						//     End if
					End if 
					
				Else 
					
					QUERY:C277([PICTURES:85]; [PICTURES:85]LinkedTableID:6=Table:C252(->[PRODUCTS:9]); *)
					QUERY:C277([PICTURES:85];  & ; [PICTURES:85]LinkedRecordID:7=[PRODUCTS:9]X_ID:43)
					If (Records in selection:C76([PICTURES:85])>0)
						PRD_Pic_Graphic:=[PICTURES:85]Picture:3
						PROD_t_GraphicPath:="•"+[PICTURES:85]Picture_Name:2
						UNLOAD RECORD:C212([PICTURES:85])
					End if 
				End if 
			: ($2<0)
				$0:=True:C214
				//load multiple images
				//actually we only Load_One image but put the image names and paths into an array
				If (Size of array:C274(PRD_at_CatalogueNames)>0)
					//find the range of paths
					ARRAY TEXT:C222(PRD_at_PictureDestination; 0)
					ARRAY LONGINT:C221(PRD_al_ImageNamePrefs; 0)
					ARRAY LONGINT:C221(PRD_al_PictureDesCatalogueIDs; 0)
					For ($_l_SourceIndex; 1; Size of array:C274(PRD_al_CatalogueSource))
						Case of 
							: (PRD_al_CatalogueSource{$_l_SourceIndex}=1)
								//On Disk
								$_bo_UseGeneralSetting:=False:C215
								$_l_DestinationRow:=Find in array:C230(PRD_at_PictureDestination; PRD_at_CataloguePath{$_l_SourceIndex})
								If ($_l_DestinationRow<0)
									INSERT IN ARRAY:C227(PRD_at_PictureDestination; Size of array:C274(PRD_at_PictureDestination)+1; 1)
									INSERT IN ARRAY:C227(PRD_al_PictureDesCatalogueIDs; Size of array:C274(PRD_al_PictureDesCatalogueIDs)+1; 1)
									PRD_at_PictureDestination{Size of array:C274(PRD_at_PictureDestination)}:=PRD_at_CataloguePath{$_l_SourceIndex}
									PRD_al_PictureDesCatalogueIDs{Size of array:C274(PRD_al_PictureDesCatalogueIDs)}:=PRD_al_CatalogueID{$_l_SourceIndex}
								End if 
							: (PRD_al_CatalogueSource{$_l_SourceIndex}=2)
								//image store in Database
								$_l_DestinationRow:=Find in array:C230(PRD_at_PictureDestination; "IN DATABASE")
								If ($_l_DestinationRow<0)
									INSERT IN ARRAY:C227(PRD_at_PictureDestination; Size of array:C274(PRD_at_PictureDestination)+1; 1)
									INSERT IN ARRAY:C227(PRD_al_PictureDesCatalogueIDs; Size of array:C274(PRD_al_PictureDesCatalogueIDs)+1; 1)
									PRD_at_PictureDestination{Size of array:C274(PRD_at_PictureDestination)}:="IN DATABASE"
									PRD_al_PictureDesCatalogueIDs{Size of array:C274(PRD_al_PictureDesCatalogueIDs)}:=0
								End if 
								$_l_DestinationRow:=Find in array:C230(PRD_al_CatalogueSource; 1)
						End case 
						$_l_NamingRow:=Find in array:C230(PRD_al_ImageNamePrefs; PRD_al_CatItemNamePREF{$_l_SourceIndex})
						If ($_l_NamingRow<0)
							INSERT IN ARRAY:C227(PRD_al_ImageNamePrefs; Size of array:C274(PRD_al_ImageNamePrefs)+1; 1)
							PRD_al_ImageNamePrefs{Size of array:C274(PRD_al_ImageNamePrefs)}:=PRD_al_CatItemNamePREF{$_l_SourceIndex}
						End if 
						
					End for 
					ARRAY TEXT:C222(PROD_at_MultipleImages; 0)
					ARRAY TEXT:C222(PROD_at_MultipleImageNames; 0)
					
					Case of 
						: (Size of array:C274(PRD_at_PictureDestination)>1)
							For ($_l_SourceIndex; Size of array:C274(PRD_at_PictureDestination); 2; -1)
								$_l_CatalogueRow:=Find in array:C230(PRD_al_CatalogueID; PRD_al_PictureDesCatalogueIDs{$_l_SourceIndex})
								If (PRD_at_PictureDestination{$_l_SourceIndex}="IN DATABASE")
									QUERY:C277([PICTURES:85]; [PICTURES:85]LinkedTableID:6=Table:C252(->[PRODUCTS:9]); *)
									QUERY:C277([PICTURES:85];  & ; [PICTURES:85]LinkedRecordID:7=[PRODUCTS:9]X_ID:43)
									If (Records in selection:C76([PICTURES:85])>0)
										PRD_Pic_Graphic:=[PICTURES:85]Picture:3
										PROD_t_GraphicPath:="•"+[PICTURES:85]Picture_Name:2
										UNLOAD RECORD:C212([PICTURES:85])
										
									End if 
								Else 
									PROD_t_GraphicPath:=DS_GetPicturefromDrive(PRD_at_CataloguePath{$_l_CatalogueRow}; PRD_al_CatItemNamePREF{$_l_CatalogueRow}; [CATALOGUE:108]Catalogue_Name:2; [PRODUCTS:9]Product_Code:1; [PRODUCTS:9]Short_Code:19; [PRODUCTS:9]Picture_File_Name:44)
									If (PROD_t_GraphicPath#"")
										INSERT IN ARRAY:C227(PROD_at_MultipleImages; Size of array:C274(PROD_at_MultipleImages)+1; 1)
										INSERT IN ARRAY:C227(PROD_at_MultipleImageNames; Size of array:C274(PROD_at_MultipleImageNames)+1; 1)
										PROD_at_MultipleImages{Size of array:C274(PROD_at_MultipleImages)}:=PROD_t_GraphicPath
										PROD_at_MultipleImageNames{Size of array:C274(PROD_at_MultipleImageNames)}:=FileNamefromPath(PROD_t_GraphicPath)
										
									End if 
								End if 
								If ($_l_SourceIndex=1)
									If (PRD_at_PictureDestination{$_l_SourceIndex}="IN DATABASE")
										If (Count parameters:C259>=3)
											If ($3>0)  //make low res sized pic($3 is the square to fit in)
												//thumbnail
												PICTURE PROPERTIES:C457(PRD_Pic_Graphic; $_l_ImageWidth; $_l_ImageWidth)
												$_r_Ratio:=$_l_ImageWidth/$3
												CREATE THUMBNAIL:C679(PRD_Pic_Graphic; PRD_Pic_Graphic; $_l_ImageWidth/$_r_Ratio; $3)
											End if 
											
										End if 
										
									Else 
										If (Is a document:K24:1=Test path name:C476(PROD_t_GraphicPath))
											READ PICTURE FILE:C678(PROD_t_GraphicPath; PRD_Pic_Graphic)
											//        SET VISIBLE(BaddGraphic;False)
											If (Count parameters:C259>=3)
												If ($3>0)  //make low res sized pic($3 is the square to fit in)
													//thumbnail
													PICTURE PROPERTIES:C457(PRD_Pic_Graphic; $_l_ImageWidth; $_l_ImageWidth)
													$_r_Ratio:=$_l_ImageWidth/$3
													CREATE THUMBNAIL:C679(PRD_Pic_Graphic; PRD_Pic_Graphic; $_l_ImageWidth/$_r_Ratio; $3)
												End if 
												
											End if 
										End if 
									End if 
								End if 
								
							End for 
							
							
						: (Size of array:C274(PRD_at_PictureDestination)=1)
							//only one path
							//but their could be multiple image names
							
					End case 
					
				Else 
					//well there will only be one image then
					
				End if 
				
		End case 
		
		
		
	Else 
		
		If (Size of array:C274(PRD_at_CatalogueNames)>0)
			$_l_SourceRow:=Find in array:C230(PRD_al_CatalogueSource; 1)
			If ($_l_SourceRow>0)
				//Graphic on Disk
				PROD_t_GraphicPath:=DS_GetPicturefromDrive(PRD_at_CataloguePath{$_l_SourceRow}; PRD_al_CatItemNamePREF{$_l_SourceRow}; [CATALOGUE:108]Catalogue_Name:2; [PRODUCTS:9]Product_Code:1; [PRODUCTS:9]Short_Code:19; [PRODUCTS:9]Picture_File_Name:44)
				If (Is a document:K24:1=Test path name:C476(PROD_t_GraphicPath))
					$0:=True:C214
					READ PICTURE FILE:C678(PROD_t_GraphicPath; PRD_Pic_Graphic)
					//        SET VISIBLE(BaddGraphic;False)
					If (Count parameters:C259>=3)
						If ($3>0)  //make low res sized pic($3 is the square to fit in)
							//thumbnail
							PICTURE PROPERTIES:C457(PRD_Pic_Graphic; $_l_ImageWidth; $_l_ImageWidth)
							$_r_Ratio:=$_l_ImageWidth/$3
							CREATE THUMBNAIL:C679(PRD_Pic_Graphic; PRD_Pic_Graphic; $_l_ImageWidth/$_r_Ratio; $3)
						End if 
						
					End if 
				Else 
					//       SET VISIBLE(BaddGraphic;False)
					//      SET VISIBLE(PRD_Pic_Graphic;False)
					//      If (PRD_al_CatItemNamePREF{$ref}=3)
					//       SET VISIBLE([PRODUCTS]ProductGraphicFileName;True)
					//     End if
				End if 
			Else 
				If (CAT_l_PictureSource>0)
					If (Not:C34(WS_bo_ImageArrayLoaded))
						ARRAY TEXT:C222(CAT_at_ImageNameConvention; 3)
						CAT_at_ImageNameConvention{1}:="Use Product Code"
						CAT_at_ImageNameConvention{2}:="Use Product Short Code"
						CAT_at_ImageNameConvention{3}:="Use Image Name on Product"
						WS_bo_ImageArrayLoaded:=True:C214
					End if 
					PROD_t_GraphicPath:=DS_GetPicturefromDrive(CAT_T_PicturePath; Find in array:C230(CAT_at_ImageNameConvention; CAT_t_PictureNaming); ""; [PRODUCTS:9]Product_Code:1; [PRODUCTS:9]Short_Code:19; [PRODUCTS:9]Picture_File_Name:44)
					If (Is a document:K24:1=Test path name:C476(PROD_t_GraphicPath))
						READ PICTURE FILE:C678(PROD_t_GraphicPath; PRD_Pic_Graphic)
						$0:=True:C214
						If (Count parameters:C259>=3)
							If ($3>0)  //make low res sized pic($3 is the square to fit in)
								//thumbnail
								PICTURE PROPERTIES:C457(PRD_Pic_Graphic; $_l_ImageWidth; $_l_ImageWidth)
								$_r_Ratio:=$_l_ImageWidth/$3
								CREATE THUMBNAIL:C679(PRD_Pic_Graphic; PRD_Pic_Graphic; $_l_ImageWidth/$_r_Ratio; $3)
							End if 
							
						End if 
					Else 
						//       SET VISIBLE(BaddGraphic;False)
						//      SET VISIBLE(PRD_Pic_Graphic;False)
						//      If (PRD_al_CatItemNamePREF{$ref}=3)
						//       SET VISIBLE([PRODUCTS]ProductGraphicFileName;True)
						//     End if
					End if 
					
					
					
				Else 
					
					//pic in data base
					//     SET VISIBLE(BaddGraphic;True)
					QUERY:C277([PICTURES:85]; [PICTURES:85]LinkedTableID:6=Table:C252(->[PRODUCTS:9]); *)
					QUERY:C277([PICTURES:85];  & ; [PICTURES:85]LinkedRecordID:7=[PRODUCTS:9]X_ID:43)
					If (Records in selection:C76([PICTURES:85])>0)
						$0:=True:C214
						PRD_Pic_Graphic:=[PICTURES:85]Picture:3
						PROD_t_GraphicPath:="•"+[PICTURES:85]Picture_Name:2
						UNLOAD RECORD:C212([PICTURES:85])
						
					End if 
				End if 
			End if 
			
		Else 
			If (CAT_l_PictureSource>0)
				
				If (Not:C34(WS_bo_ImageArrayLoaded))
					ARRAY TEXT:C222(CAT_at_ImageNameConvention; 3)
					CAT_at_ImageNameConvention{1}:="Use Product Code"
					CAT_at_ImageNameConvention{2}:="Use Product Short Code"
					CAT_at_ImageNameConvention{3}:="Use Image Name on Product"
					WS_bo_ImageArrayLoaded:=True:C214
				End if 
				PROD_t_GraphicPath:=DS_GetPicturefromDrive(CAT_T_PicturePath; Find in array:C230(CAT_at_ImageNameConvention; CAT_t_PictureNaming); ""; [PRODUCTS:9]Product_Code:1; [PRODUCTS:9]Short_Code:19; [PRODUCTS:9]Picture_File_Name:44)
				
				If (Is a document:K24:1=Test path name:C476(PROD_t_GraphicPath))
					$0:=True:C214
					READ PICTURE FILE:C678(PROD_t_GraphicPath; PRD_Pic_Graphic)
					If (Count parameters:C259>=3)
						If ($3>0)  //make low res sized pic($3 is the square to fit in)
							//thumbnail
							PICTURE PROPERTIES:C457(PRD_Pic_Graphic; $_l_ImageWidth; $_l_ImageWidth)
							$_r_Ratio:=$_l_ImageWidth/$3
							CREATE THUMBNAIL:C679(PRD_Pic_Graphic; PRD_Pic_Graphic; $_l_ImageWidth/$_r_Ratio; $3)
						End if 
						
					End if 
				Else 
					
					//       SET VISIBLE(BaddGraphic;False)
					//      SET VISIBLE(PRD_Pic_Graphic;False)
					//      If (PRD_al_CatItemNamePREF{$ref}=3)
					//       SET VISIBLE([PRODUCTS]ProductGraphicFileName;True)
					//     End if
				End if 
				
				
				
			Else 
				
				//not in a catalogue so must be  a pic
				//    SET VISIBLE(BaddGraphic;True)
				QUERY:C277([PICTURES:85]; [PICTURES:85]LinkedTableID:6=Table:C252(->[PRODUCTS:9]); *)
				QUERY:C277([PICTURES:85];  & ; [PICTURES:85]LinkedRecordID:7=[PRODUCTS:9]X_ID:43)
				If (Records in selection:C76([PICTURES:85])>0)
					$0:=True:C214
					PRD_Pic_Graphic:=[PICTURES:85]Picture:3
					PROD_t_GraphicPath:="•"+[PICTURES:85]Picture_Name:2
					UNLOAD RECORD:C212([PICTURES:85])
					
				End if 
			End if 
		End if 
		
	End if 
	
End if 

$_l_PicMonitorProcess:=New process:C317("PIC_l_PictureMonitor"; 128000; "CheckForNewPictures"; *)
ERR_MethodTrackerReturn("Prod_LoadGraphic"; $_t_oldMethodName)
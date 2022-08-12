If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_CatalogueSelected;0)
	//ARRAY LONGINT(PRD_al_CatalogueID;0)
	//ARRAY LONGINT(PRD_al_CatalogueSource;0)
	//ARRAY LONGINT(PRD_al_CatItemNamePREF;0)
	//ARRAY LONGINT(PRD_al_ImageNamePrefs;0)
	//ARRAY LONGINT(PRD_al_PictureDesCatalogueIDs;0)
	ARRAY TEXT:C222($_at_ExpectedName; 0)
	ARRAY TEXT:C222($_at_SaveName; 0)
	//ARRAY TEXT(CAT_at_ImageNameConvention;0)
	//ARRAY TEXT(PRD_at_CatalogueNames;0)
	//ARRAY TEXT(PRD_at_CataloguePath;0)
	//ARRAY TEXT(PRD_at_PictureDestination;0)
	C_BOOLEAN:C305($_bo_UseGeneralSetting)
	C_LONGINT:C283($_l_CatalogueCount; $_l_CatalogueIndex; $_l_CatalogueRow; $_l_Clash; $_l_ConventionRow; $_l_DestinationRow; $_l_ImageNameRow; $_l_ItemIndex; CAT_l_PageNumber; CAT_l_PictureSource; CAT_l_SaveSettings)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_PICTURE:C286(PRD_Pic_Graphic)
	C_TEXT:C284($_t_CatalogueName; $_t_CurrentImageName; $_t_ExpectedImageName; $_t_NameWithoutExtension; $_t_oldMethodName; $_t_PictureCode; $_t_SaveImageName; CAT_t_PictureNaming; CAT_T_PicturePath; DB_t_CurrentFormUsage; PROD_t_GraphicPath)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS]Products_in2009.Variable5"; Form event code:C388)


//from prods in cat
$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.Variable5"; Form event code:C388)
//this button will add a graphic to use with this product
If ([PRODUCTS:9]X_ID:43=0)
	[PRODUCTS:9]X_ID:43:=AA_GetNextIDinMethod(->[PRODUCTS:9]X_ID:43)
End if 

//If (Size of array(PRD_at_CatalogueNames)>0)

//Else
//not in a catalogue so must be  a pic
//If (Records in selection([PICTURES])=0)
READ PICTURE FILE:C678(""; PRD_Pic_Graphic)
If (Picture size:C356(PRD_Pic_Graphic)>0) & (OK=1)
	[PRODUCTS:9]Picture_File_Name:44:=DocNameFromPath(Document)
	PROD_t_GraphicPath:=Document
	If (Size of array:C274(PRD_at_CatalogueNames)>0)
		ARRAY TEXT:C222(PRD_at_PictureDestination; 0)
		ARRAY LONGINT:C221(PRD_al_ImageNamePrefs; 0)
		ARRAY LONGINT:C221(PRD_al_PictureDesCatalogueIDs; 0)
		For ($_l_CatalogueIndex; 1; Size of array:C274(PRD_al_CatalogueSource))
			Case of 
				: (PRD_al_CatalogueSource{$_l_CatalogueIndex}=1)
					//On Disk
					$_bo_UseGeneralSetting:=False:C215
					$_l_DestinationRow:=Find in array:C230(PRD_at_PictureDestination; PRD_at_CataloguePath{$_l_CatalogueIndex})
					If ($_l_DestinationRow<0)
						INSERT IN ARRAY:C227(PRD_at_PictureDestination; Size of array:C274(PRD_at_PictureDestination)+1; 1)
						INSERT IN ARRAY:C227(PRD_al_PictureDesCatalogueIDs; Size of array:C274(PRD_al_PictureDesCatalogueIDs)+1; 1)
						PRD_at_PictureDestination{Size of array:C274(PRD_at_PictureDestination)}:=PRD_at_CataloguePath{$_l_CatalogueIndex}
						PRD_al_PictureDesCatalogueIDs{Size of array:C274(PRD_al_PictureDesCatalogueIDs)}:=PRD_al_CatalogueID{$_l_CatalogueIndex}
					End if 
				: (PRD_al_CatalogueSource{$_l_CatalogueIndex}=2)
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
			$_l_DestinationRow:=Find in array:C230(PRD_al_ImageNamePrefs; PRD_al_CatItemNamePREF{$_l_CatalogueIndex})
			If ($_l_DestinationRow<0)
				INSERT IN ARRAY:C227(PRD_al_ImageNamePrefs; Size of array:C274(PRD_al_ImageNamePrefs)+1; 1)
				PRD_al_ImageNamePrefs{Size of array:C274(PRD_al_ImageNamePrefs)}:=PRD_al_CatItemNamePREF{$_l_CatalogueIndex}
			End if 
			
		End for 
		Case of 
			: (Size of array:C274(PRD_at_PictureDestination)>1)
				//give the user choices here
				ARRAY LONGINT:C221(CAT_al_CatalogueSelected; 0)
				ARRAY LONGINT:C221(CAT_al_CatalogueSelected; Size of array:C274(PRD_al_PictureDesCatalogueIDs))
				CAT_l_PageNumber:=2
				WIN_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
				
				WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 1)
				DIALOG:C40([USER:15]; "CAT_Selector")
				CLOSE WINDOW:C154
				WIN_l_CurrentWinRef:=WIN_l_CurrentWinRefOLD
				If (CAT_l_SaveSettings=0)  //dont save
					ARRAY LONGINT:C221(CAT_al_CatalogueSelected; 0)
					ARRAY LONGINT:C221(CAT_al_CatalogueSelected; Size of array:C274(PRD_al_PictureDesCatalogueIDs))
				End if 
				
			: (Size of array:C274(PRD_at_PictureDestination)=1)
				If (PRD_at_PictureDestination{1}=CAT_T_PicturePath)
					//it is the general setting anyway
					$_bo_UseGeneralSetting:=True:C214
				Else 
					$_bo_UseGeneralSetting:=False:C215
					ARRAY LONGINT:C221(CAT_al_CatalogueSelected; 1)
					CAT_al_CatalogueSelected{1}:=1
				End if 
				
		End case 
		
	Else 
		$_bo_UseGeneralSetting:=True:C214
	End if 
	
	
	If ($_bo_UseGeneralSetting)
		If (CAT_l_PictureSource>0)
			ARRAY TEXT:C222(CAT_at_ImageNameConvention; 3)
			CAT_at_ImageNameConvention{1}:="Use Product Code"
			CAT_at_ImageNameConvention{2}:="Use Product Short Code"
			CAT_at_ImageNameConvention{3}:="Use Image Name on Product"
			$_l_ConventionRow:=Find in array:C230(CAT_at_ImageNameConvention; CAT_t_PictureNaming)
			Case of 
				: ($_l_ConventionRow=1)
					$_t_ExpectedImageName:=[PRODUCTS:9]Product_Code:1
					$_t_ExpectedImageName:=DS_ResolvedPictureName($_t_ExpectedImageName)
					
					
				: ($_l_ConventionRow=2)
					$_t_ExpectedImageName:=[PRODUCTS:9]Short_Code:19
					$_t_ExpectedImageName:=DS_ResolvedPictureName($_t_ExpectedImageName)
				: ($_l_ConventionRow=3)
					$_t_ExpectedImageName:=[PRODUCTS:9]Picture_File_Name:44
					
				Else 
					$_t_ExpectedImageName:=[PRODUCTS:9]Picture_File_Name:44
			End case 
			If (Length:C16([PRODUCTS:9]Picture_File_Name:44)>4)
				If ([PRODUCTS:9]Picture_File_Name:44[[(Length:C16([PRODUCTS:9]Picture_File_Name:44)-3)]]=".")
					$_t_NameWithoutExtension:=Substring:C12([PRODUCTS:9]Picture_File_Name:44; 1; Length:C16([PRODUCTS:9]Picture_File_Name:44)-4)
					$_t_CurrentImageName:=[PRODUCTS:9]Picture_File_Name:44
				Else 
					$_t_NameWithoutExtension:=[PRODUCTS:9]Picture_File_Name:44
					$_t_CurrentImageName:=[PRODUCTS:9]Picture_File_Name:44
				End if 
			Else 
				$_t_NameWithoutExtension:=[PRODUCTS:9]Picture_File_Name:44
				$_t_CurrentImageName:=[PRODUCTS:9]Picture_File_Name:44
			End if 
			If ($_t_NameWithoutExtension#$_t_ExpectedImageName) & ($_t_CurrentImageName#$_t_ExpectedImageName)
				Gen_Confirm("Change image name from "+$_t_NameWithoutExtension+" to "+$_t_ExpectedImageName; "Yes"; "No")
				If (OK=1)
					[PRODUCTS:9]Picture_File_Name:44:=$_t_ExpectedImageName
					
				End if 
			Else 
				[PRODUCTS:9]Picture_File_Name:44:=$_t_ExpectedImageName
			End if 
			DS_SendPicturetoDrive(Document; 0; [PRODUCTS:9]Picture_File_Name:44)
			
			
		Else 
			//on disk
			READ WRITE:C146([PICTURES:85])
			QUERY:C277([PICTURES:85]; [PICTURES:85]LinkedTableID:6=Table:C252(->[PRODUCTS:9]); *)
			QUERY:C277([PICTURES:85];  & ; [PICTURES:85]LinkedRecordID:7=[PRODUCTS:9]X_ID:43)
			If (Records in selection:C76([PICTURES:85])=0)
				CREATE RECORD:C68([PICTURES:85])
				[PICTURES:85]x_ID:5:=AA_GetNextIDinMethod(->[PICTURES:85]x_ID:5)
				[PICTURES:85]LinkedTableID:6:=Table:C252(->[PRODUCTS:9])
				[PICTURES:85]LinkedRecordID:7:=[PRODUCTS:9]X_ID:43
				
				Repeat 
					$_t_PictureCode:=Substring:C12(DB_t_CurrentFormUsage; 1; 3)+"/"+String:C10(AA_GetNextIDinMethod(->[PICTURES:85]Picture_Code:1; Sequence number:C244([PICTURES:85])))
					SET QUERY DESTINATION:C396(3; $_l_Clash)
					QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=$_t_PictureCode)
					SET QUERY DESTINATION:C396(0)
				Until ($_l_Clash=0)
				[PICTURES:85]Picture_Code:1:=$_t_PictureCode
			End if 
			[PICTURES:85]Picture_Name:2:=[PRODUCTS:9]Product_Name:2
			[PICTURES:85]Picture:3:=PRD_Pic_Graphic
			DB_SaveRecord(->[PICTURES:85])
			AA_CheckFileUnlocked(->[PICTURES:85]x_ID:5)
			PRD_Pic_Graphic:=[PICTURES:85]Picture:3
			UNLOAD RECORD:C212([PICTURES:85])
		End if 
	Else 
		//use catalogue specific setting
		ARRAY TEXT:C222($_at_ExpectedName; 0)
		ARRAY TEXT:C222($_at_SaveName; 0)
		For ($_l_CatalogueIndex; 1; Size of array:C274(CAT_al_CatalogueSelected))
			If (CAT_al_CatalogueSelected{$_l_CatalogueIndex}=1)
				If (PRD_at_PictureDestination{$_l_CatalogueIndex}="IN DATABASE")
					READ WRITE:C146([PICTURES:85])
					QUERY:C277([PICTURES:85]; [PICTURES:85]LinkedTableID:6=Table:C252(->[PRODUCTS:9]); *)
					QUERY:C277([PICTURES:85];  & ; [PICTURES:85]LinkedRecordID:7=[PRODUCTS:9]X_ID:43)
					If (Records in selection:C76([PICTURES:85])=0)
						CREATE RECORD:C68([PICTURES:85])
						[PICTURES:85]x_ID:5:=AA_GetNextIDinMethod(->[PICTURES:85]x_ID:5)
						[PICTURES:85]LinkedTableID:6:=Table:C252(->[PRODUCTS:9])
						[PICTURES:85]LinkedRecordID:7:=[PRODUCTS:9]X_ID:43
						
						Repeat 
							$_t_PictureCode:=Substring:C12(DB_t_CurrentFormUsage; 1; 3)+"/"+String:C10(AA_GetNextIDinMethod(->[PICTURES:85]Picture_Code:1; Sequence number:C244([PICTURES:85])))
							SET QUERY DESTINATION:C396(3; $_l_Clash)
							QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=$_t_PictureCode)
							SET QUERY DESTINATION:C396(0)
						Until ($_l_Clash=0)
						[PICTURES:85]Picture_Code:1:=$_t_PictureCode
					End if 
					[PICTURES:85]Picture_Name:2:=[PRODUCTS:9]Product_Name:2
					[PICTURES:85]Picture:3:=PRD_Pic_Graphic
					DB_SaveRecord(->[PICTURES:85])
					AA_CheckFileUnlocked(->[PICTURES:85]x_ID:5)
					PRD_Pic_Graphic:=[PICTURES:85]Picture:3
					UNLOAD RECORD:C212([PICTURES:85])
					
					
				Else 
					$_l_CatalogueRow:=Find in array:C230(PRD_al_CatalogueID; PRD_al_PictureDesCatalogueIDs{$_l_CatalogueIndex})
					Case of 
						: (PRD_al_CatItemNamePREF{$_l_CatalogueRow}=1)
							$_t_ExpectedImageName:=[PRODUCTS:9]Product_Code:1
							$_t_ExpectedImageName:=DS_ResolvedPictureName($_t_ExpectedImageName)
						: (PRD_al_CatItemNamePREF{$_l_CatalogueRow}=2)
							$_t_ExpectedImageName:=[PRODUCTS:9]Short_Code:19
							$_t_ExpectedImageName:=DS_ResolvedPictureName($_t_ExpectedImageName)
						: (PRD_al_CatItemNamePREF{$_l_CatalogueRow}=3)
							$_t_ExpectedImageName:=[PRODUCTS:9]Picture_File_Name:44
						Else 
							$_t_ExpectedImageName:=[PRODUCTS:9]Picture_File_Name:44
					End case 
					If (Length:C16([PRODUCTS:9]Picture_File_Name:44)>4)
						If ([PRODUCTS:9]Picture_File_Name:44[[(Length:C16([PRODUCTS:9]Picture_File_Name:44)-3)]]=".")
							$_t_NameWithoutExtension:=Substring:C12([PRODUCTS:9]Picture_File_Name:44; 1; Length:C16([PRODUCTS:9]Picture_File_Name:44)-4)
							$_t_CurrentImageName:=[PRODUCTS:9]Picture_File_Name:44
						Else 
							$_t_NameWithoutExtension:=[PRODUCTS:9]Picture_File_Name:44
							$_t_CurrentImageName:=[PRODUCTS:9]Picture_File_Name:44
						End if 
					Else 
						$_t_NameWithoutExtension:=[PRODUCTS:9]Picture_File_Name:44
						$_t_CurrentImageName:=[PRODUCTS:9]Picture_File_Name:44
					End if 
					If ($_t_NameWithoutExtension#$_t_ExpectedImageName) & ($_t_CurrentImageName#$_t_ExpectedImageName)
						//file has an extension
						INSERT IN ARRAY:C227($_at_ExpectedName; Size of array:C274($_at_ExpectedName)+1; 1)
						INSERT IN ARRAY:C227($_at_SaveName; Size of array:C274($_at_SaveName)+1; 1)
						$_l_ImageNameRow:=Find in array:C230($_at_ExpectedName; $_t_ExpectedImageName)
						$_at_ExpectedName{Size of array:C274($_at_ExpectedName)}:=$_t_ExpectedImageName
						If ($_l_ImageNameRow<0)
							$_t_CatalogueName:=""
							$_l_CatalogueCount:=0
							For ($_l_ItemIndex; 1; Size of array:C274(PRD_al_CatItemNamePREF))
								If (PRD_al_CatItemNamePREF{$_l_ItemIndex}=PRD_al_CatItemNamePREF{$_l_CatalogueRow})
									//same as this one
									$_l_DestinationRow:=Find in array:C230(PRD_al_PictureDesCatalogueIDs; PRD_al_CatalogueID{$_l_ItemIndex})
									If ($_l_DestinationRow>0)
										If (CAT_al_CatalogueSelected{$_l_DestinationRow}=1)
											$_l_CatalogueCount:=$_l_CatalogueCount+1
											//and we are saving that path
											If ($_t_CatalogueName#"")
												$_t_CatalogueName:=$_t_CatalogueName+", "+PRD_at_CatalogueNames{$_l_ItemIndex}
											Else 
												$_t_CatalogueName:=PRD_at_CatalogueNames{$_l_ItemIndex}
											End if 
										End if 
										
									End if 
								End if 
								
							End for 
							//we now have a list of the catalogues this name change applies to
							If ($_l_CatalogueCount>1)
								Gen_Confirm(" For the catalogues+"+$_t_CatalogueName+"change image name from"+$_t_NameWithoutExtension+"to"+$_t_ExpectedImageName+"?"; "Yes"; "No")
							Else 
								Gen_Confirm(" For the catalogue+"+$_t_CatalogueName+"change image name from "+$_t_NameWithoutExtension+"to"+$_t_ExpectedImageName+"?"; "Yes"; "No")
							End if 
							
							If (OK=1)
								$_at_SaveName{Size of array:C274($_at_SaveName)}:=$_t_ExpectedImageName
							Else 
								$_at_SaveName{Size of array:C274($_at_SaveName)}:=[PRODUCTS:9]Picture_File_Name:44
							End if 
						Else 
							$_t_SaveImageName:=$_at_SaveName{$_l_ImageNameRow}
						End if 
						
					Else 
						$_t_SaveImageName:=[PRODUCTS:9]Picture_File_Name:44
					End if 
					
					DS_SendPicturetoDrive(Document; PRD_al_PictureDesCatalogueIDs{$_l_CatalogueIndex}; $_t_SaveImageName)
				End if 
				
			End if 
		End for 
		
	End if 
End if 




//End if
//End if
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.Variable5"; $_t_oldMethodName)
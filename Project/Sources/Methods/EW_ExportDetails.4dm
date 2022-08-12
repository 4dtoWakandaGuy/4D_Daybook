//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_ExportDetails
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_FamilyName1;0)
	//ARRAY LONGINT(CAT_al_FamilyName2;0)
	//ARRAY LONGINT(CAT_al_FamilyName3;0)
	//ARRAY LONGINT(CAT_al_FamilyName4;0)
	//ARRAY LONGINT(CAT_al_FamilyName5;0)
	//ARRAY LONGINT(WS_al_ALLfamilies;0)
	ARRAY TEXT:C222($_at_PictureTypes; 0)
	//ARRAY TEXT(CAT_at_FAMILYNAME1;0)
	//ARRAY TEXT(CAT_at_FAMILYNAME2;0)
	//ARRAY TEXT(CAT_at_FAMILYNAME3;0)
	//ARRAY TEXT(CAT_at_FamilyName4;0)
	//ARRAY TEXT(CAT_at_FAMILYNAME5;0)
	//ARRAY TEXT(EW_at_BKCodes;0)
	//ARRAY TEXT(EW_at_C01Codes;0)
	//ARRAY TEXT(EW_at_CombinedCodes;0)
	//ARRAY TEXT(EW_at_DaybookCodes;0)
	//ARRAY TEXT(EW_atCombinedCodes;0)
	//ARRAY TEXT(EW_at_FolderPathName;0)
	//ARRAY TEXT(EW_at_PicturePath;0)
	C_BOOLEAN:C305($_bo_Active; $_bo_Include; $_bo_OK; $_bo_Skip; EW_bo_ThermUpdate; EW_bo_Continue; yCatalogueExport; yHasPics)
	C_LONGINT:C283($_l_CountRecord; $_l_Duration; $_l_FamilyIDPOsition; $_l_index; $_l_Index2; $_l_Index3; $_l_Iteration; $_l_ListID; $_l_NumberofRecords; $_l_ServerPort; $_l_StepCount)
	C_LONGINT:C283($_l_Timeout; EW_FamilyLevels)
	C_POINTER:C301($_ptr_CodeField; $_Ptr_FamilyIDArray; $_Ptr_FamilyNameArray; $_ptr_Table; $1)
	C_REAL:C285(EW_counter; EW_i; EW_iIncrement; EW_irecordcount; EW_iThermcount; lRecordCount; lThermoProcess)
	C_TEXT:C284($_t_BlankHeadings; $_t_DocPathName; $_t_ExportText; $_t_ExtraItems; $_t_FamilyHeadings; $_t_FamilyText; $_t_IPAddress; $_t_itemCode; $_t_ItemCodes; $_t_oldMethodName; $_t_Password)
	C_TEXT:C284($_t_ResultText; $_t_StoreCode; $_t_SubCatagory; $_t_SubCatText; $_t_SubHeadingsL02Added; $_t_SubheadingsL03Added; $_t_Text; BK_t_ItemCodes; EW_catname; EW_PicType; EW_schedule)
	C_TEXT:C284(EW_t_ModuleName; s2RecordDelimiter; s3FieldDelimiter; tHeadings; tlocalFolderPath; tRepeatData; tTableName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_ExportDetails")
// EW_ExportDetails
// 08/09/02 pb


$_ptr_Table:=$1
EW_t_ModuleName:=""
$_l_CountRecord:=Records in selection:C76($_ptr_Table->)
ARRAY TEXT:C222(CAT_at_FAMILYNAME1; 0)
ARRAY LONGINT:C221(CAT_al_FamilyName1; 0)
ARRAY TEXT:C222(CAT_at_FAMILYNAME2; 0)
ARRAY LONGINT:C221(CAT_al_FamilyName2; 0)
ARRAY TEXT:C222(CAT_at_FAMILYNAME3; 0)
ARRAY LONGINT:C221(CAT_al_FamilyName3; 0)
ARRAY TEXT:C222(CAT_at_FamilyName4; 0)
ARRAY LONGINT:C221(CAT_al_FamilyName4; 0)
ARRAY TEXT:C222(CAT_at_FAMILYNAME5; 0)
ARRAY LONGINT:C221(CAT_al_FamilyName5; 0)
$_t_SubHeadingsL02Added:=""  // keep track of subhead records that have been created
// so they don't get repeatedly created
$_t_SubheadingsL03Added:=""
If ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
	// get list of existing records from the BK
	Case of 
		: ([EW_ExportSteps:118]BaseTablenumber:3=Table:C252(->[PRODUCTS:9]))
			EW_t_ModuleName:="ITM"
			$_ptr_CodeField:=->[PRODUCTS:9]Product_Code:1
			//  $_ptr_CodeField:=->[Catalogue_ProductLink]x_ProductID  ` 25/11/03
			$_l_ListID:=AA_LoadList(->[CATALOGUE:108]EW_Family:6; ->CAT_at_FAMILYNAME1; ->CAT_al_FamilyName1; False:C215)  // loads arrays of category (family) names and numbers
			$_l_ListID:=AA_LoadListByName("E commerce Family 2"; ->CAT_at_FAMILYNAME2; ->CAT_al_FamilyName2; True:C214)  // not sure why this one is True
			$_l_ListID:=AA_LoadListByName("E commerce Family 3"; ->CAT_at_FamilyName3; ->CAT_al_FamilyName3; False:C215)
			$_l_ListID:=AA_LoadListByName("E commerce Family 4"; ->CAT_at_FamilyName4; ->CAT_al_FamilyName4; False:C215)
			$_l_ListID:=AA_LoadListByName("E commerce Family 5"; ->CAT_at_FAMILYNAME5; ->CAT_al_FamilyName5; False:C215)
		: ([EW_ExportSteps:118]BaseTablenumber:3=Table:C252(->[CONTACTS:1]))
			EW_t_ModuleName:="CUS"
			$_ptr_CodeField:=->[CONTACTS:1]Contact_Code:2
		Else 
			// error!
			//TRACE
	End case 
	EW_BKGetKeyFieldInfo(EW_t_ModuleName)
	$_t_FamilyHeadings:=EW_FindFieldName("[L01]")+Char:C90(9)
	$_t_BlankHeadings:=Char:C90(9)
	If (Size of array:C274(CAT_at_FAMILYNAME2)>0)
		$_t_FamilyHeadings:=$_t_FamilyHeadings+EW_FindFieldName("[L02]")+Char:C90(9)
		$_t_BlankHeadings:=$_t_BlankHeadings+Char:C90(9)
	End if 
	If (Size of array:C274(CAT_at_FamilyName3)>0)
		$_t_FamilyHeadings:=$_t_FamilyHeadings+EW_FindFieldName("[L03]")+Char:C90(9)
		$_t_BlankHeadings:=$_t_BlankHeadings+Char:C90(9)
	End if 
	If (Size of array:C274(CAT_at_FamilyName4)>0)
		$_t_FamilyHeadings:=$_t_FamilyHeadings+EW_FindFieldName("[L04]")+Char:C90(9)
		$_t_BlankHeadings:=$_t_BlankHeadings+Char:C90(9)
	End if 
	If (Size of array:C274(CAT_at_FAMILYNAME5)>0)
		$_t_FamilyHeadings:=$_t_FamilyHeadings+EW_FindFieldName("[L05]")+Char:C90(9)
		$_t_BlankHeadings:=$_t_BlankHeadings+Char:C90(9)
	End if 
	// ARRAY TEXT(EW_atItemCodes;$_l_CountRecord)
	ARRAY TEXT:C222(EW_at_FolderPathName; 0)
	ARRAY TEXT:C222(EW_at_PicturePath; 0)
	ARRAY TEXT:C222(EW_at_C01Codes; 0)
	ARRAY TEXT:C222(EW_at_FolderPathName; $_l_CountRecord)
	ARRAY TEXT:C222(EW_at_PicturePath; $_l_CountRecord)
	ARRAY TEXT:C222(EW_at_C01Codes; $_l_CountRecord)
	$_t_ExtraItems:=""  // this will hold the bogus Item "SubHeading" records
	//             if the [EW_ExportProjects]BKL03IsSubcategory option is selected
	
	// Create a text file to contain the update details
	$_t_DocPathName:="temp.txt"
	$_l_Iteration:=0
	While (Test path name:C476($_t_DocPathName)=Is a document:K24:1)
		$_l_Iteration:=$_l_Iteration+1
		$_t_DocPathName:="temp"+String:C10($_l_Iteration)+".txt"
	End while 
	$_ti_DocumentRef:=DB_CreateDocument($_t_DocPathName)
	
	// Folder for temporary storage of pictures
	tlocalFolderPath:=DB_GetDocumentPath+"EW_BKPictures"+Directory_Symbol
	If (Test path name:C476(tlocalFolderPath)#Is a folder:K24:2)
		CREATE FOLDER:C475(tlocalFolderPath)
	End if 
	ARRAY TEXT:C222($_at_PictureTypes; 0)
	_O_PICTURE TYPE LIST:C681($_at_PictureTypes)
	If (Find in array:C230($_at_PictureTypes; "jpeg")>0)
		EW_PicType:="JPEG"
	Else 
		EW_PicType:="PICT"
	End if 
	ARRAY TEXT:C222($_at_PictureTypes; 0)
Else   // not business kit
	// ARRAY TEXT(EW_atItemCodes;0)
	ARRAY TEXT:C222(EW_at_PicturePath; 0)
End if 

ORDER BY:C49([EW_StepActions:119]; [EW_StepActions:119]ActionOrder:3)
tHeadings:=""
If ([EW_ExportProjects:117]IncludefieldHeadings:10) | ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
	If (([EW_ExportTables:120]Order:4=1) | ([EW_ExportProjects:117]ExportToSeparatefiles:14=True:C214)) | ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")  // 26/11/02 pb
		EW_FieldHeadings2
	End if 
End if 
SEND PACKET:C103($_ti_DocumentRef; tHeadings+Char:C90(13))
lRecordCount:=-1
$_t_ExportText:=""  // for the BK Customers and Items updates
FIRST RECORD:C50($_ptr_Table->)

// For the Business Kit: details of pictures to send to Items
yHasPics:=False:C215

For ($_l_NumberofRecords; 1; $_l_CountRecord)
	$_bo_Active:=True:C214
	$_bo_Include:=True:C214
	Case of 
		: ([EW_ExportSteps:118]BaseTablenumber:3=Table:C252(->[CONTACTS:1]))
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
			// products?
	End case 
	If (EW_schedule="L")
		If (Process state:C330(lThermoProcess)<0)  // User pressed Cancel button on the thermometer
			EW_bo_Continue:=False:C215
		End if 
		If ([EW_ExportProjects:117]ExportToSeparatefiles:14=True:C214) | ([EW_ExportTables:120]Order:4=1)
			Case of 
				: (yCatalogueExport)
					If (EW_bo_ThermUpdate)
						EW_iThermcount:=EW_iThermcount+EW_iIncrement
						SET_THERMOMETER("Exporting from table "+tTableName+": "+String:C10(EW_i)+" of "+String:C10(EW_irecordcount); EW_iThermcount)
					End if 
				Else 
					EW_iThermcount:=EW_iThermcount+EW_iIncrement
					SET_THERMOMETER("Exporting from table "+tTableName+": "+String:C10($_l_NumberofRecords)+" of "+String:C10(EW_irecordcount); EW_iThermcount)
			End case 
		End if 
		$_bo_Skip:=False:C215
		Case of 
			: (Table:C252($_ptr_Table)=Table:C252(->[COMPANIES:2])) & ([COMPANIES:2]Deleted:61=1)
				$_bo_Skip:=True:C214
			: (Table:C252($_ptr_Table)=Table:C252(->[CONTACTS:1])) & (([CONTACTS:1]Deleted:32=1) | ([COMPANIES:2]Deleted:61=1))  // 16/09/03 pb
				$_bo_Skip:=True:C214
		End case 
		If (EW_bo_Continue=False:C215)
			$_l_NumberofRecords:=$_l_CountRecord
		Else 
			If ($_bo_Skip=False:C215)
				$_t_Text:=""
				If ([EW_ExportTables:120]Order:4=1)
					tRepeatData:=""
					Case of 
						: (yCatalogueExport)
							For ($_l_Index3; 1; EW_FamilyLevels)
								$_Ptr_FamilyNameArray:=Get pointer:C304("CAT_at_CatLinkFamilyName"+String:C10($_l_Index3))
								$_t_Text:=$_t_Text+$_Ptr_FamilyNameArray->{EW_counter}+s3FieldDelimiter
							End for 
					End case 
				End if 
				QUERY:C277([EW_StepActions:119]; [EW_StepActions:119]StepTableRecordNumber:1=[EW_ExportTables:120]RecordNumber:2)  // yes this does need to be done HERE
				ORDER BY:C49([EW_StepActions:119]; [EW_StepActions:119]ActionOrder:3)
				FIRST RECORD:C50([EW_StepActions:119])
				$_t_itemCode:=""
				If ([EW_ExportTables:120]SubFieldNumber:7>0)  // we are exporting subtable data
					$_l_StepCount:=1  // 'cos it is all handled in exportsubtables
				Else 
					$_l_StepCount:=Records in selection:C76([EW_StepActions:119])
				End if 
				For ($_l_Index2; 1; $_l_StepCount)
					If (EW_bo_Continue=False:C215)
						$_l_Index2:=$_l_StepCount
					Else 
						If (EW_t_ModuleName="itm") & ($_l_Index2=1)
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]X_ID:43=[Catalogue_ProductLink:109]x_ProductID:3)  // 25/11/03
						End if 
						$_t_Text:=$_t_Text+EW_ExportNowSteps
						Case of 
							: ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
								If ($_l_Index2=1)  // item code or CusCode must be the first detail in the export details list
									//  $active:="1"
									$_t_ItemCodes:=[Catalogue_ProductLink:109]EW_BKReference:9+"/"+$_ptr_CodeField->
									// If (Find in array(EW_at_DaybookCodes;$_ptr_CodeField->)>0)
									If (Find in array:C230(EW_at_CombinedCodes; $_t_ItemCodes)>0)
										//  $_t_itemCode:=EW_at_BKCodes{Find in array
										//(EW_at_DaybookCodes;$_ptr_CodeField->)}
										$_t_itemCode:=EW_at_BKCodes{Find in array:C230(EW_at_CombinedCodes; $_t_ItemCodes)}
									Else 
										$_bo_OK:=False:C215
										While ($_bo_OK=False:C215)
											$_t_itemCode:=String:C10(AA_GetNextID(->BK_t_ItemCodes))
											If (Length:C16($_t_itemCode)<5)
												For ($_l_Iteration; 1; 5-Length:C16($_t_itemCode))
													$_t_itemCode:="0"+$_t_itemCode
												End for 
											End if 
											If (Find in array:C230(EW_at_BKCodes; $_t_itemCode)<1)
												$_bo_OK:=True:C214
											End if 
										End while 
										[Catalogue_ProductLink:109]EW_BKReference:9:=$_t_itemCode
										SAVE RECORD:C53([Catalogue_ProductLink:109])
									End if 
									$_t_ExportText:=$_t_ExportText+$_t_itemCode  // +Char(9)
									
									If (EW_t_ModuleName="itm")  // Products (Items)
										$_Ptr_FamilyNameArray:=Field:C253([EW_StepActions:119]TableNumber:9; [EW_StepActions:119]FieldNumber:6)
										//                 QUERY([Catalogue_ProductLink]; & ;[Catalogue_ProductLink]Status
										If ([Catalogue_ProductLink:109]Status:6=1)  // active?
											$_t_ExportText:=$_t_ExportText+Char:C90(9)+"1"+Char:C90(9)  // Active
										Else 
											$_bo_Active:=False:C215
											//  If (Find in array(EW_at_DaybookCodes;$_ptr_CodeField->)<1)
											If (Find in array:C230(EW_at_CombinedCodes; $_t_ItemCodes)<1)
												// it does not already exist in the Bk
												// so does not need to be included in the update
												$_bo_Include:=False:C215
											Else   // delete it from the BK db
												// $_t_ExportText:=$_t_ExportText+Char(34)+"DEL"+Char(34)+Char(9)  ` delete
												$_t_ExportText:=$_t_ExportText+"*DEL*"+Char:C90(9)  // delete
												ADD TO SET:C119([Catalogue_ProductLink:109]; "deletes")
											End if 
										End if 
										QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=[Catalogue_ProductLink:109]X_CatalogueID:2)
										If (Records in selection:C76([CATALOGUE:108])>0)
											$_l_FamilyIDPOsition:=Find in array:C230(CAT_al_FamilyName1; [CATALOGUE:108]EW_Family:6)
											If ($_l_FamilyIDPOsition>0)
												EW_catname:=CAT_at_FAMILYNAME1{Find in array:C230(CAT_al_FamilyName1; [CATALOGUE:108]EW_Family:6)}
												$_t_ExportText:=$_t_ExportText+EW_catname+Char:C90(9)  // Family 1
											Else 
												$_t_ExportText:=$_t_ExportText+Char:C90(9)  // Family 1
											End if 
											
											// other family levels
											If ($_bo_Include)
												ARRAY LONGINT:C221(WS_al_ALLfamilies; 0)
												BLOB TO VARIABLE:C533([Catalogue_ProductLink:109]EW_Families:7; WS_al_ALLfamilies)
												$_t_FamilyText:=""
												For ($_l_index; 1; Size of array:C274(WS_al_ALLfamilies))
													$_Ptr_FamilyNameArray:=Get pointer:C304("CAT_at_FamiliyName"+String:C10($_l_index+1))
													$_Ptr_FamilyIDArray:=Get pointer:C304("CAT_al_FamilyName"+String:C10($_l_index+1))
													$_l_FamilyIDPOsition:=Find in array:C230($_Ptr_FamilyIDArray->; WS_al_ALLfamilies{$_l_index})
													Case of 
														: (WS_al_ALLfamilies{$_l_index}=0) & (Size of array:C274($_Ptr_FamilyNameArray->)>0)
															$_t_FamilyText:=$_t_FamilyText+Char:C90(9)
															
														: ($_l_FamilyIDPOsition>0)
															$_t_SubCatagory:=Substring:C12($_Ptr_FamilyNameArray->{$_l_FamilyIDPOsition}; 1; 30)
															$_t_SubCatText:="~"+$_t_SubCatagory+"~"
															If ([EW_ExportProjects:117]BKL03IsSubcategory:36) & ($_l_index=1)
																If (Position:C15($_t_SubCatText; $_t_SubHeadingsL02Added)<1)
																	$_t_SubHeadingsL02Added:=$_t_SubHeadingsL02Added+$_t_SubCatText
																	If (Find in array:C230(EW_at_DaybookCodes; $_t_SubCatagory)<1)
																		// we need to create a bogus Item record for it
																		// to act as the SubHeading
																		$_t_ExtraItems:=$_t_ExtraItems+$_t_SubCatagory+Char:C90(9)+"1"+Char:C90(9)+EW_catname+Char:C90(9)  // C01, Active, L01
																		$_t_ExtraItems:=$_t_ExtraItems+$_t_SubCatagory+Char:C90(9)+"Nil"+Char:C90(9)+"Nil"+Char:C90(9)  // , L02, L03, L04
																		$_t_ExtraItems:=$_t_ExtraItems+$_t_SubCatagory+Char:C90(9)+$_t_SubCatagory+Char:C90(13)  // C04, T01
																		//   $_t_ExtraItems:=$_t_ExtraItems+$_t_SubCatagory+Char(9)+$_t_SubCatagory+Char(9)  ` , L02, L03, L04
																	End if 
																	EW_AddPictureName2Array($_t_SubCatagory; $_t_SubCatagory)
																	// also check to see if there is a larger picture for this subcategory
																	EW_AddPictureName2Array($_t_SubCatagory+"_2"; $_t_SubCatagory)
																	
																End if 
															End if 
															
															If ([EW_ExportProjects:117]BKL03IsSubcategory:36) & ($_l_index=3)
																//                               $_t_SubCatagory:=Substring($_Ptr_FamilyNameArray->{$_l_FamilyIDPOsition};1;30)
																If (Position:C15($_t_SubCatText; $_t_SubheadingsL03Added)<1)
																	$_t_SubheadingsL03Added:=$_t_SubheadingsL03Added+$_t_SubCatText
																	//  If (Find in array(EW_at_DaybookCodes;$_t_SubCatagory)<1)
																	// we need to create a bogus Item record for it
																	// to act as the SubHeading
																	$_t_ExtraItems:=$_t_ExtraItems+$_t_SubCatagory+Char:C90(9)+"1"+Char:C90(9)+EW_catname+Char:C90(9)  // C01, Active, L01
																	$_t_ExtraItems:=$_t_ExtraItems+$_t_FamilyText+"Nil"+Char:C90(9)  // , L02, L03, L04
																	$_t_ExtraItems:=$_t_ExtraItems+$_t_SubCatagory+Char:C90(9)+$_t_SubCatagory  // C04, T01
																	
																	// this is a really bad kludge to create a description
																	//  for the subcategory heading for EFX data! 11/11/03 pb
																	$_t_ExtraItems:=$_t_ExtraItems+Char:C90(9)+[PRODUCTS:9]Description:6
																	$_t_ExtraItems:=$_t_ExtraItems+Char:C90(13)
																	//      End if
																	
																	
																	EW_AddPictureName2Array($_t_SubCatagory; $_t_SubCatagory)
																	// also check to see if there is a larger picture for this subcategory
																	EW_AddPictureName2Array($_t_SubCatagory+"_2"; $_t_SubCatagory)
																	
																End if 
															End if 
															$_t_FamilyText:=$_t_FamilyText+$_Ptr_FamilyNameArray->{$_l_FamilyIDPOsition}+Char:C90(9)
															
														: (Size of array:C274($_Ptr_FamilyNameArray->)=0)
															// don't bother to include the family level placeholder
														Else 
															$_t_FamilyText:=$_t_FamilyText+Char:C90(9)
													End case 
												End for 
												$_t_ExportText:=$_t_ExportText+$_t_FamilyText
											Else 
												$_t_ExportText:=$_t_ExportText+$_t_BlankHeadings  // Family 1 - 5
											End if 
										End if   // $_bo_Include
										
										//  Pictures?
										If ([EW_ExportProjects:117]BKUpdatePictures:33) & ($_bo_Active)
											EW_PictureSetup($_l_NumberofRecords)
											EW_at_C01Codes{$_l_NumberofRecords}:=$_t_itemCode
										End if   // export pics
										
									End if   // Items
									$_t_ExportText:=$_t_ExportText+$_t_Text
								Else 
									$_t_ExportText:=$_t_ExportText+$_t_Text
								End if 
								
							Else 
								If ([EW_ExportTables:120]Order:4=1) & ([EW_ExportProjects:117]ExportToSeparatefiles:14=False:C215)  // 26/11/02 pb
									tRepeatData:=tRepeatData+$_t_Text+s3FieldDelimiter
								End if 
								// Leave out the parent record data  for now ...
								If ((Length:C16($_t_ExportText)+Length:C16($_t_Text)+Length:C16(tRepeatData))>30000)
									EW_SendPacket(->$_t_ExportText)
									EW_SendPacket(->$_t_Text)
								Else 
									If ([EW_ExportProjects:117]ExportToSeparatefiles:14) | ([EW_ExportTables:120]Order:4=1) | (([EW_StepActions:119]ActionOrder:3>1) & ([EW_ExportTables:120]Order:4>1))  // 28/11/02
										$_t_ExportText:=$_t_ExportText+$_t_Text
									Else 
										$_t_ExportText:=$_t_ExportText+tRepeatData+$_t_Text  // 28/11/02
									End if 
								End if 
								Case of 
									: ([EW_ExportTables:120]SubFieldNumber:7>0)
										// add  nothing!
									: ($_l_Index2=Records in selection:C76([EW_StepActions:119]))
										$_t_ExportText:=$_t_ExportText+s2RecordDelimiter
									Else 
										$_t_ExportText:=$_t_ExportText+s3FieldDelimiter
										//                 tRepeatData:=tRepeatData+s3FieldDelimiter
								End case 
						End case 
						If ($_l_Index2<$_l_StepCount)
							$_t_ExportText:=$_t_ExportText+Char:C90(9)
						End if 
						NEXT RECORD:C51([EW_StepActions:119])
					End if   // can't continue
					$_t_Text:=""
				End for 
				// $_t_ExportText:=$_t_ExportText+Char(13)
				Case of 
					: (EW_bo_Continue=False:C215)
						// our job here is done ...
					: ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
						$_t_ExportText:=$_t_ExportText+Char:C90(13)  // 4/12/03
						If ($_bo_Include)
							SEND PACKET:C103($_ti_DocumentRef; $_t_ExportText)
						End if 
						If (Length:C16($_t_ExtraItems)>0)
							SEND PACKET:C103($_ti_DocumentRef; $_t_ExtraItems)
							$_t_ExtraItems:=""
						End if 
						$_t_ExportText:=""
						
					: ([EW_ExportProjects:117]IncludeParentRecordData:13=True:C214) & ([EW_ExportProjects:117]ExportToSeparatefiles:14=False:C215)  // include related data in same file
						// find the related records and export them now
						If (Records in selection:C76([EW_ExportTables:120])>1) & ([EW_ExportTables:120]Order:4=1)
							For ($_l_Iteration; 1; Records in selection:C76([EW_ExportTables:120])-1)
								NEXT RECORD:C51([EW_ExportTables:120])
								EW_ExportNowTables
							End for 
							FIRST RECORD:C50([EW_ExportTables:120])
						End if 
				End case 
				
			End if   // skip
			NEXT RECORD:C51($_ptr_Table->)
		End if   // can't continue
	End if 
End for   // records in selection

If ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
	SEND PACKET:C103($_ti_DocumentRef; $_t_ExtraItems)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	$_t_IPAddress:=[EW_ExportProjects:117]BKIPAddress:22
	$_l_ServerPort:=[EW_ExportProjects:117]BKServerPort:23
	$_l_Timeout:=[EW_ExportProjects:117]BKTimeout:30
	$_l_Duration:=[EW_ExportProjects:117]BKMaxDuration:31
	$_t_Password:=[EW_ExportProjects:117]BKPassword:32
	$_t_StoreCode:=[EW_ExportProjects:117]BKStoreCode:24
	SET_THERMOMETER("Transferring data to the Business Kit …"; EW_iThermcount)
	$_t_ResultText:=""
	//$_t_ResultText:=4DBKC_ExportFileTo4DBK ($_t_IPAddress;$_l_ServerPort;$_l_Timeout;$_l_Duration;$_t_Password;$_t_StoreCode;EW_t_ModuleName;"";$_t_DocPathName)
	If ($_t_ResultText#"")
		EW_ErrorMessages($_t_ResultText)
	End if 
	EW_TransferPictures
	DELETE DOCUMENT:C159($_t_DocPathName)
End if 
ARRAY TEXT:C222(CAT_at_FAMILYNAME2; 0)
ARRAY LONGINT:C221(CAT_al_FamilyName2; 0)
ARRAY TEXT:C222(CAT_at_FAMILYNAME3; 0)
ARRAY LONGINT:C221(CAT_al_FamilyName3; 0)
ARRAY TEXT:C222(CAT_at_FamilyName4; 0)
ARRAY LONGINT:C221(CAT_al_FamilyName4; 0)
ARRAY TEXT:C222(CAT_at_FAMILYNAME5; 0)
ARRAY LONGINT:C221(CAT_al_FamilyName5; 0)
ERR_MethodTrackerReturn("EW_ExportDetails"; $_t_oldMethodName)
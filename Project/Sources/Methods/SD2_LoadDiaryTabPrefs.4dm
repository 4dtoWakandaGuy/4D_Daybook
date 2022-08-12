//%attributes = {}

If (False:C215)
	//Project Method Name:      SD2_LoadDiaryTabPrefs
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
	//ARRAY LONGINT(SD2_al_DiaryDefaultTabIDs;0)
	//ARRAY LONGINT(SD2_al_DiaryTabIDS;0)
	//ARRAY LONGINT(SD2_al_DiaryUserIDs;0)
	//ARRAY LONGINT(SD2_AL_TABCONTEXT;0)
	//ARRAY LONGINT(SD2_al_TabDefs;0)
	//ARRAY LONGINT(SD2_al_TabIds;0;0)
	C_BLOB:C604($_Blb_EmptyBlob; $_Blb_NewBlob)
	C_BOOLEAN:C305($_bo_FindUniversal; $_bo_load; $_bo_Ok; $1)
	C_LONGINT:C283($_l_DelayFactor; $_l_index; $_l_ItemID; $_l_offset; $_l_Repeats; $_l_SizeofArray; $_l_SizeofArray2; $_l_TabIDRow; $_l_TabIDtoAdd; $_l_TableNumber)
	C_OBJECT:C1216($_obj_ListLayouts; $_obj_Personnel; $_obj_personnelGroups; $_obj_Preference; $_obj_Preferences; $_obj_Status)
	C_POINTER:C301($2; $3; $4)
	C_REAL:C285($0; SD_LAYOUTREFS)
	C_TEXT:C284($_t_CurrentDefinitionsName; $_t_LayoutReference; $_t_oldMethodName; $_t_TableNumAsString)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadDiaryTabPrefs")

//This method loads preferences for the dairy tabs on the diary viewer
//there are 3 primary things we need to know
//1) The Preferred tab to open at(if this is not set we open at 'ALL")
//2)The definitions to use with each tab. Because the number of tabs in use witht the diary is flexible we cannot hardcode the definitions to use with any given tab. Therefore these definitions will be 3+String(Table(»[diary]))+nn
//3) The parameters to use with that definition-filters

//NG this method loads the problem type settings. Each problem type may create one or more Diary Actions(workflows)
$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadDiaryTabPrefs")
$0:=0
//NG March 2005
// New method to load diary action classes
While (Semaphore:C143("LoadingDiaryTabPrefs"))
	DelayTicks(2)
End while 

$_l_ItemID:=PREF_GetPreferenceID("Diary View Prefs")
$_obj_Preferences:=ds:C1482.PREFERENCES.query("IDNumber =:1"; $_l_ItemID)

//QUERY([PREFERENCES]; [PREFERENCES]IDNumber=$_l_ItemID)  //One record for the database
If ($_obj_Preferences.length>0)
	//If (Records in selection([PREFERENCES])>0)
	$_bo_Ok:=False:C215
	$_l_Repeats:=0
	$_l_DelayFactor:=1
	$_obj_Preference:=$_obj_Preferences[0]
	$_obj_Status:=$_obj_Preference.lock()
	Repeat 
		$_l_Repeats:=$_l_Repeats+1
		$_obj_Status:=$_obj_Preference.lock()
		If (Not:C34($_obj_Status.success))
			If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
				//only increase every 10 tries
				$_l_DelayFactor:=$_l_DelayFactor+1  //increase the delay factor by 1
			End if 
			DelayTicks(2*$_l_DelayFactor)
		End if 
	Until ($_obj_Status.success)
	
	
	//Repeat 
	//$_l_Repeats:=$_l_Repeats+1
	///$_bo_Ok:=Check_Locked(->[PREFERENCES]; 1)
	//If (Not($_bo_Ok))
	//I//f (($_l_Repeats/10)=(Int($_l_Repeats/10)))
	//only increase every 10 tries
	//$_l_DelayFactor:=$_l_DelayFactor+1  //increase the delay factor by 1
	//End if 
	//DelayTicks(2*$_l_DelayFactor)
	
	//End if 
	//Until ($_bo_Ok=True)
Else 
	$_obj_Preference:=ds:C1482.PREFERENCES.new("IDNumber"; $_l_ItemID)
	$_obj_Preference.IDNumber:=$_l_ItemID
	DB_SaveEntity($_obj_Preference)
	$_bo_Ok:=False:C215
	
	$_l_Repeats:=0
	$_l_DelayFactor:=1
	$_obj_Preference:=$_obj_Preferences[0]
	$_obj_Status:=$_obj_Preference.lock()
	Repeat 
		$_l_Repeats:=$_l_Repeats+1
		$_obj_Status:=$_obj_Preference.lock()
		If (Not:C34($_obj_Status.success))
			If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
				//only increase every 10 tries
				$_l_DelayFactor:=$_l_DelayFactor+1  //increase the delay factor by 1
			End if 
			DelayTicks(2*$_l_DelayFactor)
		End if 
	Until ($_obj_Status.success)
End if 

//If (Records in selection([PREFERENCES])=0)
///add the the preferences list here
//READ WRITE([PREFERENCES])
//CREATE RECORD([PREFERENCES])
//[PREFERENCES]IDNumber:=$_l_ItemID
//DB_SaveRecord(->[PREFERENCES])

//End if 
$_bo_load:=True:C214
If (Count parameters:C259>=1)
	$_bo_load:=$1
End if 
If ($_bo_load=False:C215)  // save updated values
	
	
	//READ WRITE([PREFERENCES])
	//While (Not(Check_Locked(->[PREFERENCES]; 0)))
	//DelayTicks(10)
	//End while 
	SET BLOB SIZE:C606($_Blb_NewBlob; 0)
	VARIABLE TO BLOB:C532(SD2_al_DiaryUserIDs; $_Blb_NewBlob; *)
	VARIABLE TO BLOB:C532(SD2_al_DiaryDefaultTabIDs; $_Blb_NewBlob; *)
	For ($_l_index; 1; Size of array:C274(SD2_al_DiaryUserIDs))  //
		VARIABLE TO BLOB:C532(SD2_al_DiaryTabIDS{$_l_index}; $_Blb_NewBlob; *)
	End for 
	For ($_l_index; 1; Size of array:C274(SD2_al_DiaryUserIDs))  //
		VARIABLE TO BLOB:C532(SD2_al_TabDefs{$_l_index}; $_Blb_NewBlob; *)
	End for 
	$_obj_Preference.DataBlob:=$_Blb_EmptyBlob
	DB_SaveEntity($_obj_Preference)
	
	//SET BLOB SIZE([PREFERENCES]DataBlob; 0)
	//VARIABLE TO BLOB(SD2_al_DiaryUserIDs; [PREFERENCES]DataBlob; *)
	//VARIABLE TO BLOB(SD2_al_DiaryDefaultTabIDs; [PREFERENCES]DataBlob; *)
	//DB_SaveRecord(->[PREFERENCES])
	//UNLOAD RECORD([PREFERENCES])
	//READ ONLY([PREFERENCES])
	
Else 
	$_l_offset:=0
	ARRAY LONGINT:C221(SD2_al_DiaryUserIDs; 0)  // List ofusers
	ARRAY LONGINT:C221(SD2_al_DiaryDefaultTabIDs; 0)  // List of preferenced default tab ID for each user
	ARRAY LONGINT:C221(SD2_al_DiaryTabIDS; 0; 0)  // The tab IDS used by the user-only stored here to match with the next array-definitions reference
	ARRAY LONGINT:C221(SD2_al_TabDefs; 0; 0)  //List of Definitions for the user
	ARRAY LONGINT:C221(SD2_al_TabDefs; 0; 0)  //This array will contain preference to filter values etc
	If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
		BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; SD2_al_DiaryUserIDs; $_l_offset)
		If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
			BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; SD2_al_DiaryDefaultTabIDs; $_l_offset)
			
			$_l_SizeofArray:=Size of array:C274(SD2_al_DiaryUserIDs)
			ARRAY LONGINT:C221(SD2_al_TabIds; $_l_SizeofArray)  //LIST OF definitions for each user
			ARRAY LONGINT:C221(SD2_al_DiaryTabIDS; $_l_SizeofArray; 0)
			$_l_SizeofArray2:=0
			For ($_l_index; 1; $_l_SizeofArray)
				If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
					BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; SD2_al_DiaryTabIDS{$_l_index}; $_l_offset)
				Else 
					$_l_index:=$_l_SizeofArray
				End if 
			End for 
			For ($_l_index; 1; $_l_SizeofArray)
				If (BLOB size:C605($_obj_Preference.DataBlob)>$_l_offset)
					BLOB TO VARIABLE:C533($_obj_Preference.DataBlob; SD2_al_TabDefs{$_l_index}; $_l_offset)
				Else 
					$_l_index:=$_l_SizeofArray
				End if 
			End for 
			
		End if 
		If (Count parameters:C259>=2)
			$_l_TabIDRow:=Find in array:C230(SD2_al_DiaryUserIDs; $2)
			If ($_l_TabIDRow>0)
				$0:=$_l_TabIDRow
			Else 
				$_obj_Personnel:=ds:C1482.PERSONNEL.query("Personnel_ID =:1"; $2)
				//QUERY([PERSONNEL]; [PERSONNEL]Personnel_ID=$2)  //NG jan 2008---is this correct???
				If ($_obj_Personnel.length>0)
					$_bo_FindUniversal:=False:C215
					If ($_obj_Personnel[0].Group_Code#"")
						$_obj_personnelGroups:=ds:C1482.PERSONNEL_GROUPS.query("Group_Code =:1"; $_obj_Personnel[0].Group_Code)
						//QUERY([PERSONNEL_GROUPS]; [PERSONNEL_GROUPS]Group_Code=[PERSONNEL]Group_Code)
						If ($_obj_personnelGroups.length>0)
							$_l_TabIDRow:=Find in array:C230(SD2_al_DiaryUserIDs; -($_obj_personnelGroups[0].x_ID))
							If ($_l_TabIDRow>0)  // A SETTING FOR EVERYONE IN THE GROUP
								$0:=$_l_TabIDRow
							Else 
								$_bo_FindUniversal:=True:C214
							End if 
						Else 
							$_bo_FindUniversal:=True:C214
						End if 
					Else 
						//Group codes are not used so just look for universal
						$_bo_FindUniversal:=True:C214
					End if 
				Else 
					$_bo_FindUniversal:=True:C214
				End if 
				If ($_bo_FindUniversal)
					$_l_TabIDRow:=Find in array:C230(SD2_al_DiaryUserIDs; -1)
					// UNIVERSAL
					If ($_l_TabIDRow>0)
						$0:=$_l_TabIDRow
					Else 
						//``
						Repeat   //
							SD_LAYOUTREFS:=0
							SD_LAYOUTREFS:=AA_GetNextID(->SD_LAYOUTREFS; 20)  //START THE REF NUMBERS AT 20
							$_l_TableNumber:=Table:C252(->[DIARY:12])
							If ($_l_TableNumber<10)
								$_t_TableNumAsString:=("00"*Num:C11($_l_TableNumber<10))+String:C10($_l_TableNumber)
							Else 
								$_t_TableNumAsString:=("0"*Num:C11($_l_TableNumber<100))+String:C10($_l_TableNumber)
							End if 
							$_t_LayoutReference:=("0"*Num:C11(SD_LAYOUTREFS<10))+String:C10(SD_LAYOUTREFS)
							$_t_CurrentDefinitionsName:=$_t_TableNumAsString+$_t_LayoutReference
							$_obj_ListLayouts:=ds:C1482.LIST_LAYOUTS.query("Layout_Reference =:1"; $_t_CurrentDefinitionsName)
							//QUERY([LIST_LAYOUTS]; [LIST_LAYOUTS]Layout_Reference=$_t_CurrentDefinitionsName)
						Until ($_obj_ListLayouts.length=0)  //(Records in selection([LIST_LAYOUTS])=0)
						$_obj_ListLayouts:=ds:C1482.LIST_LAYOUTS.query("Layout_Reference =:1"; "01212")
						
						//QUERY([LIST_LAYOUTS]; [LIST_LAYOUTS]Layout_Reference="01212")  // NEED TO CHECK IT LAYOUT REF CAN COPE WITH GOING OVER 100!
						If ($_obj_ListLayouts.length=0)  //THIS IS THE DEFAULT DEFINITION FROM WHICH OTHERS ARE BUILD(EACH VIEW CAN BE DIFFERENT IF YOU WANT!)
							LBi_ListLay("01212")
						End if 
						//APPEND TO ARRAY(SD2_al_DiaryUserIDs;-1)
						//APPEND TO ARRAY(SD2_al_DiaryUserIDs;◊UserID)  `append the current user
						APPEND TO ARRAY:C911(SD2_al_DiaryDefaultTabIDs; 0)
						INSERT IN ARRAY:C227(SD2_al_DiaryTabIDS; Size of array:C274(SD2_al_DiaryTabIDS)+1; 1)
						INSERT IN ARRAY:C227(SD2_al_TabDefs; Size of array:C274(SD2_al_TabDefs)+1; 1)
						
						$_l_TabIDRow:=Find in array:C230(SD2_AL_TABCONTEXT; Table:C252(->[DIARY:12]))
						If ($_l_TabIDRow>0)
							For ($_l_index; 1; Size of array:C274(SD2_AL_TABIDS))
								$_l_TabIDtoAdd:=SD2_AL_TABIDS{$_l_TabIDRow}
								APPEND TO ARRAY:C911(SD2_al_DiaryTabIDS{Size of array:C274(SD2_al_DiaryTabIDS)}; $_l_TabIDtoAdd)
								//Here duplicate the Definitions and make a new set for this setup
								If (SD_LAYOUTREFS=0)
									Repeat   //
										SD_LAYOUTREFS:=0
										SD_LAYOUTREFS:=AA_GetNextID(->SD_LAYOUTREFS; 20)  //START THE REF NUMBERS AT 20
										$_l_TableNumber:=Table:C252(->[DIARY:12])
										If ($_l_TableNumber<10)
											$_t_TableNumAsString:=("00"*Num:C11($_l_TableNumber<10))+String:C10($_l_TableNumber)
										Else 
											$_t_TableNumAsString:=("0"*Num:C11($_l_TableNumber<100))+String:C10($_l_TableNumber)
										End if 
										$_t_LayoutReference:=("0"*Num:C11(SD_LAYOUTREFS<10))+String:C10(SD_LAYOUTREFS)
										$_t_CurrentDefinitionsName:=$_t_TableNumAsString+$_t_LayoutReference
										$_obj_ListLayouts:=ds:C1482.LIST_LAYOUTS.query("Layout_Reference =:1"; $_t_CurrentDefinitionsName)
										
										//QUERY([LIST_LAYOUTS]; [LIST_LAYOUTS]Layout_Reference=$_t_CurrentDefinitionsName)
									Until (Records in selection:C76([LIST_LAYOUTS:96])=0)
									
								End if 
								$_l_TableNumber:=Table:C252(->[DIARY:12])
								If ($_l_TableNumber<10)
									$_t_TableNumAsString:=("00"*Num:C11($_l_TableNumber<10))+String:C10($_l_TableNumber)
								Else 
									$_t_TableNumAsString:=("0"*Num:C11($_l_TableNumber<100))+String:C10($_l_TableNumber)
								End if 
								$_t_LayoutReference:=("0"*Num:C11(SD_LAYOUTREFS<10))+String:C10(SD_LAYOUTREFS)
								$_t_CurrentDefinitionsName:=$_t_TableNumAsString+$_t_LayoutReference
								APPEND TO ARRAY:C911(SD2_al_TabDefs{Size of array:C274(SD2_al_TabDefs)}; SD_LAYOUTREFS)
								
								LBi_ListFindDup("01212"; ""; $_t_CurrentDefinitionsName)
								SD_LAYOUTREFS:=0
							End for 
						End if 
						$0:=1
						//Make a universal setting
						//and make a group setting too
					End if 
					
				End if 
			End if 
		Else 
			$0:=0
		End if 
	Else 
		// The diary actions have not been classified
		//und so we create some defaults here
		Repeat   //
			SD_LAYOUTREFS:=0
			SD_LAYOUTREFS:=AA_GetNextID(->SD_LAYOUTREFS; 20)  //START THE REF NUMBERS AT 20
			$_l_TableNumber:=Table:C252(->[DIARY:12])
			If ($_l_TableNumber<10)
				$_t_TableNumAsString:=("00"*Num:C11($_l_TableNumber<10))+String:C10($_l_TableNumber)
			Else 
				$_t_TableNumAsString:=("0"*Num:C11($_l_TableNumber<100))+String:C10($_l_TableNumber)
			End if 
			$_t_LayoutReference:=("0"*Num:C11(SD_LAYOUTREFS<10))+String:C10(SD_LAYOUTREFS)
			$_t_CurrentDefinitionsName:=$_t_TableNumAsString+$_t_LayoutReference
			$_obj_ListLayouts:=ds:C1482.LIST_LAYOUTS.query("Layout_Reference =:1"; $_t_CurrentDefinitionsName)
			
			//QUERY([LIST_LAYOUTS]; [LIST_LAYOUTS]Layout_Reference=$_t_CurrentDefinitionsName)
		Until ($_obj_ListLayouts.length=0)
		$_obj_ListLayouts:=ds:C1482.LIST_LAYOUTS.query("Layout_Reference =:1"; "01212")
		
		//QUERY([LIST_LAYOUTS]; [LIST_LAYOUTS]Layout_Reference="01212")  // NEED TO CHECK IT LAYOUT REF CAN COPE WITH GOING OVER 100!
		If ($_obj_ListLayouts.length=0)  //(Records in selection([LIST_LAYOUTS])=0)
			//THIS IS THE DEFAULT DEFINITION FROM WHICH OTHERS ARE BUILD(EACH VIEW CAN BE DIFFERENT IF YOU WANT!)
			LBi_ListLay("01212")
			
		End if 
		//APPEND TO ARRAY(SD2_al_DiaryUserIDs;-1)
		//APPEND TO ARRAY(SD2_al_DiaryUserIDs;◊UserID)  `append the current user
		APPEND TO ARRAY:C911(SD2_al_DiaryDefaultTabIDs; 0)
		INSERT IN ARRAY:C227(SD2_al_DiaryTabIDS; Size of array:C274(SD2_al_DiaryTabIDS)+1; 1)
		INSERT IN ARRAY:C227(SD2_al_TabDefs; Size of array:C274(SD2_al_TabDefs)+1; 1)
		
		$_l_TabIDRow:=Find in array:C230(SD2_AL_TABCONTEXT; Table:C252(->[DIARY:12]))
		If ($_l_TabIDRow>0)
			For ($_l_index; 1; Size of array:C274(SD2_AL_TABIDS))
				APPEND TO ARRAY:C911(SD2_al_DiaryTabIDS{Size of array:C274(SD2_al_DiaryTabIDS)}; SD2_AL_TABIDS{$_l_TabIDRow})
				//Here duplicate the Definitions and make a new set for this setup
				If (SD_LAYOUTREFS=0)
					Repeat   //
						SD_LAYOUTREFS:=0
						SD_LAYOUTREFS:=AA_GetNextID(->SD_LAYOUTREFS; 20)  //START THE REF NUMBERS AT 20
						$_l_TableNumber:=Table:C252(->[DIARY:12])
						If ($_l_TableNumber<10)
							$_t_TableNumAsString:=("00"*Num:C11($_l_TableNumber<10))+String:C10($_l_TableNumber)
						Else 
							$_t_TableNumAsString:=("0"*Num:C11($_l_TableNumber<100))+String:C10($_l_TableNumber)
						End if 
						$_t_LayoutReference:=("0"*Num:C11(SD_LAYOUTREFS<10))+String:C10(SD_LAYOUTREFS)
						$_t_CurrentDefinitionsName:=$_t_TableNumAsString+$_t_LayoutReference
						$_obj_ListLayouts:=ds:C1482.LIST_LAYOUTS.query("Layout_Reference =:1"; $_t_CurrentDefinitionsName)
						
						//QUERY([LIST_LAYOUTS]; [LIST_LAYOUTS]Layout_Reference=$_t_CurrentDefinitionsName)
					Until (Records in selection:C76([LIST_LAYOUTS:96])=0)
					
				End if 
				$_l_TableNumber:=Table:C252(->[DIARY:12])
				If ($_l_TableNumber<10)
					$_t_TableNumAsString:=("00"*Num:C11($_l_TableNumber<10))+String:C10($_l_TableNumber)
				Else 
					$_t_TableNumAsString:=("0"*Num:C11($_l_TableNumber<100))+String:C10($_l_TableNumber)
				End if 
				$_t_LayoutReference:=("0"*Num:C11(SD_LAYOUTREFS<10))+String:C10(SD_LAYOUTREFS)
				$_t_CurrentDefinitionsName:=$_t_TableNumAsString+$_t_LayoutReference
				APPEND TO ARRAY:C911(SD2_al_TabDefs{Size of array:C274(SD2_al_TabDefs)}; SD_LAYOUTREFS)
				
				LBi_ListFindDup("01212"; ""; $_t_CurrentDefinitionsName)
				SD_LAYOUTREFS:=0
			End for 
		End if 
		//That gives us a ref to all the current
		//ARRAY LONGINT(SD2_al_DiaryTabIDS;0;0)
		//ARRAY LONGINT(SD2_al_TabDefs;0;0)  `List of Definitions for the user
		//ARRAY LONGINT(SD2_al_TabDefs;0;0)
		
		$0:=1
	End if 
End if 
$_obj_Status:=$_obj_Preference.unlock()
//UNLOAD RECORD([PREFERENCES])
CLEAR SEMAPHORE:C144("LoadingDiaryTabPrefs")
ERR_MethodTrackerReturn("SD2_LoadDiaryTabPrefs"; $_t_oldMethodName)

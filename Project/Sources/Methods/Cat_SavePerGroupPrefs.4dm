//%attributes = {}
If (False:C215)
	//Project Method Name:      Cat_SavePerGroupPrefs
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
	//ARRAY INTEGER(CAT_aI_CatalogueDF;0)
	//ARRAY INTEGER(CAT_aI_CatalogueEXC;0)
	//ARRAY INTEGER(CAT_aI_CatalogueINC;0)
	ARRAY LONGINT:C221($_al_AvailableCatalogueIDS; 0)
	ARRAY LONGINT:C221($_al_AvailableCatalogueIDS2; 0)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	C_BOOLEAN:C305(CAT_bo_ChangePrefs)
	C_LONGINT:C283($_l_IDRow; $_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cat_SavePerGroupPrefs")
If (CAT_bo_ChangePrefs)
	READ WRITE:C146([Catalogue_Availability:110])
	QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]Person_Or_GroupID:2=-([PERSONNEL_GROUPS:92]x_ID:12)*10)
	DB_lockFile(->[Catalogue_Availability:110])
	APPLY TO SELECTION:C70([Catalogue_Availability:110]; [Catalogue_Availability:110]Default:4:=False:C215)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[Catalogue_Availability:110]))
	
	
	QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]Person_Or_GroupID:2=(-([PERSONNEL_GROUPS:92]x_ID:12)*10); *)
	QUERY:C277([Catalogue_Availability:110];  & ; [Catalogue_Availability:110]FilterOUT:5=False:C215)
	QUERY:C277([Catalogue_Availability:110];  & ; [Catalogue_Availability:110]FilterOUT:5=True:C214)
	SELECTION TO ARRAY:C260([Catalogue_Availability:110]x_ID:1; $_al_AvailableCatalogueIDS)
	QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]Person_Or_GroupID:2=(-([PERSONNEL_GROUPS:92]x_ID:12)*10); *)
	QUERY:C277([Catalogue_Availability:110];  & ; [Catalogue_Availability:110]FilterOUT:5=True:C214)
	SELECTION TO ARRAY:C260([Catalogue_Availability:110]x_ID:1; $_al_AvailableCatalogueIDS2)
	For ($_l_Index; 1; Size of array:C274($_al_AvailableCatalogueIDS))
		$_l_IDRow:=Find in array:C230(CAT_al_CatalogueID; $_al_AvailableCatalogueIDS{$_l_Index})
		If ($_l_IDRow>0)  // it should be!!
			If (CAT_aI_CatalogueINC{$_l_IDRow}=0)
				//no longer included
				QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]x_ID:1=$_al_AvailableCatalogueIDS{$_l_Index})
				If (CAT_aI_CatalogueEXC{$_l_IDRow}=1)  //to be Excluded
					[Catalogue_Availability:110]FilterOUT:5:=True:C214
					DB_SaveRecord(->[Catalogue_Availability:110])
					AA_CheckFileUnlocked(->[Catalogue_Availability:110]x_ID:1)
				Else   //delete
					DB_DeletionControl(->[Catalogue_Availability:110])
					
					DELETE RECORD:C58([Catalogue_Availability:110])
				End if 
			End if 
		End if 
	End for 
	For ($_l_Index; 1; Size of array:C274($_al_AvailableCatalogueIDS2))
		$_l_IDRow:=Find in array:C230(CAT_al_CatalogueID; $_al_AvailableCatalogueIDS2{$_l_Index})
		If ($_l_IDRow>0)  // it should be!!
			If (CAT_aI_CatalogueEXC{$_l_IDRow}=0)
				//no longer excluded
				QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]x_ID:1=$_al_AvailableCatalogueIDS2{$_l_Index})
				If (CAT_aI_CatalogueINC{$_l_IDRow}=1)  //to be INCLUDED
					[Catalogue_Availability:110]FilterOUT:5:=False:C215
					DB_SaveRecord(->[Catalogue_Availability:110])
					AA_CheckFileUnlocked(->[Catalogue_Availability:110]x_ID:1)
				Else   //delete
					DELETE RECORD:C58([Catalogue_Availability:110])
				End if 
			End if 
		End if 
	End for 
	QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]Person_Or_GroupID:2=(-([PERSONNEL_GROUPS:92]x_ID:12)*10); *)
	QUERY:C277([Catalogue_Availability:110];  & ; [Catalogue_Availability:110]FilterOUT:5=False:C215)
	QUERY:C277([Catalogue_Availability:110];  & ; [Catalogue_Availability:110]FilterOUT:5=True:C214)
	SELECTION TO ARRAY:C260([Catalogue_Availability:110]x_ID:1; $_al_AvailableCatalogueIDS)
	QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]Person_Or_GroupID:2=(-([PERSONNEL_GROUPS:92]x_ID:12)*10); *)
	QUERY:C277([Catalogue_Availability:110];  & ; [Catalogue_Availability:110]FilterOUT:5=True:C214)
	SELECTION TO ARRAY:C260([Catalogue_Availability:110]x_ID:1; $_al_AvailableCatalogueIDS2)
	For ($_l_Index; 1; Size of array:C274(CAT_aI_CatalogueINC))
		If (CAT_aI_CatalogueINC{$_l_Index}=1)
			$_l_IDRow:=Find in array:C230($_al_AvailableCatalogueIDS; CAT_aI_CatalogueINC{$_l_Index})
			If ($_l_IDRow>0)
				//already exists
				// only need to check if default
				If (CAT_aI_CatalogueDF{$_l_Index}=1)
					QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]x_ID:1=CAT_al_CatalogueID{$_l_Index})
					[Catalogue_Availability:110]Default:4:=True:C214
					DB_SaveRecord(->[Catalogue_Availability:110])
					AA_CheckFileUnlocked(->[Catalogue_Availability:110]x_ID:1)
				End if 
				
			Else 
				//create it
				CREATE RECORD:C68([Catalogue_Availability:110])
				[Catalogue_Availability:110]Person_Or_GroupID:2:=-([PERSONNEL_GROUPS:92]x_ID:12)*10
				[Catalogue_Availability:110]Catalogue_ID:3:=CAT_al_CatalogueID{$_l_Index}
				[Catalogue_Availability:110]Default:4:=(CAT_aI_CatalogueDF{$_l_Index}=1)
				DB_SaveRecord(->[Catalogue_Availability:110])
				AA_CheckFileUnlocked(->[Catalogue_Availability:110]x_ID:1)
			End if 
		Else 
			//check if to exclude
			If (CAT_aI_CatalogueEXC{$_l_Index}=1)
				$_l_IDRow:=Find in array:C230($_al_AvailableCatalogueIDS2; CAT_aI_CatalogueINC{$_l_Index})
				If ($_l_IDRow>0)
					//already Excluded
				Else 
					//create it
					CREATE RECORD:C68([Catalogue_Availability:110])
					[Catalogue_Availability:110]Person_Or_GroupID:2:=-([PERSONNEL_GROUPS:92]x_ID:12)*10
					[Catalogue_Availability:110]Catalogue_ID:3:=CAT_al_CatalogueID{$_l_Index}
					[Catalogue_Availability:110]Default:4:=(CAT_aI_CatalogueDF{$_l_Index}=1)
					[Catalogue_Availability:110]FilterOUT:5:=True:C214
					DB_SaveRecord(->[Catalogue_Availability:110])
					AA_CheckFileUnlocked(->[Catalogue_Availability:110]x_ID:1)
				End if 
			End if 
		End if 
	End for 
	UNLOAD RECORD:C212([Catalogue_Availability:110])
	READ ONLY:C145([Catalogue_Availability:110])
End if 
ERR_MethodTrackerReturn("Cat_SavePerGroupPrefs"; $_t_oldMethodName)
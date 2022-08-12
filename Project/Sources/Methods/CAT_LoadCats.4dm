//%attributes = {}

If (False:C215)
	//Project Method Name:      CAT_LoadCats
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
	ARRAY BOOLEAN:C223($_abo_CatalogueDefault; 0)
	ARRAY BOOLEAN:C223($_abo_CatalogueExclude; 0)
	//ARRAY DATE(CAT_ad_CatalogueAvaialbeTo;0)
	//ARRAY DATE(CAT_ad_CatalogueAvailableFrom;0)
	//ARRAY INTEGER(CAT_aI_CatalogueDF;0)
	//ARRAY INTEGER(CAT_aI_CatalogueEXC;0)
	//ARRAY INTEGER(CAT_aI_CatalogueINC;0)
	ARRAY LONGINT:C221($_al_CatalogueIDS; 0)
	//ARRAY LONGINT(CAT_al_catalgoueclasses;0)
	//ARRAY LONGINT(CAT_al_CatalogueClass;0)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY LONGINT(CAT_al_CatalogueImageSource;0)
	//ARRAY TEXT(CAT_at_CatalogueClass;0)
	//ARRAY TEXT(CAT_at_Catalogueclasses;0)
	//ARRAY TEXT(CAT_at_CatalogueImagePath;0)
	//ARRAY TEXT(CAT_at_CatalogueMacro;0)
	//ARRAY TEXT(CAT_at_CatalogueNames;0)
	C_BOOLEAN:C305($_bo_LoadAllList; $2; CAT_bo_MaintainAllProds; CAT_bo_MaintainPriceList)
	C_LONGINT:C283($_l_CatalogueIndex; $_l_CLassRow; $_l_DefaultCatalogueRow; $_l_IDRow; CAT_l_DefaultCatalogue)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAT_LoadCats")

//This method will load a list of available catalogues
//Pass a USER ID or a -(GROUPID)*10
//Pass a -1 one to load them all
CAT_LoadPrefs
ARRAY LONGINT:C221(CAT_al_CatalogueID; 0)
ARRAY TEXT:C222(CAT_at_CatalogueNames; 0)
ARRAY LONGINT:C221(CAT_al_CatalogueImageSource; 0)
ARRAY TEXT:C222(CAT_at_CatalogueImagePath; 0)
//````
ARRAY INTEGER:C220(CAT_aI_CatalogueDF; 0)
ARRAY INTEGER:C220(CAT_aI_CatalogueINC; 0)
ARRAY INTEGER:C220(CAT_aI_CatalogueEXC; 0)
CAT_l_DefaultCatalogue:=0
READ ONLY:C145([Catalogue_Availability:110])
READ ONLY:C145([CATALOGUE:108])
ARRAY LONGINT:C221($_al_CatalogueIDS; 0)
ARRAY BOOLEAN:C223($_abo_CatalogueDefault; 0)
ARRAY BOOLEAN:C223($_abo_CatalogueExclude; 0)
//the following lets us load the full list of
//catalogues
//this is used in set up
//but in general we only want the available list
//so we would pass $2=FALSE
If (Count parameters:C259>=2)
	$_bo_LoadAllList:=$2
Else 
	$_bo_LoadAllList:=True:C214
End if 
$_t_oldMethodName:=ERR_MethodTracker("CAT_LoadCats")
If (Count parameters:C259>=1)
	Case of 
		: ($1=-1)
			//load all
			QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]Person_Or_GroupID:2=$1)
			
			SELECTION TO ARRAY:C260([Catalogue_Availability:110]Catalogue_ID:3; $_al_CatalogueIDS; [Catalogue_Availability:110]Default:4; $_abo_CatalogueDefault; [Catalogue_Availability:110]FilterOUT:5; $_abo_CatalogueExclude)
			$_l_DefaultCatalogueRow:=Find in array:C230($_abo_CatalogueDefault; True:C214)
			If ($_l_DefaultCatalogueRow>0)
				CAT_l_DefaultCatalogue:=$_al_CatalogueIDS{$_l_DefaultCatalogueRow}
			End if 
			ALL RECORDS:C47([CATALOGUE:108])
			
		Else 
			QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]Person_Or_GroupID:2=$1)
			If (Records in selection:C76([Catalogue_Availability:110])>0)
				
				SELECTION TO ARRAY:C260([Catalogue_Availability:110]Catalogue_ID:3; $_al_CatalogueIDS; [Catalogue_Availability:110]Default:4; $_abo_CatalogueDefault; [Catalogue_Availability:110]FilterOUT:5; $_abo_CatalogueExclude)
				
				$_l_DefaultCatalogueRow:=Find in array:C230($_abo_CatalogueDefault; True:C214)
				If ($_l_DefaultCatalogueRow>0)
					CAT_l_DefaultCatalogue:=$_al_CatalogueIDS{$_l_DefaultCatalogueRow}
				End if 
				Case of 
					: ($_bo_LoadAllList)  //we want all the catalgues loaded(editing setup)
						ALL RECORDS:C47([CATALOGUE:108])
					Else   //load only the available catalogues
						QUERY SELECTION:C341([Catalogue_Availability:110]; [Catalogue_Availability:110]FilterOUT:5#True:C214)
						RELATE ONE SELECTION:C349([Catalogue_Availability:110]; [CATALOGUE:108])
						QUERY SELECTION:C341([CATALOGUE:108]; [CATALOGUE:108]xDateAvailableFrom:10=!00-00-00!; *)
						QUERY SELECTION:C341([CATALOGUE:108];  | ; [CATALOGUE:108]xDateAvailableFrom:10>=Current date:C33(*))
						//``
						QUERY SELECTION:C341([CATALOGUE:108]; [CATALOGUE:108]xDateAvailableTo:11=!00-00-00!; *)
						QUERY SELECTION:C341([CATALOGUE:108];  | ; [CATALOGUE:108]xDateAvailableTo:11<=Current date:C33(*))
						
				End case 
				
			Else   //no direct settings
				Case of 
					: ($_bo_LoadAllList)  //we want all the catalogues loaded(editing setup)
						ALL RECORDS:C47([CATALOGUE:108])
						If ($1<0)  //loading a group-no group settings load general
							QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]Person_Or_GroupID:2=-1)
							SELECTION TO ARRAY:C260([Catalogue_Availability:110]Catalogue_ID:3; $_al_CatalogueIDS; [Catalogue_Availability:110]Default:4; $_abo_CatalogueDefault; [Catalogue_Availability:110]FilterOUT:5; $_abo_CatalogueExclude)
							$_l_DefaultCatalogueRow:=Find in array:C230($_abo_CatalogueDefault; True:C214)
							If ($_l_DefaultCatalogueRow>0)
								CAT_l_DefaultCatalogue:=$_al_CatalogueIDS{$_l_DefaultCatalogueRow}
							End if 
						Else   //loading a person- look for group
							If ([PERSONNEL:11]Personnel_ID:48#$1)
								QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$1)
							End if 
							
							QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=[PERSONNEL:11]Group_Code:28)
							QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]Person_Or_GroupID:2=(-[PERSONNEL_GROUPS:92]x_ID:12*10))
							If (Records in selection:C76([Catalogue_Availability:110])>0)  //load the group
								SELECTION TO ARRAY:C260([Catalogue_Availability:110]Catalogue_ID:3; $_al_CatalogueIDS; [Catalogue_Availability:110]Default:4; $_abo_CatalogueDefault; [Catalogue_Availability:110]FilterOUT:5; $_abo_CatalogueExclude)
							Else 
								//no group find general
								QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]Person_Or_GroupID:2=-1)
								SELECTION TO ARRAY:C260([Catalogue_Availability:110]Catalogue_ID:3; $_al_CatalogueIDS; [Catalogue_Availability:110]Default:4; $_abo_CatalogueDefault; [Catalogue_Availability:110]FilterOUT:5; $_abo_CatalogueExclude)
							End if 
							$_l_DefaultCatalogueRow:=Find in array:C230($_abo_CatalogueDefault; True:C214)
							If ($_l_DefaultCatalogueRow>0)
								CAT_l_DefaultCatalogue:=$_al_CatalogueIDS{$_l_DefaultCatalogueRow}
							End if 
						End if 
						
						
						
					: (Records in selection:C76([Catalogue_Availability:110])=0)  // availability records
						//we dont want them all but still need the availability records
						ALL RECORDS:C47([CATALOGUE:108])
						If ($1<0)  //loading a group-no group settings load general
							QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]Person_Or_GroupID:2=-1)
							SELECTION TO ARRAY:C260([Catalogue_Availability:110]Catalogue_ID:3; $_al_CatalogueIDS; [Catalogue_Availability:110]Default:4; $_abo_CatalogueDefault; [Catalogue_Availability:110]FilterOUT:5; $_abo_CatalogueExclude)
							$_l_DefaultCatalogueRow:=Find in array:C230($_abo_CatalogueDefault; True:C214)
							If ($_l_DefaultCatalogueRow>0)
								CAT_l_DefaultCatalogue:=$_al_CatalogueIDS{$_l_DefaultCatalogueRow}
							End if 
						Else   //loading a person- look for group
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$1)
							QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=[PERSONNEL:11]Group_Code:28)
							QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]Person_Or_GroupID:2=(-[PERSONNEL_GROUPS:92]x_ID:12*10))
							If (Records in selection:C76([Catalogue_Availability:110])>0)  //load the group
								SELECTION TO ARRAY:C260([Catalogue_Availability:110]Catalogue_ID:3; $_al_CatalogueIDS; [Catalogue_Availability:110]Default:4; $_abo_CatalogueDefault; [Catalogue_Availability:110]FilterOUT:5; $_abo_CatalogueExclude)
							Else 
								//no group find general
								QUERY:C277([Catalogue_Availability:110]; [Catalogue_Availability:110]Person_Or_GroupID:2=-1)
								SELECTION TO ARRAY:C260([Catalogue_Availability:110]Catalogue_ID:3; $_al_CatalogueIDS; [Catalogue_Availability:110]Default:4; $_abo_CatalogueDefault; [Catalogue_Availability:110]FilterOUT:5; $_abo_CatalogueExclude)
							End if 
							$_l_DefaultCatalogueRow:=Find in array:C230($_abo_CatalogueDefault; True:C214)
							If ($_l_DefaultCatalogueRow>0)
								CAT_l_DefaultCatalogue:=$_al_CatalogueIDS{$_l_DefaultCatalogueRow}
							End if 
						End if 
						QUERY SELECTION:C341([Catalogue_Availability:110]; [Catalogue_Availability:110]FilterOUT:5#True:C214)
						RELATE ONE SELECTION:C349([Catalogue_Availability:110]; [CATALOGUE:108])
						QUERY SELECTION:C341([CATALOGUE:108]; [CATALOGUE:108]xDateAvailableFrom:10=!00-00-00!; *)
						QUERY SELECTION:C341([CATALOGUE:108];  | ; [CATALOGUE:108]xDateAvailableFrom:10>=Current date:C33(*))
						//``
						QUERY SELECTION:C341([CATALOGUE:108]; [CATALOGUE:108]xDateAvailableTo:11=!00-00-00!; *)
						QUERY SELECTION:C341([CATALOGUE:108];  | ; [CATALOGUE:108]xDateAvailableTo:11<=Current date:C33(*))
						
				End case 
			End if 
			
	End case 
	//we now either have ALL the catalogues
	//or just the ones AVAILABLE to this user
	SELECTION TO ARRAY:C260([CATALOGUE:108]x_ID:1; CAT_al_CatalogueID; [CATALOGUE:108]Catalogue_Name:2; CAT_at_CatalogueNames; [CATALOGUE:108]Image_Source:3; CAT_al_CatalogueImageSource; [CATALOGUE:108]Image_Path:4; CAT_at_CatalogueImagePath; [CATALOGUE:108]xDateAvailableFrom:10; CAT_ad_CatalogueAvailableFrom; [CATALOGUE:108]xDateAvailableTo:11; CAT_ad_CatalogueAvaialbeTo; [CATALOGUE:108]xCatalogueClass:9; CAT_al_CatalogueClass; [CATALOGUE:108]xMacroName:12; CAT_at_CatalogueMacro)
	
	If (CAT_bo_MaintainPriceList)
		APPEND TO ARRAY:C911(CAT_al_CatalogueID; -9999)
		APPEND TO ARRAY:C911(CAT_at_CatalogueNames; "Price List")
		APPEND TO ARRAY:C911(CAT_al_CatalogueImageSource; 0)
		APPEND TO ARRAY:C911(CAT_at_CatalogueImagePath; "")
		APPEND TO ARRAY:C911(CAT_ad_CatalogueAvailableFrom; !00-00-00!)
		APPEND TO ARRAY:C911(CAT_ad_CatalogueAvaialbeTo; !00-00-00!)
		APPEND TO ARRAY:C911(CAT_al_CatalogueClass; -1)
		APPEND TO ARRAY:C911(CAT_at_CatalogueMacro; "")
		
	End if 
	If (CAT_bo_MaintainAllProds)
		APPEND TO ARRAY:C911(CAT_al_CatalogueID; -9998)
		APPEND TO ARRAY:C911(CAT_at_CatalogueNames; "All Products")
		APPEND TO ARRAY:C911(CAT_al_CatalogueImageSource; 0)
		APPEND TO ARRAY:C911(CAT_at_CatalogueImagePath; "")
		APPEND TO ARRAY:C911(CAT_ad_CatalogueAvailableFrom; !00-00-00!)
		APPEND TO ARRAY:C911(CAT_ad_CatalogueAvaialbeTo; !00-00-00!)
		APPEND TO ARRAY:C911(CAT_al_CatalogueClass; -1)
		APPEND TO ARRAY:C911(CAT_at_CatalogueMacro; "")
		
	End if 
	//Note that these  2 above lists have hard coded ids...they will not be saved ..they are added to the list of Catalogues so that they can be made available to a user or group. the availablility IS saved..so don;;t get caught searching for the [catalogue]
	ARRAY INTEGER:C220(CAT_aI_CatalogueDF; 0)
	ARRAY INTEGER:C220(CAT_aI_CatalogueINC; 0)
	ARRAY INTEGER:C220(CAT_aI_CatalogueEXC; 0)
	ARRAY TEXT:C222(CAT_at_CatalogueClass; 0)
	ARRAY INTEGER:C220(CAT_aI_CatalogueDF; Size of array:C274(CAT_al_CatalogueID))
	ARRAY INTEGER:C220(CAT_aI_CatalogueINC; Size of array:C274(CAT_al_CatalogueID))
	ARRAY INTEGER:C220(CAT_aI_CatalogueEXC; Size of array:C274(CAT_al_CatalogueID))
	ARRAY TEXT:C222(CAT_at_CatalogueClass; Size of array:C274(CAT_al_CatalogueID))
	
	ARRAY TEXT:C222(CAT_at_Catalogueclasses; 2)
	ARRAY LONGINT:C221(CAT_al_catalgoueclasses; 2)
	CAT_at_Catalogueclasses{1}:="Static"
	CAT_al_catalgoueclasses{1}:=-1
	CAT_at_Catalogueclasses{2}:="Dynamic"
	CAT_al_catalgoueclasses{2}:=1
	
	If (CAT_l_DefaultCatalogue#0)
		$_l_DefaultCatalogueRow:=Find in array:C230(CAT_al_CatalogueID; CAT_l_DefaultCatalogue)
		If ($_l_DefaultCatalogueRow>0)
			CAT_aI_CatalogueDF{$_l_DefaultCatalogueRow}:=1
		End if 
	End if 
	
	For ($_l_CatalogueIndex; 1; Size of array:C274(CAT_aI_CatalogueINC))
		If (CAT_al_CatalogueClass{$_l_CatalogueIndex}=-2)
			CAT_at_CatalogueClass{$_l_CatalogueIndex}:="Non Editable Maintained list"
		Else 
			$_l_CLassRow:=Find in array:C230(CAT_al_catalgoueclasses; CAT_al_CatalogueClass{$_l_CatalogueIndex})
			If ($_l_CLassRow>0)
				CAT_at_CatalogueClass{$_l_CatalogueIndex}:=CAT_at_Catalogueclasses{$_l_CLassRow}
			Else 
				CAT_al_CatalogueClass{$_l_CatalogueIndex}:=-1
				CAT_at_CatalogueClass{$_l_CatalogueIndex}:=CAT_at_Catalogueclasses{1}
			End if 
		End if 
		$_l_IDRow:=Find in array:C230($_al_CatalogueIDS; CAT_al_CatalogueID{$_l_CatalogueIndex})
		If ($_l_IDRow>0)
			If ($_abo_CatalogueExclude{$_l_IDRow}=False:C215)
				
				CAT_aI_CatalogueINC{$_l_CatalogueIndex}:=1
			Else 
				CAT_aI_CatalogueEXC{$_l_CatalogueIndex}:=1
			End if 
		End if 
	End for 
	
	
	INT_SetLongintCheckFormat(->CAT_aI_CatalogueDF)
	INT_SetLongintCheckFormat(->CAT_aI_CatalogueINC)
	INT_SetLongintCheckFormat(->CAT_aI_CatalogueEXC)
	
End if 
SORT ARRAY:C229(CAT_at_CatalogueNames; CAT_aI_CatalogueDF; CAT_aI_CatalogueINC; CAT_al_CatalogueID; CAT_al_CatalogueImageSource; CAT_at_CatalogueImagePath; CAT_aI_CatalogueEXC; CAT_ad_CatalogueAvailableFrom; CAT_ad_CatalogueAvaialbeTo; CAT_al_CatalogueClass; CAT_at_CatalogueClass; CAT_at_CatalogueMacro)
ERR_MethodTrackerReturn("CAT_LoadCats"; $_t_oldMethodName)
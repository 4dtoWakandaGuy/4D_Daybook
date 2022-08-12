If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.Variable22
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CAT_abo_CatalogueEXC;0)
	//ARRAY BOOLEAN(CAT_abo_CatalogueINC;0)
	//ARRAY BOOLEAN(CAT_abo_IsAvailable;0)
	//ARRAY DATE(CAT_ad_CatalogueAvaialbeTo;0)
	//ARRAY DATE(CAT_ad_CatalogueAvailableFrom;0)
	//ARRAY INTEGER(CAT_aI_CatalogueDF;0)
	//ARRAY INTEGER(CAT_aI_CatalogueEXC;0)
	//ARRAY INTEGER(CAT_aI_CatalogueINC;0)
	//ARRAY LONGINT(CAT_al_catalgoueclasses;0)
	//ARRAY LONGINT(CAT_al_CatalogueClass;0)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY LONGINT(CAT_al_CatalogueImageSource;0)
	//ARRAY TEXT(CAT_at_CatalogueClass;0)
	//ARRAY TEXT(CAT_at_Catalogueclasses;0)
	//ARRAY TEXT(CAT_at_CatalogueImagePath;0)
	//ARRAY TEXT(CAT_at_CatalogueNames;0)
	C_LONGINT:C283($_l_ClassRow; $_l_SizeofArray; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; $_t_WindowTitle; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.Variable22"; Form event code:C388)
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
//Open window($_l_WindowLeft;$_l_WindowTop;$_l_WindowRight;$_l_WindowBottom;4;"Catalogue: "+ CAT_at_CatalogueNames{WS_S
$_t_WindowTitle:=Get window title:C450
SET WINDOW TITLE:C213("Catalogue:"+"New Catalogue")
ADD RECORD:C56([CATALOGUE:108]; *)
If (OK=1)
	ARRAY TEXT:C222(CAT_at_Catalogueclasses; 2)
	ARRAY LONGINT:C221(CAT_al_catalgoueclasses; 2)
	CAT_at_Catalogueclasses{1}:="Static"
	CAT_al_catalgoueclasses{1}:=-1
	CAT_at_Catalogueclasses{2}:="Dynamic"
	CAT_al_catalgoueclasses{2}:=1
	
	INSERT IN ARRAY:C227(CAT_al_CatalogueID; 9999; 1)
	INSERT IN ARRAY:C227(CAT_at_CatalogueNames; 9999; 1)
	INSERT IN ARRAY:C227(CAT_al_CatalogueImageSource; 9999; 1)
	INSERT IN ARRAY:C227(CAT_at_CatalogueImagePath; 9999; 1)
	INSERT IN ARRAY:C227(CAT_aI_CatalogueDF; 9999; 1)
	INSERT IN ARRAY:C227(CAT_aI_CatalogueINC; 9999; 1)
	INSERT IN ARRAY:C227(CAT_aI_CatalogueEXC; 9999; 1)
	INSERT IN ARRAY:C227(CAT_abo_CatalogueINC; 9999; 1)
	INSERT IN ARRAY:C227(CAT_abo_CatalogueEXC; 9999; 1)
	INSERT IN ARRAY:C227(CAT_abo_IsAvailable; 9999; 1)
	INSERT IN ARRAY:C227(CAT_ad_CatalogueAvailableFrom; 9999; 1)
	INSERT IN ARRAY:C227(CAT_ad_CatalogueAvaialbeTo; 9999; 1)
	INSERT IN ARRAY:C227(CAT_at_CatalogueClass; 9999; 1)
	INSERT IN ARRAY:C227(CAT_al_CatalogueClass; 9999; 1)
	$_l_SizeofArray:=Size of array:C274(CAT_al_CatalogueClass)
	CAT_al_CatalogueClass{$_l_SizeofArray}:=[CATALOGUE:108]xCatalogueClass:9
	$_l_ClassRow:=Find in array:C230(CAT_al_catalgoueclasses; CAT_al_CatalogueClass{$_l_SizeofArray})
	If ($_l_ClassRow>0)
		CAT_at_CatalogueClass{$_l_SizeofArray}:=CAT_at_Catalogueclasses{$_l_ClassRow}
	Else 
		CAT_al_CatalogueClass{$_l_SizeofArray}:=-1
		CAT_at_CatalogueClass{$_l_SizeofArray}:=CAT_at_Catalogueclasses{1}
	End if 
	CAT_ad_CatalogueAvaialbeTo{$_l_SizeofArray}:=[CATALOGUE:108]xDateAvailableTo:11
	CAT_ad_CatalogueAvailableFrom{$_l_SizeofArray}:=[CATALOGUE:108]xDateAvailableFrom:10
	CAT_al_CatalogueID{$_l_SizeofArray}:=[CATALOGUE:108]x_ID:1
	CAT_at_CatalogueNames{$_l_SizeofArray}:=[CATALOGUE:108]Catalogue_Name:2
	CAT_al_CatalogueImageSource{$_l_SizeofArray}:=[CATALOGUE:108]Image_Source:3
	CAT_at_CatalogueImagePath{$_l_SizeofArray}:=[CATALOGUE:108]Image_Path:4
	CAT_aI_CatalogueINC{$_l_SizeofArray}:=1
	CAT_abo_CatalogueEXC{$_l_SizeofArray}:=(CAT_aI_CatalogueEXC{$_l_SizeofArray}=1)
	CAT_abo_CatalogueINC{$_l_SizeofArray}:=(CAT_aI_CatalogueINC{$_l_SizeofArray}=1)
	SORT ARRAY:C229(CAT_at_CatalogueNames; CAT_aI_CatalogueDF; CAT_aI_CatalogueINC; CAT_al_CatalogueID; CAT_al_CatalogueImageSource; CAT_at_CatalogueImagePath)
	
End if 

UNLOAD RECORD:C212([CATALOGUE:108])
READ ONLY:C145([CATALOGUE:108])
SET WINDOW TITLE:C213($_t_WindowTitle)
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.Variable22"; $_t_oldMethodName)

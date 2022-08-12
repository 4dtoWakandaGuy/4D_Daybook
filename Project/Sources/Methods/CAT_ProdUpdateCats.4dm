//%attributes = {}
If (False:C215)
	//Project Method Name:      CAT_ProdUpdateCats
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY LONGINT(CAT_al_CatalogueSelected;0)
	//ARRAY LONGINT(CAT_al_CatMod;0)
	//ARRAY TEXT(CAT_at_CatalogueNAME;0)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_IDRow; $_l_Index; CAT_l_SaveSettings; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($1)
	C_REAL:C285($2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAT_ProdUpdateCats")
//this method will load the whole list of catalogues
//set the currently selected ones(passed in a pointer to an array)
//display a dialogue
//update the catalogues
ARRAY LONGINT:C221(CAT_al_CatMod; 0)
ARRAY LONGINT:C221(CAT_al_CatalogueID; 0)
ARRAY TEXT:C222(CAT_at_CatalogueNAME; 0)
ARRAY LONGINT:C221(CAT_al_CatalogueSelected; 0)
ALL RECORDS:C47([CATALOGUE:108])
SELECTION TO ARRAY:C260([CATALOGUE:108]x_ID:1; CAT_al_CatalogueID; [CATALOGUE:108]Catalogue_Name:2; CAT_at_CatalogueNAME)
ARRAY LONGINT:C221(CAT_al_CatMod; Size of array:C274(CAT_al_CatalogueID))
ARRAY LONGINT:C221(CAT_al_CatalogueID; Size of array:C274(CAT_al_CatalogueID))
ARRAY LONGINT:C221(CAT_al_CatalogueSelected; Size of array:C274(CAT_al_CatalogueID))
For ($_l_Index; 1; Size of array:C274($1->))
	$_l_IDRow:=Find in array:C230(CAT_al_CatalogueID; $1->{$_l_Index})
	If ($_l_IDRow>0)  //it should be!
		CAT_al_CatalogueSelected{$_l_Index}:=1
	End if 
	
End for 
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 1)
DIALOG:C40([USER:15]; "CAT_Selector")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
If (CAT_l_SaveSettings=1)
	For ($_l_Index; 1; Size of array:C274(CAT_al_CatMod))
		If (CAT_al_CatMod{$_l_Index}=1)
			Case of 
				: (CAT_al_CatalogueSelected{$_l_Index}=1)
					//include
					CAT_ProdAdd($2; CAT_al_CatalogueID{$_l_Index})
					UNLOAD RECORD:C212([Catalogue_ProductLink:109])
				: (CAT_al_CatalogueSelected{$_l_Index}=0)
					//exclude
					READ WRITE:C146([Catalogue_ProductLink:109])
					QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=$1->{$_l_Index}; *)
					QUERY:C277([Catalogue_ProductLink:109];  & ; [Catalogue_ProductLink:109]x_ProductID:3=$2)
					If (Records in selection:C76([Catalogue_ProductLink:109])>0)
						QUERY SELECTION:C341([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]Status:6>0)
					End if 
					If (Records in selection:C76([Catalogue_ProductLink:109])>0)
						[Catalogue_ProductLink:109]Status:6:=-1
						[Catalogue_ProductLink:109]DateRemoved:5:=Current date:C33(*)
						DB_SaveRecord(->[Catalogue_ProductLink:109])
						AA_CheckFileUnlocked(->[Catalogue_ProductLink:109]x_ID:1)
					End if 
					UNLOAD RECORD:C212([Catalogue_ProductLink:109])
			End case 
			
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("CAT_ProdUpdateCats"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_ExportByCatalogue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_CatProductIDS;0)
	//ARRAY TEXT(CAT_at_CatLinkFamilyName1;0)
	//ARRAY TEXT(CAT_at_CatLinkFamilyName2;0)
	//ARRAY TEXT(CAT_at_CatLinkFamilyName3;0)
	//ARRAY TEXT(CAT_at_CatLinkFamilyName4;0)
	//ARRAY TEXT(CAT_at_CatLinkFamilyName5;0)
	C_BOOLEAN:C305(EW_bo_ThermUpdate)
	C_LONGINT:C283($_l_Index; EW_FamilyLevels)
	C_REAL:C285(EW_counter; EW_i)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_ExportByCatalogue")
// EW_ExportByCatalogue
// 01/03/03 pb


For (EW_i; 1; Records in selection:C76([CATALOGUE:108]))
	Catalogue_Prices
	CAT_LoadProducts([CATALOGUE:108]x_ID:1; ""; False:C215)
/*
Case of 
: (Find in array(CAT_at_CatLinkFamilyName5;"@")>0)
EW_FamilyLevels:=5
: (Find in array(CAT_at_CatLinkFamilyName4;"@")>0)
EW_FamilyLevels:=4
: (Find in array(CAT_at_CatLinkFamilyName3;"@")>0)
EW_FamilyLevels:=3
: (Find in array(CAT_at_CatLinkFamilyName2;"@")>0)
EW_FamilyLevels:=2
Else 
EW_FamilyLevels:=1
End case 
	
	
ARRAY TEXT(CAT_at_CatLinkFamilyName1;Size of array(CAT_at_CatLinkFamilyName2))
For ($_l_Index;1;Size of array(CAT_at_CatLinkFamilyName2))
CAT_at_CatLinkFamilyName1{$_l_Index}:=[CATALOGUE]Catalogue_Name
End for 
*/
	EW_bo_ThermUpdate:=True:C214
	For (EW_counter; 1; Size of array:C274(CAT_al_CatProductIDS))
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]X_ID:43=CAT_al_CatProductIDS{EW_counter})
		EW_ExportDetails(->[PRODUCTS:9])
		EW_bo_ThermUpdate:=False:C215
	End for 
	NEXT RECORD:C51([CATALOGUE:108])
End for 
ERR_MethodTrackerReturn("EW_ExportByCatalogue"; $_t_oldMethodName)
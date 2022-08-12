//%attributes = {}
If (False:C215)
	//Project Method Name:      CAT_ProdAdd
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
	C_LONGINT:C283($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAT_ProdAdd")
//this method is used to add a product to a catalogue
//pass the catalogue ID in $1
//pass the product ID in $2
//WONT add same product TWICE!
If (Count parameters:C259>=2)
	If ($1>0) & ($2>0)
		READ WRITE:C146([Catalogue_ProductLink:109])
		QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=$2; *)
		QUERY:C277([Catalogue_ProductLink:109];  & ; [Catalogue_ProductLink:109]x_ProductID:3=$1)
		If (Records in selection:C76([Catalogue_ProductLink:109])=0)
			//     QUERY SELECTION([Catalogue_ProductLink];[Catalogue_ProductLink]Status>0)
			CREATE RECORD:C68([Catalogue_ProductLink:109])
			[Catalogue_ProductLink:109]X_CatalogueID:2:=$2
			[Catalogue_ProductLink:109]x_ProductID:3:=$1
			[Catalogue_ProductLink:109]x_ID:1:=AA_GetNextIDinMethod(->[Catalogue_ProductLink:109]x_ID:1)
		End if 
		//    If (Records in selection([Catalogue_ProductLink])=0)  `this prod is not alre
		[Catalogue_ProductLink:109]DateAdded:4:=Current date:C33(*)
		[Catalogue_ProductLink:109]Status:6:=1
		[Catalogue_ProductLink:109]TimeDateStamp:8:=GEN_TimeDateStamp(Current date:C33(*); Current time:C178(*))  // 27/11/03 pb
		
		DB_SaveRecord(->[Catalogue_ProductLink:109])
		AA_CheckFileUnlocked(->[Catalogue_ProductLink:109]x_ID:1)
		
		//   End if
		UNLOAD RECORD:C212([Catalogue_ProductLink:109])
		READ ONLY:C145([Catalogue_ProductLink:109])
	End if 
	
End if 
ERR_MethodTrackerReturn("CAT_ProdAdd"; $_t_oldMethodName)
If (False:C215)
	//object Name: [CATALOGUE]Catalogue_Input.Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/03/2013 15:56
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CAT_at_CatProductName;0)
	C_LONGINT:C283($_l_Index; $_l_Retries; DB_l_SelectionProcess; vNo; vNo2; WS_l_SELECTEDPRODUCT)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; CAT_t_CatViewCurrency; DB_t_CurrentFormUsage; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CATALOGUE].Catalogue_Input.Button2"; Form event code:C388)
//If (Macintosh option down) | (Windows Alt down) out 27/11/03 pb
//get all the Products_In the catalogue
//(multi Delete)
Gen_Alert("Select The products to remove from the catalogue")
QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=[CATALOGUE:108]x_ID:1; *)
QUERY:C277([Catalogue_ProductLink:109];  & ; [Catalogue_ProductLink:109]Status:6=1)
RELATE ONE SELECTION:C349([Catalogue_ProductLink:109]; [PRODUCTS:9])

If (Records in selection:C76([PRODUCTS:9])>0)
	
	$_t_CurrentOutputform:=WIN_t_CurrentOutputform
	Products_File
	vNo:=Records in selection:C76([PRODUCTS:9])
	vNo2:=vNo
	DB_t_CurrentFormUsage:="Print"
	ORDER BY:C49([PRODUCTS:9]Group_Code:3; >; [PRODUCTS:9]Brand_Code:4; >; [PRODUCTS:9]Model_Code:5; >)
	
	CREATE SET:C116([PRODUCTS:9]; "$currentlyInSelection")
	
	DBI_MenuSelectRecords(Table name:C256(Table:C252(->[PRODUCTS:9])))
	$_l_Retries:=0
	While (Process state:C330(DB_l_SelectionProcess)>=0)
		$_l_Retries:=$_l_Retries+1
		DelayTicks($_l_Retries*2)
	End while 
	USE NAMED SELECTION:C332("◊Preselection")
	//these are the selected
	CREATE SET:C116([PRODUCTS:9]; "$DeleteFromFromSeleciton")
	If (Records in selection:C76([PRODUCTS:9])>0)
		
		Gen_Confirm("Are you sure you wish to remove "+CAT_at_CatProductName{WS_l_SelectedProduct}+"?"; "No"; "Yes")
		If (Ok=0)
			CREATE EMPTY SET:C140([Catalogue_ProductLink:109]; "$Usethese")
			FIRST RECORD:C50([PRODUCTS:9])
			For ($_l_Index; 1; Records in selection:C76([PRODUCTS:9]))
				QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]x_ProductID:3=[PRODUCTS:9]X_ID:43)
				CREATE SET:C116([Catalogue_ProductLink:109]; "$Some")
				UNION:C120("$Some"; "$useThese"; "$useThese")
				NEXT RECORD:C51([PRODUCTS:9])
			End for 
			USE SET:C118("$useThese")
			CLEAR SET:C117("$useThese")
			CLEAR SET:C117("$Some")
			
			
			//this gives us the [Catalogue_ProductLink] records(but maybe more!)
			READ WRITE:C146([Catalogue_ProductLink:109])
			QUERY SELECTION:C341([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=[CATALOGUE:108]x_ID:1; *)
			QUERY SELECTION:C341([Catalogue_ProductLink:109];  & ; [Catalogue_ProductLink:109]Status:6=1)
			DB_lockFile(->[Catalogue_ProductLink:109])
			APPLY TO SELECTION:C70([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]DateRemoved:5:=Current date:C33(*))
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[Catalogue_ProductLink:109]))
			DB_lockFile(->[Catalogue_ProductLink:109])
			// this bit changed by pb 27/11/03
			//link records can be deleted immediately if they are not in the BK
			// If they are in the BK, they must be flagged for deletion from the BK first
			Catalogue_FlagLinkfordeletion(GEN_TimeDateStamp(Current date:C33(*); Current time:C178(*)))
			
			// APPLY TO SELECTION([Catalogue_ProductLink];
			//[Catalogue_ProductLink]Status:=-1)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[Catalogue_ProductLink:109]))
			UNLOAD RECORD:C212([Catalogue_ProductLink:109])
			READ ONLY:C145([Catalogue_ProductLink:109])
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)  // 04/11/03 pb
			CAT_LoadProducts([CATALOGUE:108]x_ID:1; CAT_t_CatViewCurrency; True:C214; [CATALOGUE:108]xCatalogueClass:9; [CATALOGUE:108]xMacroName:12)
			
		End if   // confirm deletion
	Else 
		Gen_Alert("No products were selected for removal")
	End if 
	WIN_t_CurrentOutputform:=$_t_CurrentOutputform
	//DEFAULT TABLE($Def->)
	
Else 
	Gen_Alert("There are no Products_In this catalogue")
End if 

//Else
ERR_MethodTrackerReturn("OBJ:Catalogue_Input,BDel_CatProd"; $_t_oldMethodName)

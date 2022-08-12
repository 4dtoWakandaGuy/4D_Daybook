If (False:C215)
	//object Name: [CATALOGUE]Catalogue_Input.Variable12
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
	ARRAY LONGINT:C221($_al_ProductIDS; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_BOOLEAN:C305($_bo_Add)
	C_LONGINT:C283($_l_Index; $_l_Retries; DB_l_SelectionProcess)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentOutputform; CAT_t_CatViewCurrency; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CATALOGUE].Catalogue_Input.Variable12"; Form event code:C388)
If ([CATALOGUE:108]Catalogue_Name:2#"") & ([CATALOGUE:108]x_ID:1>0)  //
	
	
	$_t_CurrentOutputform:=WIN_t_CurrentOutputform
	DBI_MenuSelectRecords(Table name:C256(Table:C252(->[PRODUCTS:9])))
	$_l_Retries:=0
	While (Process state:C330(DB_l_SelectionProcess)>=0)
		$_l_Retries:=$_l_Retries+1
		DelayTicks($_l_Retries*2)
	End while 
	USE NAMED SELECTION:C332("◊Preselection")
	If (False:C215)
		
	Else 
		$_bo_Add:=False:C215
		Case of 
			: (Records in selection:C76([PRODUCTS:9])=1)
				//ADD IT
				$_bo_Add:=True:C214
			: (Records in selection:C76([PRODUCTS:9])>1)
				//CONFIRM THEN ADD
				Gen_Confirm("Add"+String:C10(Records in selection:C76([PRODUCTS:9]))+" Items to Catalogue "+[CATALOGUE:108]Catalogue_Name:2+"?")
				If (Ok=1)
					$_bo_Add:=True:C214
				End if 
				
			Else 
				//0 RECORDS NO ADD
		End case 
		If ($_bo_Add)
			CREATE SET:C116([PRODUCTS:9]; "TEMP")
			QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]X_ID:43=0)
			If (Records in selection:C76([PRODUCTS:9])>0)
				DB_lockFile(->[PRODUCTS:9])
				APPLY TO SELECTION:C70([PRODUCTS:9]; [PRODUCTS:9]X_ID:43:=0)
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[PRODUCTS:9]))
				
			End if 
			USE SET:C118("TEMP")
			CLEAR SET:C117("TEMP")
			ARRAY TEXT:C222($_at_ProductCodes; 0)
			ARRAY LONGINT:C221($_al_ProductIDS; 0)
			SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes; [PRODUCTS:9]X_ID:43; $_al_ProductIDS)
			For ($_l_Index; 1; Size of array:C274($_al_ProductIDS))
				If ($_al_ProductIDS{$_l_Index}=0)
					READ WRITE:C146([PRODUCTS:9])
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_at_ProductCodes{$_l_Index})
					[PRODUCTS:9]X_ID:43:=AA_GetNextIDinMethod(->[PRODUCTS:9]X_ID:43)
					$_al_ProductIDS{$_l_Index}:=[PRODUCTS:9]X_ID:43
					DB_SaveRecord(->[PRODUCTS:9])
					AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
				End if 
				CAT_ProdAdd($_al_ProductIDS{$_l_Index}; [CATALOGUE:108]x_ID:1)
			End for 
			
			
			CAT_LoadProducts([CATALOGUE:108]x_ID:1; CAT_t_CatViewCurrency; True:C214; [CATALOGUE:108]xCatalogueClass:9; [CATALOGUE:108]xMacroName:12)
			
			
		End if 
	End if 
	WIN_t_CurrentOutputform:=$_t_CurrentOutputform
	//DEFAULT TABLE($Def->)
End if 
ERR_MethodTrackerReturn("OBJ:Catalogue_Input,Badd_CatProd"; $_t_oldMethodName)

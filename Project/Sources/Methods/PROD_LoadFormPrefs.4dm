//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_LoadFormPrefs
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created:   28/11/2010 20:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(Prod_al_TabPages;0)
	//ARRAY TEXT(PRD_at_ProductsTab;0)
	//ARRAY TEXT(Prod_at_TabNames;0)
	C_BOOLEAN:C305($_bo_LoadComponents; $_bo_LoadPricing; $_bo_LoadStock)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>PER_l_CurrentUserWorkGroupIDs; $_l_CurrentRow; $_l_ItemID; $_l_offset; $_l_TabNumber; Prod_l_PagePref)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROD_LoadFormPrefs")
ARRAY TEXT:C222(PRD_at_ProductsTab; 5)

OBJECT SET FONT:C164(PRD_at_ProductsTab; "arial")
OBJECT SET FONT STYLE:C166(PRD_at_ProductsTab; 1)
OBJECT SET FONT SIZE:C165(PRD_at_ProductsTab; 12)
PRD_at_ProductsTab{1}:="Pricing"
PRD_at_ProductsTab{2}:="Stock"
PRD_at_ProductsTab{3}:="Suppliers"
PRD_at_ProductsTab{4}:="Enclosures"
PRD_at_ProductsTab{5}:="Components"
PRD_at_ProductsTab:=1
$_bo_LoadPricing:=(DB_GetModuleSettingByNUM(Module_PriceTable)=2)
$_bo_LoadStock:=(DB_GetModuleSettingByNUM(Module_StockControl)=2)
$_bo_LoadComponents:=True:C214  //(DB_GetModuleSettingByNUM (Module_Assemblies)=2)




ARRAY TEXT:C222(Prod_at_TabNames; 0)
ARRAY LONGINT:C221(Prod_al_TabPages; 0)

While (Semaphore:C143("LoadingPrefsProd"))
	DelayTicks(2)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Product Form Preferences")
CLEAR SEMAPHORE:C144("LoadingPrefsProd")

QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[PERSONNEL:11]); *)
QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=<>PER_l_CurrentUserID)
If (Records in selection:C76([PREFERENCES:116])=0)
	If (<>PER_l_CurrentUserWorkGroupIDs>0)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
		QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[PERSONNEL_GROUPS:92]); *)
		QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=<>PER_l_CurrentUserWorkGroupIDs)
	End if 
End if 
If (Records in selection:C76([PREFERENCES:116])=0)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
	QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=0)
End if 
If (Records in selection:C76([PREFERENCES:116])>0)
	
	//  Array Text(Prod_at_TabNames;0)
	//  ARRAY LONGINT(Prod_al_TabPages;0)
	//C_LONGINT(Prod_l_PagePref)
	$_l_offset:=0
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Prod_at_TabNames; $_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Prod_al_TabPages; $_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Prod_l_PagePref; $_l_offset)
	
Else 
	$_bo_LoadPricing:=(DB_GetModuleSettingByNUM(Module_PriceTable)>0)
	$_bo_LoadStock:=(DB_GetModuleSettingByNUM(Module_StockControl)>0)
	$_bo_LoadComponents:=(DB_GetModuleSettingByNUM(Module_Assemblies)>0)
	ARRAY TEXT:C222(Prod_at_TabNames; 5)
	ARRAY LONGINT:C221(Prod_al_TabPages; 5)
	OBJECT SET FONT:C164(Prod_at_TabNames; "arial")
	OBJECT SET FONT STYLE:C166(Prod_at_TabNames; 1)
	OBJECT SET FONT SIZE:C165(Prod_at_TabNames; 12)
	$_l_CurrentRow:=0
	If ($_bo_LoadPricing)
		$_l_CurrentRow:=$_l_CurrentRow+1
		Prod_at_TabNames{$_l_CurrentRow}:="Pricing"
		Prod_al_TabPages{$_l_CurrentRow}:=1
	End if 
	If ($_bo_LoadStock)
		$_l_CurrentRow:=$_l_CurrentRow+1
		Prod_at_TabNames{$_l_CurrentRow}:="Stock"
		Prod_al_TabPages{$_l_CurrentRow}:=2
	End if 
	$_l_CurrentRow:=$_l_CurrentRow+1
	Prod_at_TabNames{$_l_CurrentRow}:="Suppliers"
	Prod_al_TabPages{$_l_CurrentRow}:=3
	$_l_CurrentRow:=$_l_CurrentRow+1
	Prod_at_TabNames{$_l_CurrentRow}:="Enclosures"
	Prod_al_TabPages{$_l_CurrentRow}:=4
	If ($_bo_LoadComponents)
		$_l_CurrentRow:=$_l_CurrentRow+1
		Prod_at_TabNames{$_l_CurrentRow}:="Components"
		Prod_al_TabPages{$_l_CurrentRow}:=5
	End if 
	Prod_l_PagePref:=Prod_al_TabPages{1}
	ARRAY TEXT:C222(Prod_at_TabNames; $_l_CurrentRow)
	ARRAY LONGINT:C221(Prod_al_TabPages; $_l_CurrentRow)
End if 

$_bo_LoadPricing:=(DB_GetModuleSettingByNUM(Module_PriceTable)=2)
$_bo_LoadStock:=(DB_GetModuleSettingByNUM(Module_StockControl)=2)
$_bo_LoadComponents:=(DB_GetModuleSettingByNUM(Module_Assemblies)=2)
If (Not:C34($_bo_LoadPricing))
	$_l_TabNumber:=Find in array:C230(Prod_al_TabPages; 1)
	If ($_l_TabNumber>0)
		//need to take it out
		DELETE FROM ARRAY:C228(Prod_at_TabNames; $_l_TabNumber)
		DELETE FROM ARRAY:C228(Prod_al_TabPages; $_l_TabNumber)
		If (Prod_l_PagePref=$_l_TabNumber)
			Prod_l_PagePref:=Prod_al_TabPages{1}
		End if 
		
	End if 
End if 
If (Not:C34($_bo_LoadStock))
	$_l_TabNumber:=Find in array:C230(Prod_al_TabPages; 2)
	If ($_l_TabNumber>0)
		//need to take it out
		DELETE FROM ARRAY:C228(Prod_at_TabNames; $_l_TabNumber)
		DELETE FROM ARRAY:C228(Prod_al_TabPages; $_l_TabNumber)
		If (Prod_l_PagePref=$_l_TabNumber)
			Prod_l_PagePref:=Prod_al_TabPages{1}
		End if 
	End if 
End if 
If (Not:C34($_bo_LoadComponents))
	$_l_TabNumber:=Find in array:C230(Prod_al_TabPages; 5)
	If ($_l_TabNumber>0)
		//need to take it out
		DELETE FROM ARRAY:C228(Prod_at_TabNames; $_l_TabNumber)
		DELETE FROM ARRAY:C228(Prod_al_TabPages; $_l_TabNumber)
		If (Prod_l_PagePref=$_l_TabNumber)
			Prod_l_PagePref:=Prod_al_TabPages{1}
		End if 
	End if 
End if 
$_l_TabNumber:=Find in array:C230(Prod_al_TabPages; Prod_l_PagePref)
If ($_l_TabNumber<0)
	Prod_at_TabNames:=1
Else 
	Prod_at_TabNames:=$_l_TabNumber
End if 

FORM GOTO PAGE:C247(Prod_al_TabPages{Prod_at_TabNames})
ERR_MethodTrackerReturn("PROD_LoadFormPrefs"; $_t_oldMethodName)

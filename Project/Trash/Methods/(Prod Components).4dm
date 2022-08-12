//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Prod Components
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/09/2010 22:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_LONGINT:C283(<>AutoProc)
	C_TEXT:C284(<>CompCode; <>ProdCode; $_t_oldMethodName; $Mand)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod Components")
//Prod Components
Menu_Record("Prod Components"; "Components")
If ((DB_GetModuleSettingByNUM(Module_Assemblies))>1)
	If (Records in selection:C76([COMPONENTS:86])>0)
		Case of 
			: (DB_GetProductGroupBrand)
				$Mand:="1 3 4 5"
			: (DB_Get_ProductBrandPref)
				$Mand:="1 4 5"
			Else 
				$Mand:="1 5"
		End case 
		If (In_ButtChkMan(->[PRODUCTS:9]; $Mand))
			<>ProdCode:=[PRODUCTS:9]Product_Code:1
			<>CompCode:="*Compo"
			<>AutoFind:=True:C214
			<>DB_bo_AutoOut:=True:C214
			<>AutoProc:=Current process:C322
			DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PRODUCTS:9])); 0; ""; ->[PRODUCTS:9]Product_Code:1)
			
			//ZProducts_Mod ([PRODUCTS]Product Code)
		End if 
	Else 
		Gen_Alert("No Components have yet been specified for this Product"; "Try again")
	End if 
Else 
	Gen_Alert("You do not have access to the "+<>Mod_at_ModuleName{16}+" Submodule"; "Cancel")
End if 
ERR_MethodTrackerReturn("Prod Components"; $_t_oldMethodName)
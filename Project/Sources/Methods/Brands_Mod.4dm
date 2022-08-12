//%attributes = {}
If (False:C215)
	//Project Method Name:      Brands_Mod
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
	C_BOOLEAN:C305($_bo_AutoFind)
	C_TEXT:C284($_t_oldMethodName; $_t_SetName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Brands_Mod")
$_t_SetName:=""
$_bo_AutoFind:=False:C215
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	
	CREATE EMPTY SET:C140([PRODUCT_BRANDS:8]; "BrandFound")
	QUERY:C277([PRODUCT_BRANDS:8]; [PRODUCT_BRANDS:8]Brand_Code:1=$1)
	If (Records in selection:C76([PRODUCT_BRANDS:8])>0)
		CREATE SET:C116([PRODUCT_BRANDS:8]; "BrandFound")
	End if 
	$_t_SetName:="BrandFound"
End if 
Minor_Mod(->[PRODUCT_BRANDS:8]; "Brands"; ""; ""; $_t_SetName; $_bo_AutoFind)
ERR_MethodTrackerReturn("Brands_Mod"; $_t_oldMethodName)

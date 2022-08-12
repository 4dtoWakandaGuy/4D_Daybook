//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_ProdSu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/12/2010 20:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($2; PRD_bo_FilterLoaded; PROD_bo_ShowAlert; vAutoFind)
	C_LONGINT:C283(PRD_l_FilterNLA; xNew)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vProdCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_ProdSu")
//Check Prod SU
If (Not:C34(PRD_bo_FilterLoaded))
	PRD_l_FilterNLA:=ProductDeletionPreferences
	PRD_bo_FilterLoaded:=True:C214
End if 
PROD_bo_ShowAlert:=True:C214
If (Count parameters:C259>=2)
	PROD_bo_ShowAlert:=$2
End if 

vProdCode:=""
xNew:=0
$1:=Check_QM($1)
QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$1)
If (PRD_l_FilterNLA=1)
	QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
Else 
	QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
End if 


If ((Records in selection:C76([PRODUCTS:9])=1) & ([PRODUCTS:9]Product_Code:1=$1) & (Character code:C91(Substring:C12($1; Length:C16($1); 1))#64))
Else 
	vAutoFind:=False:C215
	Prod_Sel2($1)
End if 
If (Records in selection:C76([PRODUCTS:9])>1)
	Check_DispNum(->[PRODUCTS:9]; "Products")
	If (OK=1)
		$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
		DB_t_CurrentFormUsage:="NC"
		Check_Prod2
		//_O_ENABLE BUTTON(xNew)
		OBJECT SET ENABLED:C1123(xNew; True:C214)
		DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	End if 
End if 
If (Records in selection:C76([PRODUCTS:9])=1)
	vProdCode:=[PRODUCTS:9]Product_Code:1
End if 
If (Records in selection:C76([PRODUCTS:9])=0) & (PROD_bo_ShowAlert)
	Gen_Alert("No Products found"; "Try Again")
End if 
ERR_MethodTrackerReturn("Check_ProdSu"; $_t_oldMethodName)
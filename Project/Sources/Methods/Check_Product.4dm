//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Product
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/12/2009 14:41`Method: Check_Product
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FilterComponentOnly; $_bo_FilterIterationsOnly; $_bo_FilterPurchaseOnly; $_bo_UpdateOrderFromProduct; PROD_bo_GetCodeFromItem; PROD_bo_GetValuesFromItem; PROD_bo_iscancelled; vFromIn)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; vCM; xNew)
	C_POINTER:C301($_Ptr_Variable; $1; $3)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CloseSave; $_t_CurrencyCode; $_t_FIlterScript; $_t_oldMethodName; $_t_ProductCode2; $_t_VariableName; $2; $4; $5; DB_t_CallOnCloseorSave)
	C_TEXT:C284(dl_ProductT; vProduct)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_Product")
//Check_Product
If (Count parameters:C259>=4)  //macro to enable additional filering
	$_t_FIlterScript:=$4
End if 
If (Count parameters:C259>=5)
	$_t_CurrencyCode:=$5
Else 
	$_t_CurrencyCode:=<>SYS_t_BaseCurrency
End if 
OK:=1
xNew:=0
$_t_CloseSave:=DB_t_CallOnCloseorSave
$_bo_FilterPurchaseOnly:=False:C215
$_bo_FilterComponentOnly:=False:C215
$_bo_FilterIterationsOnly:=False:C215
If ($1->#"")
	RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	If ($_l_TableNumber>0)
		
		//there may be others to filter them from such as
		If ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25])) | ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161])) | ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37])) | ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
			$_bo_FilterComponentOnly:=True:C214
		End if 
		If ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25])) | ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
			$_bo_FilterPurchaseOnly:=True:C214
		End if 
	Else 
		Case of 
			: ($_t_VariableName="PRD_T_CompProductCode")
				$_bo_FilterIterationsOnly:=True:C214
		End case 
	End if 
	$1->:=Check_QM($1->)
	
	Prod_Sel2($1->)
	If ($_t_FIlterScript#"")
		Macro($_t_FIlterScript)
	End if 
	If ($_bo_FilterComponentOnly)
		QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_Entry_Class:55#3)
	End if 
	If ($_bo_FilterPurchaseOnly)
		QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_Entry_Class:55#7)
	End if 
	If ($_bo_FilterIterationsOnly)
		QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_Entry_Class:55=1)
	End if 
	
	If (Records in selection:C76([PRODUCTS:9])>1)
		Check_DispNum(->[PRODUCTS:9]; "Products")
		If (OK=1)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			Check_Prod2($_l_WindowLeft+20; $_l_WindowTop+20)
			If (OK=0)
				If (Count parameters:C259>=3)
					$3->:=False:C215
				End if 
				GOTO OBJECT:C206($1->)
				REDUCE SELECTION:C351([PRODUCTS:9]; 0)
				
			End if 
		Else 
			If (Count parameters:C259>=3)
				$3->:=True:C214
			End if 
			GOTO OBJECT:C206($1->)
		End if 
	Else 
		If (Records in selection:C76([PRODUCTS:9])=0)
			$_bo_UpdateOrderFromProduct:=True:C214
			If (DB_GetModuleSettingByNUM(Module_Products)=3)
				$_bo_UpdateOrderFromProduct:=False:C215
				Gen_Alert("No Products found"; "Try again")
				WS_KeepFocus
				If (Count parameters:C259>=3)
					$3->:=False:C215
				End if 
				
			Else 
				Gen_Confirm("That Product does not exist.  Do you want to create it?"; "Try again"; "Create it")
				WS_KeepFocus
				
				If (OK=1)
					OK:=0
					GOTO OBJECT:C206($1->)
				Else 
					OK:=1
				End if 
			End if 
		End if 
	End if 
	If (((Records in selection:C76([PRODUCTS:9])=0) | (xNew=1)) & (OK=1) & (DB_GetModuleSettingByNUM(Module_Products)#3))
		$_t_ProductCode2:=Uppercase:C13($1->)
		If (Character code:C91(Substring:C12($_t_ProductCode2; Length:C16($_t_ProductCode2); 1))=64)
			$_t_ProductCode2:=Substring:C12($_t_ProductCode2; 1; Length:C16($_t_ProductCode2)-1)
		End if 
		If (Character code:C91(Substring:C12($_t_ProductCode2; Length:C16($_t_ProductCode2); 1))=64)
			$_t_ProductCode2:=Substring:C12($_t_ProductCode2; 1; Length:C16($_t_ProductCode2)-1)
		End if 
		vCM:=1
		PROD_CheckIfDefaultFromItem($1)  //added kmw 03/09/08
		PROD_bo_GetCodeFromItem:=True:C214  //added kmw 03/09/08 (probably always set this to true if adding a product from a line item)
		PUSH RECORD:C176([ORDERS:24])
		COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$TempOrderItems")
		COPY NAMED SELECTION:C331([ORDERS:24]; "$TempOrders")
		//here we want to a new product in a new window but in the same process
		DB_CreateNewRecord(Current process:C322; False:C215; Table:C252(->[PRODUCTS:9]); True:C214)
		USE NAMED SELECTION:C332("$TempOrders")
		USE NAMED SELECTION:C332("$TempOrderItems")
		POP RECORD:C177([ORDERS:24])
		
		PROD_bo_GetValuesFromItem:=False:C215  //added kmw 03/09/08
		vCM:=0
		If (Not:C34(PROD_bo_iscancelled))  //added NG 03/09/08
			$1->:=[PRODUCTS:9]Product_Code:1
			If (Count parameters:C259>=3)
				$3->:=True:C214
			End if 
		Else   //added NG 03/09/08
			$1->:=""  //added NG 03/09/08
			If (Count parameters:C259>=3)
				$3->:=False:C215
			End if 
			
		End if   //added NG 03/09/08
		
		If (OK=0)
			GOTO OBJECT:C206($1->)
		End if 
		UNLOAD RECORD:C212([PRODUCTS:9])
		RELATE ONE:C42($1->)
		If ($2#"")
			
			$_Ptr_Variable:=Get pointer:C304("v"+$2)
			If (Type:C295($_Ptr_Variable->)=Is string var:K8:2) | (Type:C295($_Ptr_Variable->)=Is text:K8:3) | (Type:C295($_Ptr_Variable->)=Is alpha field:K8:1)  //NG MARCH 2004
				
				$_Ptr_Variable->:=[PRODUCTS:9]Product_Name:2
				dl_ProductT:=[PRODUCTS:9]Product_Name:2
			End if 
		End if 
		
		vFromIn:=False:C215
	Else 
		If (Records in selection:C76([PRODUCTS:9])=0)
			If (Count parameters:C259>=3)
				
				$3->:=False:C215
			End if 
		Else 
			If (Count parameters:C259>=3)
				
				$3->:=True:C214
			End if 
		End if 
		If ($2#"")
			
			$_Ptr_Variable:=Get pointer:C304("v"+$2)
			If (Type:C295($_Ptr_Variable->)=Type:C295([PRODUCTS:9]Product_Name:2))  //NG MARCH 2004
				$_Ptr_Variable->:=[PRODUCTS:9]Product_Name:2
			End if 
			dl_ProductT:=[PRODUCTS:9]Product_Name:2
		End if 
		
		$1->:=[PRODUCTS:9]Product_Code:1
		
	End if 
Else 
	REDUCE SELECTION:C351([PRODUCTS:9]; 0)
	If ($2#"")
		
		$_Ptr_Variable:=Get pointer:C304("v"+$2)
		
		$_Ptr_Variable->:=""
	End if 
End if 
DB_t_CallOnCloseorSave:=$_t_CloseSave
ERR_MethodTrackerReturn("Check_Product"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Product_Order
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ORD_lb_ArraySelection;0)
	C_BOOLEAN:C305($_bo_HandleFromProcess; $_bo_UseCatalogues; $4; PROD_bo_GetCodeFromItem; PROD_bo_GetValuesFromItem; PROD_bo_iscancelled; vFromIn)
	C_LONGINT:C283($_l_AddMode; $_l_Retries; PROD_l_CallingItem; PROD_l_CallingProcess; PROD_l_SelectorPallette; vAdd; vCM; xNew)
	C_POINTER:C301($_Ptr_Variable; $1)
	C_REAL:C285($3)
	C_TEXT:C284($_t_CloseSave; $_t_DragStringControl; $_t_oldMethodName; $_t_SetName; $2; $5; $6; $s; DB_t_CallOnCloseorSave; dl_ProductT; PROD_t_CallingCoCode)
	C_TEXT:C284(PROD_t_CallingPriceCode; PROD_t_UseSetName; vProduct; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_Product_Order")
//Check_Product_Order
$_bo_HandleFromProcess:=False:C215

If (Count parameters:C259>=3)
	$_bo_UseCatalogues:=$4
Else 
	$_bo_UseCatalogues:=False:C215
End if 

OK:=1
xNew:=0
$_t_CloseSave:=DB_t_CallOnCloseorSave
//`````

//`````
If ($1->#"")
	$1->:=Check_QM($1->)
	REDUCE SELECTION:C351([PRODUCTS:9]; 0)
	Prod_Sel2($1->; "@"; False:C215)
	
	If (Records in selection:C76([PRODUCTS:9])>1)
		If ($_bo_UseCatalogues)
			$_bo_HandleFromProcess:=True:C214
			$_t_DragStringControl:="OrdProdItems"
			If (PROD_l_SelectorPallette>0)
				If (Process state:C330(PROD_l_SelectorPallette)<0) | (Process_Name(PROD_l_SelectorPallette)#"Product Selector")
					PROD_l_SelectorPallette:=0
				End if 
			End if 
			//AL_SetDrgDst (eALOrdII;1;$_t_DragStringControl)
			LBI_SetDRGPair(1; ->ORD_lb_ArraySelection; $_t_DragStringControl)
			If (PROD_l_SelectorPallette>0)
				//pallette is open refresh
				$_l_Retries:=0
				While (Semaphore:C143("$SelectorBusy"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(20*(1+$_l_Retries))
				End while 
				CREATE SET:C116([PRODUCTS:9]; "<>Products")
				SET PROCESS VARIABLE:C370(PROD_l_SelectorPallette; PROD_t_UseSetName; "<>Products")
				SET PROCESS VARIABLE:C370(PROD_l_SelectorPallette; PROD_l_CallingProcess; Current process:C322)
				If ([ORDER_ITEMS:25]x_ID:58=0)
					[ORDER_ITEMS:25]x_ID:58:=AA_GetNextIDinMethod(->[ORDER_ITEMS:25]x_ID:58)
				End if 
				
				SET PROCESS VARIABLE:C370(PROD_l_SelectorPallette; PROD_l_CallingItem; [ORDER_ITEMS:25]x_ID:58)
				SET PROCESS VARIABLE:C370(PROD_l_SelectorPallette; PROD_t_CallingPriceCode; $5)
				SET PROCESS VARIABLE:C370(PROD_l_SelectorPallette; PROD_t_CallingCoCode; $6)
				
				POST OUTSIDE CALL:C329(PROD_l_SelectorPallette)
				CLEAR SEMAPHORE:C144("$SelectorBusy")
			Else 
				//start pallette
				//dont forget to end at the close of
				//entering the order
				$_l_Retries:=0
				While (Semaphore:C143("$SelectorBusy"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(20*(1+$_l_Retries))
				End while 
				CREATE SET:C116([PRODUCTS:9]; "<>Products")
				If ([ORDER_ITEMS:25]x_ID:58=0)
					[ORDER_ITEMS:25]x_ID:58:=AA_GetNextIDinMethod(->[ORDER_ITEMS:25]x_ID:58)
				End if 
				$_t_SetName:="◊Products"
				PROD_l_SelectorPallette:=New process:C317("PROD_SelectionPallette"; 128000; "Product Selector"; Current process:C322; $_t_SetName; [ORDER_ITEMS:25]x_ID:58; $5; $6)
				
				CLEAR SEMAPHORE:C144("$SelectorBusy")
			End if 
		Else 
			Check_DispNum(->[PRODUCTS:9]; "Products")
			If (OK=1)
				Check_Prod2
				If (OK=0)
					GOTO OBJECT:C206($1->)
					REDUCE SELECTION:C351([PRODUCTS:9]; 0)
				End if 
			Else 
				GOTO OBJECT:C206($1->)
			End if 
		End if 
		
	Else 
		If (Records in selection:C76([PRODUCTS:9])=0)
			If (DB_GetModuleSettingByNUM(Module_Products)=3)
				Gen_Alert("No Products found"; "Try again")
				WS_KeepFocus
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
		Else 
			//Here test the product is in a catalogue visible for the current user
		End if 
	End if 
	If (Not:C34($_bo_HandleFromProcess))
		If (((Records in selection:C76([PRODUCTS:9])=0) | (xNew=1)) & (OK=1) & (DB_GetModuleSettingByNUM(Module_Products)#3))
			$s:=Uppercase:C13($1->)
			If (Character code:C91(Substring:C12($s; Length:C16($s); 1))=64)
				$s:=Substring:C12($s; 1; Length:C16($s)-1)
			End if 
			If (Character code:C91(Substring:C12($s; Length:C16($s); 1))=64)
				$s:=Substring:C12($s; 1; Length:C16($s)-1)
			End if 
			READ WRITE:C146([PRODUCTS:9])
			$_l_AddMode:=vAdd
			vAdd:=1
			vCM:=1
			
			PROD_CheckIfDefaultFromItem($1)  //added kmw 03/09/08
			PROD_bo_GetCodeFromItem:=True:C214  //added kmw 03/09/08 (probably always set this to true if adding a product from a line item)
			
			Products_FileI  //NG May 2004 lines swapped
			Open_Pro_Window("Enter Product"; 0; 2; ->[PRODUCTS:9]; WIN_t_CurrentInputForm)  //
			ADD RECORD:C56([PRODUCTS:9]; *)
			Close_ProWin(Table name:C256(->[PRODUCTS:9])+"_"+WIN_t_CurrentInputForm)
			
			PROD_bo_GetValuesFromItem:=False:C215  //added kmw 03/09/08
			
			
			vCM:=0
			vAdd:=$_l_AddMode
			READ ONLY:C145([PRODUCTS:9])
			If (Not:C34(PROD_bo_iscancelled))  //added NG 03/09/08
				$1->:=[PRODUCTS:9]Product_Code:1
			Else   //added NG 03/09/08
				$1->:=""  //added NG 03/09/08
			End if   //added NG 03/09/08
			
			If (OK=0)
				GOTO OBJECT:C206($1->)
			End if 
			UNLOAD RECORD:C212([PRODUCTS:9])
			RELATE ONE:C42($1->)
			If ($2#"")  //this bit to be re-written april 2020
				$_Ptr_Variable:=Get pointer:C304("v"+$2)
				If (Type:C295($_Ptr_Variable->)=Is string var:K8:2) | (Type:C295($_Ptr_Variable->)=Is text:K8:3) | (Type:C295($_Ptr_Variable->)=Is alpha field:K8:1)  //NG MARCH 2004
					
					$_Ptr_Variable->:=[PRODUCTS:9]Product_Name:2
				End if 
				dl_ProductT:=[PRODUCTS:9]Product_Name:2
			End if 
			vFromIn:=False:C215
		Else 
			If ($2#"")
				$_Ptr_Variable:=Get pointer:C304("v"+$2)
				If (Type:C295($_Ptr_Variable->)=Is string var:K8:2) | (Type:C295($_Ptr_Variable->)=Is text:K8:3) | (Type:C295($_Ptr_Variable->)=Is alpha field:K8:1)  //NG MARCH 2004
					
					$_Ptr_Variable->:=[PRODUCTS:9]Product_Name:2
				End if 
				dl_ProductT:=vProduct
			End if 
			$1->:=[PRODUCTS:9]Product_Code:1
		End if 
	End if 
	
Else 
	REDUCE SELECTION:C351([PRODUCTS:9]; 0)
	If ($2#"")
		$_Ptr_Variable:=Get pointer:C304("v"+$2)
		If (Type:C295($_Ptr_Variable->)=Is string var:K8:2) | (Type:C295($_Ptr_Variable->)=Is text:K8:3) | (Type:C295($_Ptr_Variable->)=Is alpha field:K8:1)  //NG MARCH 2004
			
			//$_Ptr_Variable:=Get pointer("v"+$2)
			$_Ptr_Variable->:=""
		End if 
		
		//$_Ptr_Variable->:=""
	End if 
End if 

DB_t_CallOnCloseorSave:=$_t_CloseSave
ERR_MethodTrackerReturn("Check_Product_Order"; $_t_oldMethodName)
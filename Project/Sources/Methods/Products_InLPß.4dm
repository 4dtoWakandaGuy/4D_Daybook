//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_InLPß
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/10/2009 22:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_lb_RelatedData;0)
	//ARRAY LONGINT(PROD_al_EditMode;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY TEXT(PRD_at_ModeSupplier;0)
	C_BOOLEAN:C305(PROD_bo_iscancelled)
	C_LONGINT:C283($_l_CurrentFormPage)
	C_PICTURE:C286(PROD_apic_ModePictProd)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_TEXT:C284($_t_HandlerCharacter1; $_t_oldMethodName; $_t_SubItemName; $1; vButtDisPro; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_InLPß")
//Products_InLPß
If (Count parameters:C259>=1)
	$_t_HandlerCharacter1:=Substring:C12($1; 1; 1)
Else 
	$_t_HandlerCharacter1:="N"
End if 
PROD_bo_iscancelled:=False:C215
Case of 
	: ($_t_HandlerCharacter1="N")  //(($_t_HandlerCharacter1="B") | ($_t_HandlerCharacter1="N"))  `use this bit if don't use Before2 method
		Products_InLPB
	: (($_t_HandlerCharacter1="A") | ($_t_HandlerCharacter1="F"))
		Products_InLPA
	: ($_t_HandlerCharacter1="C")
		PROD_bo_iscancelled:=True:C214
	: ($_t_HandlerCharacter1="D")
		Products_InDel
End case 

If (($_t_HandlerCharacter1="B") | ($_t_HandlerCharacter1="N") | ($_t_HandlerCharacter1="S") | ($_t_HandlerCharacter1="P"))
	Case of 
		: ($_t_HandlerCharacter1="B")
			$_l_CurrentFormPage:=1
		: ($_t_HandlerCharacter1="N")
			$_l_CurrentFormPage:=FORM Get current page:C276
		Else 
			$_l_CurrentFormPage:=Num:C11(Substring:C12($1; 2; 1))  //Layout Page you're going to
	End case 
	
	Case of 
		: ($_l_CurrentFormPage=1)
			QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
			
			If (Size of array:C274(PRD_aPtr_RelatedConfiguration)=0)
				LBi_ArrDefFill(->PRD_aPtr_RelatedConfiguration; ->PRD_lb_RelatedData; ->[PRODUCTS_SUPPLIERS:148]ID:7; ->[PRODUCTS:9]Product_Code:1; "211111000"; ""; 3; "Product Suppliers"; "Product Supplier")  // 03/07/06 pb
			Else 
				OK:=1
				Case of 
					: ($_t_HandlerCharacter1="B")
						LBi_Prefs11(->PRD_aPtr_RelatedConfiguration)
					: ($_t_HandlerCharacter1="P")
						
				End case 
			End if 
			LBi_LoadSetup(->PRD_aPtr_RelatedConfiguration; $_t_HandlerCharacter1)
		: ($_l_CurrentFormPage=2)
			
			
	End case 
	If (Size of array:C274(PRD_aPtr_RelatedConfiguration)>=9)
		
		$_ptr_ArrayReferences:=PRD_aPtr_RelatedConfiguration{9}
		If (Size of array:C274($_ptr_ArrayReferences->)>=10)
			$_t_SubItemName:=$_ptr_ArrayReferences->{10}
			Case of 
				: ($_l_CurrentFormPage=3)
					In_ButtChkDis(->vButtDisPro; "Product"; "Component")
				: ($_l_CurrentFormPage=2)
					In_ButtChkDis(->vButtDisPro; "Product"; "Further Analysis")
				: ($_l_CurrentFormPage=1)
					In_ButtChkDis(->vButtDisPro; "Product"; "Supplier")
			End case 
		End if 
	End if 
Else 
	If ((($_t_HandlerCharacter1="A") & (OK=1)) | ((($_t_HandlerCharacter1="C") | ($_t_HandlerCharacter1="D")) & (OK=0)))
		LBi_pRefs4upd(->PRD_aPtr_RelatedConfiguration)
	End if 
	//no ALpRefs4Sort
End if 

PRD_at_ModeSupplier:=1
PROD_al_EditMode:=1

LBi_EditListLay(->PRD_aPtr_RelatedConfiguration; ->PRD_at_ModeSupplier; ->PROD_apic_ModePictProd; ->PROD_al_EditMode)

If (WIN_t_CurrentOutputform="Products_OutCAT")
	CAT_LoadProdStock([PRODUCTS:9]X_ID:43; [PRODUCTS:9]Product_Code:1)
End if 
ERR_MethodTrackerReturn("Products_InLPß"; $_t_oldMethodName)

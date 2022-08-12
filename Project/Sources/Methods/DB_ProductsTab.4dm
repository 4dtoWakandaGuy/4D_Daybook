//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ProductsTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   11/03/2011 16:24 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PRD_al_ProductsTabPage;0)
	//ARRAY LONGINT(PRD_al_ViewTabletoTable;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY TEXT(PRD_at_ProductsTab;0)
	//ARRAY TEXT(PRD_at_ViewTabsLabels;0)
	C_LONGINT:C283($_l_TabRow)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_TEXT:C284($_t_MenuItemParamter; $_t_oldMethodName; vButtDisPro)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ProductsTab")
$_t_MenuItemParamter:=Get selected menu item parameter:C1005
If ($_t_MenuItemParamter#"")
	$_l_TabRow:=Num:C11($_t_MenuItemParamter)
	If ($_l_TabRow>0)
		PRD_at_ProductsTab:=$_l_TabRow
	End if 
End if 

If (PRD_al_ProductsTabPage{PRD_at_ProductsTab}#FORM Get current page:C276) & (PRD_at_ProductsTab>0)
	If (FORM Get current page:C276=1)
		Case of 
				
			: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[PRICE_TABLE:28]))
				If ([PRICE_TABLE:28]Table_Code:12#"")
					DB_SaveRecord(->[PRICE_TABLE:28])
					
				End if 
		End case 
	End if 
	FORM GOTO PAGE:C247(PRD_al_ProductsTabPage{PRD_at_ProductsTab})
	If (Size of array:C274(PRD_aPtr_RelatedConfiguration)>=9)
		
		$_ptr_ArrayReferences:=PRD_aPtr_RelatedConfiguration{9}
		If (Size of array:C274($_ptr_ArrayReferences->)>=10)
			//$_t_SubItemName:=$_ptr_ArrayReferences->{10}
			Case of 
				: (PRD_al_ProductsTabPage{PRD_at_ProductsTab}=3)
					In_ButtChkDis(->vButtDisPro; "Product"; "Component")
				: (PRD_al_ProductsTabPage{PRD_at_ProductsTab}=2)
					In_ButtChkDis(->vButtDisPro; "Product"; "Further Analysis")
				: (PRD_al_ProductsTabPage{PRD_at_ProductsTab}=1)
					In_ButtChkDis(->vButtDisPro; "Product"; "Supplier")
			End case 
		End if 
	Else 
		
		
		In_ButtChkDis(->vButtDisPro)
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_ProductsTab"; $_t_oldMethodName)
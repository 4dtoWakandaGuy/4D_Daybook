//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_AddSubEntityComponents
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: PROD_AddSubEntityComponents`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_LB_ProdComponents;0)
	//ARRAY BOOLEAN(PROD_abo_ComponentsModified;0)
	//ARRAY BOOLEAN(PROD_lb_SubsComponents;0)
	//ARRAY LONGINT(PRD_al_SectionID;0)
	//ARRAY LONGINT(PRD_al_UsedSectionIDS;0)
	//ARRAY LONGINT(PROD_al_ComponentID;0)
	//ARRAY REAL(PROD_ar_ComponentsQTY;0)
	//ARRAY TEXT(PROD_at_ComponentsCode;0)
	//ARRAY TEXT(PROD_at_ComponentsNM;0)
	//ARRAY TEXT(PROD_at_ComponentUnique;0)
	C_LONGINT:C283($_l_MaxSections; PRD_al_CodeFormatID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("PROD_AddSubEntityComponents")

//
//NG Feb 2004
//The method is only applicable within the form [PRODUCTS]Products_In
//It is the script of the button Bacc_l_ComponentshModify which adds a new component(or set a highlighted one to edit)
//it is in a method so the call can be via an outside call
$_t_oldMethodName:=ERR_MethodTracker("PROD_AddSubEntityComponents"; Form event code:C388)
Case of 
	: ([PRODUCTS:9]x_Product_Entry_Class:55=0)  //standard product
		APPEND TO ARRAY:C911(PROD_at_ComponentsCode; "")
		APPEND TO ARRAY:C911(PROD_at_ComponentsNM; "")
		APPEND TO ARRAY:C911(PROD_ar_ComponentsQTY; 0)
		APPEND TO ARRAY:C911(PROD_at_ComponentUnique; "")
		APPEND TO ARRAY:C911(PROD_al_ComponentID; AA_GetNextID(->[COMPONENTS:86]X_ComponentID:21))
		
		APPEND TO ARRAY:C911(PROD_abo_ComponentsModified; False:C215)
		LB_SetScroll(->PRD_LB_ProdComponents; Size of array:C274(PROD_at_ComponentsCode))
		LB_GoToCell(->PRD_LB_ProdComponents; 1; Size of array:C274(PROD_at_ComponentsCode))
		LBI_Scrollonresize(->PRD_LB_ProdComponents)
		
	: ([PRODUCTS:9]x_Product_Entry_Class:55=2)  //built product
		If ([PRODUCTS:9]Product_Code:1#"")
			If ([PRODUCTS:9]Product_Build_Format_ID:57>0)
				If ([PRODUCT_BUILT_CODE_FORMAT:189]FORMAT_ID:1#[PRODUCTS:9]Product_Build_Format_ID:57)
					QUERY:C277([PRODUCT_BUILT_CODE_FORMAT:189]; [PRODUCT_BUILT_CODE_FORMAT:189]FORMAT_ID:1=[PRODUCTS:9]Product_Build_Format_ID:57)
				End if 
				$_l_MaxSections:=[PRODUCT_BUILT_CODE_FORMAT:189]NUMBER_OF_SECTIONS:3
				If (Size of array:C274(PROD_at_ComponentUnique)<$_l_MaxSections)
					PRD_al_CodeFormatID:=[PRODUCTS:9]Product_Build_Format_ID:57
					COPY ARRAY:C226(PRD_al_SectionID; PRD_al_UsedSectionIDS)
					PRD_L_EditComplexComponent(0; PRD_al_CodeFormatID; ->PRD_al_UsedSectionIDS)
					
					PROD_LoadComponents(True:C214; [PRODUCTS:9]Product_Code:1; False:C215)
					//TRACE
					
				Else 
					Gen_Alert("You have already set the maximum number of component parts for this format you may not add any more components")
				End if 
				
			Else 
				Gen_Alert("You may not define the component structure of a constructed product  until you define its product code formatting")
			End if 
		End if 
		LB_SetScroll(->PRD_LB_ProdComponents; Size of array:C274(PROD_at_ComponentsCode))
		LB_GoToCell(->PRD_LB_ProdComponents; 1; Size of array:C274(PROD_at_ComponentsCode))
		LBI_Scrollonresize(->PRD_LB_ProdComponents)
		
	: ([PRODUCTS:9]x_Product_Entry_Class:55=3)  //time based product..can this have a componenets?
		
	: ([PRODUCTS:9]x_Product_Entry_Class:55=4) & (FORM Get current page:C276=6)  //
		If ([PRODUCTS:9]Product_Code:1#"")
			APPEND TO ARRAY:C911(PROD_at_ComponentsCode; "")
			APPEND TO ARRAY:C911(PROD_at_ComponentsNM; "")
			APPEND TO ARRAY:C911(PROD_ar_ComponentsQTY; 1)
			APPEND TO ARRAY:C911(PROD_at_ComponentUnique; "")
			APPEND TO ARRAY:C911(PROD_al_ComponentID; AA_GetNextID(->[COMPONENTS:86]X_ComponentID:21))
			
			APPEND TO ARRAY:C911(PROD_abo_ComponentsModified; False:C215)
			
			
			LB_SetScroll(->PROD_lb_SubsComponents; Size of array:C274(PROD_at_ComponentsCode))
			LBI_Scrollonresize(->PROD_lb_SubsComponents)
			GOTO OBJECT:C206(PROD_lb_SubsComponents)
			LB_GoToCell(->PROD_lb_SubsComponents; 2; Size of array:C274(PROD_at_ComponentsCode))
			
		End if 
End case 
ERR_MethodTrackerReturn("PROD_AddSubEntityComponents"; $_t_oldMethodName)

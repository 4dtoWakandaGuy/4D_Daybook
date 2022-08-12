If (False:C215)
	//object Name: [PRODUCTS]dAsk Product.oHoldWindow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PROD_lb_Products;0)
	ARRAY LONGINT:C221($_al_ColumnWIdths; 0)
	//ARRAY PICTURE(PRD_apic_Info;0)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(PRD_at_Urls;0)
	//ARRAY TEXT(PROD_at_DisplayDetail;0)
	C_BOOLEAN:C305(PRD_bo_PictureColumnAdded; PROD_bo_ExpandWindow; PROD_bo_HoldWindow)
	C_LONGINT:C283($_l_CommaPosition; $_l_FormWidth; $_l_IdentityCount; $_l_SetpicIndex)
	C_TEXT:C284($_t_ColumnWidthsCombined; $_t_ColumnWidthString; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].dAsk Product.oHoldWindow"; Form event code:C388)
If (PROD_bo_HoldWindow)
	OBJECT SET VISIBLE:C603(PROD_bo_ExpandWindow; True:C214)
	If (Not:C34(PRD_bo_PictureColumnAdded))
		$_t_ColumnWidthsCombined:=DB_LoadDisplayPref(Table:C252(->[PRODUCTS:9]); "dAsk_Product"; ""; False:C215; "")
		If ($_t_ColumnWidthsCombined="")
			ARRAY LONGINT:C221($_al_ColumnWIdths; 4)
			If ($_al_ColumnWIdths{1}=0)
				$_al_ColumnWIdths{1}:=131
			End if 
			If ($_al_ColumnWIdths{2}=0)
				$_al_ColumnWIdths{2}:=57
			End if 
			If ($_al_ColumnWIdths{3}=0)
				$_al_ColumnWIdths{3}:=191
			End if 
			If ($_al_ColumnWIdths{4}=0)
				$_al_ColumnWIdths{4}:=80
			End if 
		Else 
			ARRAY LONGINT:C221($_al_ColumnWIdths; 0)
			Repeat 
				$_l_CommaPosition:=Position:C15(","; $_t_ColumnWidthsCombined)
				If ($_l_CommaPosition>0)
					$_t_ColumnWidthString:=Substring:C12($_t_ColumnWidthsCombined; 1; $_l_CommaPosition-1)
					$_t_ColumnWidthsCombined:=Substring:C12($_t_ColumnWidthsCombined; $_l_CommaPosition+1; Length:C16($_t_ColumnWidthsCombined))
				Else 
					$_t_ColumnWidthString:=$_t_ColumnWidthsCombined
					$_t_ColumnWidthsCombined:=""
				End if 
				
				APPEND TO ARRAY:C911($_al_ColumnWIdths; Num:C11($_t_ColumnWidthString))
				
				
			Until ($_t_ColumnWidthsCombined="")
		End if 
		ARRAY LONGINT:C221($_al_ColumnWIdths; 4)
		
		
		$_l_IdentityCount:=Size of array:C274(GEN_at_Identity)
		ARRAY PICTURE:C279(PRD_apic_Info; $_l_IdentityCount)
		For ($_l_SetpicIndex; 1; Size of array:C274(PRD_apic_Info))
			//GET PICTURE FROM LIBRARY(418; PRD_apic_Info{$_l_SetpicIndex})
			PRD_apic_Info{$_l_SetpicIndex}:=Get_Picture(418)
		End for 
		LB_SetupListbox(->PROD_lb_Products; "PROD_t"; "PROD_L"; 1; ->PRD_apic_Info; ->GEN_at_Identity; ->GEN_at_Name; ->GEN_at_RecordCode; ->GEN_ar_Value)
		LB_SetColumnHeaders(->PROD_lb_Products; "PROD_L"; 1; "Detail"; "Code"; "Name"; "Short Code"; PROD_at_DisplayDetail{PROD_at_DisplayDetail})
		
		LB_SetColumnWidths(->PROD_lb_Products; "PROD_t"; 1; 40; $_al_ColumnWIdths{1}; $_al_ColumnWIdths{2}; $_al_ColumnWIdths{3}; $_al_ColumnWIdths{4})
		$_l_FormWidth:=40+20+$_al_ColumnWIdths{1}+$_al_ColumnWIdths{2}+$_al_ColumnWIdths{3}+$_al_ColumnWIdths{4}
		LB_SetEnterable(->PROD_lb_Products; False:C215; 0)
		LB_SetScroll(->PROD_lb_Products; -3; -2)
		LB_StyleSettings(->PROD_lb_Products; "Black"; 9; "PROD_t"; ->[ACCOUNTS:32])
		LB_SetFormat(->PROD_lb_Products; 2; ""; 5; 5; 2)
		OBJECT SET VISIBLE:C603(PRD_at_Urls; True:C214)
		OBJECT SET VISIBLE:C603(*; "oWebLabel"; True:C214)
		
		
	End if 
Else 
	OBJECT SET VISIBLE:C603(PROD_bo_ExpandWindow; False:C215)
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].dAsk Product.oHoldWindow"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      FUR_FillListBoxArea
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/02/2010 09:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305(vAutoFind)
	C_LONGINT:C283($_l_Column1Width; $_l_Column2Width; $_l_ListboxWidth; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObjectWidth; $_l_SizeofArray; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRight; $_l_WindowTop; $_l_WindowWidth; Furth_l_BUT1; Furth_l_BUT2; Furth_l_BUT3)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; oFurth_COL1; oFurth_COL2; oFurth_COL3; oFurth_HED1; oFurth_HED2; oFurth_HED3)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FUR_FillListBoxArea")

If (Count parameters:C259>=1)
	LB_SetupListbox($1; "oFurth"; "FF_L"; 1; ->FUR_at_CustomFieldNames; ->CUS_at_DisplayedData; ->FUR_at_CustomFieldTypes)
	LB_SetScroll($1; -2; -2)
	//AL_UpdateArrays (eALFurth;-2)
	
	LB_SetColumnHeaders($1; "FF_L"; 1; "Field Name"; "Field Value"; "Type")
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
	$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
	OBJECT GET COORDINATES:C663(GEN_lb_ItemsArea; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
	If ($_l_ObjectWidth<($_l_WindowWidth-68))
		$_l_ObjectWidth:=$_l_WindowWidth-68
	End if 
	
	$_l_ListboxWidth:=$_l_ObjectWidth-55
	$_l_Column1Width:=150
	$_l_Column2Width:=$_l_ListboxWidth-150
	If ($_l_Column2Width<0)
		$_l_Column2Width:=200
	End if 
	LB_SetColumnWidths($1; "oFurth"; 1; $_l_Column1Width; $_l_Column2Width; 55)  // dont need to worry about the invisible ones
	LB_StyleSettings($1; "black"; 9; "oFurth"; ->[CUSTOM_FIELDS:98])
	OBJECT SET ENTERABLE:C238(FUR_at_CustomFieldNames; False:C215)
	If (vAutoFind=False:C215)
		OBJECT SET ENTERABLE:C238(CUS_at_DisplayedData; False:C215)
	End if 
	OBJECT SET ENTERABLE:C238(FUR_at_CustomFieldTypes; False:C215)
	LB_SetFormat($1; 2; ""; 3; 0; Align center:K42:3)
	$_l_SizeofArray:=Size of array:C274(FUR_at_CustomFieldNames)
	If (Count parameters:C259>=2)
		LB_StyleSettings($1; "Black"; 9; "oFurth_"; $2)
	End if 
End if 
ERR_MethodTrackerReturn("FUR_FillListBoxArea"; $_t_oldMethodName)
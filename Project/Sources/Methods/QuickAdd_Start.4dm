//%attributes = {}
If (False:C215)
	//Project Method Name:      QuickAdd_Start
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2012 09:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	//ARRAY BOOLEAN(ORD_lb_ArraySelection;0)
	//ARRAY REAL(ORD_ar_QuickAddQuantity;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdCode;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdName;0)
	//ARRAY TEXT(ORD_AT_QuickAddSerialNo;0)
	C_BOOLEAN:C305($_bo_Modified; DB_bo_RecordModified; ORD_bo_QuickAddMode)
	C_LONGINT:C283($_l_Column1WIdth; $_l_Column2WIdth; $_l_ListboxWidth; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_RemainingWidth; $_l_WindowBottom; $_l_WindowBottom2; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowLeft2; $_l_WindowRight; $_l_WindowRight2; $_l_windowTop; $_l_WindowTop2; $_l_WindowWidth; ch1; Furth_l_BUT1; Furth_l_BUT2; Furth_l_BUT3; ORD_l_quickaddprocess)
	C_LONGINT:C283(vAct1; vAct2)
	C_REAL:C285($1; $2; $3; $4; vQuantity)
	C_TEXT:C284($_t_oldMethodName; oFurth_COL1; oFurth_COL2; oFurth_COL3; oFurth_HED1; oFurth_HED2; oFurth_HED3; vProdCode; vProdName; vSerialNo)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QuickAdd_Start")
//QuickAdd_Start
vProdCode:=""
vProdName:=""
vQuantity:=1
vSerialNo:=""
ch1:=0
vAct1:=0  //Stores the previous position in the array
vAct2:=0
$_bo_Modified:=DB_bo_RecordModified
DB_bo_RecordModified:=False:C215
QuickAdd_Arr(0)
If (False:C215)
	Open_Pro_Window(":QuickAdd Items")
	If (Count parameters:C259>=4)
		SET WINDOW RECT:C444($1; $2; $3; $4)
	End if 
	
	DIALOG:C40([ORDERS:24]; "dQuickAdd")
	Close_ProWin
	
	DB_bo_RecordModified:=$_bo_Modified
Else 
	OBJECT SET VISIBLE:C603(*; "oListBoxOrderitems2"; True:C214)
	OBJECT SET VISIBLE:C603(*; "oListBoxOrderitems1"; False:C215)
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	ORD_l_quickaddprocess:=New process:C317("ORD_QuickAddButtons"; 128000; "Quick Add Manager"; Current process:C322; $_l_WindowLeft; $_l_windowTop; *)
	ORD_bo_QuickAddMode:=True:C214
	LB_SetupListbox(->ORD_lb_ArraySelection; "oFurth"; "FF_L"; 1; ->ORD_AT_QuickAddProdCode; ->ORD_ar_QuickAddQuantity; ->ORD_AT_QuickAddProdName; ->ORD_AT_QuickAddSerialNo)
	LB_SetScroll(->ORD_lb_ArraySelection; -2; -2)
	//AL_UpdateArrays (eALFurth;-2)
	
	LB_SetColumnHeaders(->ORD_lb_ArraySelection; "FF_L"; 1; "Product Code"; "Quantity"; "Product Name"; "Serial Number")
	GET WINDOW RECT:C443($_l_WindowLeft2; $_l_WindowTop2; $_l_WindowRight2; $_l_WindowBottom2)
	$_l_WindowWidth:=$_l_WindowRight2-$_l_WindowLeft2
	OBJECT GET COORDINATES:C663(GEN_lb_ItemsArea; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ListboxWidth:=$_l_ObjectRight-$_l_ObjectLeft
	If ($_l_ListboxWidth<($_l_WindowWidth-68))
		$_l_ListboxWidth:=$_l_WindowWidth-68
	End if 
	
	$_l_RemainingWidth:=$_l_ListboxWidth-55
	$_l_Column1WIdth:=155
	$_l_Column2WIdth:=$_l_RemainingWidth-155
	If ($_l_Column2WIdth<0)
		$_l_Column2WIdth:=200
	End if 
	If ((DB_GetModuleSettingByNUM(Module_SerialNos))>0)
		
		LB_SetColumnWidths(->ORD_lb_ArraySelection; "oFurth"; 1; $_l_Column1WIdth; 55; $_l_Column2WIdth; 100)
	Else 
		LB_SetColumnWidths(->ORD_lb_ArraySelection; "oFurth"; 1; $_l_Column1WIdth; 55; $_l_Column2WIdth; 0)
	End if 
	LB_StyleSettings(->ORD_lb_ArraySelection; "black"; 9; "oFurth"; ->[ORDERS:24])
	
	If (Count parameters:C259>=2)
		LB_StyleSettings(->ORD_lb_ArraySelection; "Black"; 9; "oFurth_"; ->[ORDERS:24])
	End if 
	//LB_SetEnterable (->ORD_lb_ArraySelection;False)
	LB_SetEnterable(->ORD_lb_ArraySelection; True:C214; 1)
	LB_SetEnterable(->ORD_lb_ArraySelection; True:C214; 3)
	LISTBOX INSERT ROWS:C913(ORD_lb_ArraySelection; 1)
	LB_GoToCell(->ORD_lb_ArraySelection; 1; 1)
	
End if 
ERR_MethodTrackerReturn("QuickAdd_Start"; $_t_oldMethodName)

If (False:C215)
	//object Name: Object Name:      LAYOUT_CONFIG.Field1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/02/2013 15:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(LAY_lb_Columns;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY POINTER(DB_aptr_Setup;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_BOOLEAN:C305(DB_bo_RecordModified; LAY_bo_RecordEdited; LAY_bo_ShowLastColumn)
	C_LONGINT:C283($_l_Column; $_l_ColumnNumber; $_l_ColumnWidth; $_l_event; $_l_TotalWidth; LAY_l_ConfigCancel; LAY_l_ConfigSave; LAY_l_CurrentColumnsWidth)
	C_POINTER:C301($_ptr_ArrayofColumnWIdths)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ LAYOUT_CONFIG.Field1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		If (Size of array:C274(DB_aptr_Setup)>=20)
			LAY_bo_RecordEdited:=True:C214
			DB_bo_RecordModified:=True:C214
			OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; True:C214)
			OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; True:C214)
			$_l_Column:=[LIST_LAYOUTS:96]Order:7
			$_ptr_ArrayofColumnWIdths:=DB_aptr_Setup{13}
			$_ptr_ArrayofColumnWIdths->{$_l_Column}:=[LIST_LAYOUTS:96]Width:5
			LAY_bo_ShowLastColumn:=True:C214
			ARRAY TEXT:C222($_at_ColumnNames; 0)
			ARRAY TEXT:C222($_at_HeaderNames; 0)
			ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
			ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
			ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
			ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
			
			LBi_LoadSetup(->DB_aptr_Setup)
			LISTBOX GET ARRAYS:C832(LAY_lb_Columns; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
			$_l_TotalWidth:=20
			$_l_ColumnWidth:=0
			//ALERT("SIZE3")
			For ($_l_ColumnNumber; 1; Size of array:C274($_aptr_ColumnVariables))
				If ($_abo_ColumnsVisible{$_l_ColumnNumber}=True:C214)
					LB_GetWidths(->LAY_lb_Columns; $_l_ColumnNumber; ->$_l_ColumnWidth)
					$_l_TotalWidth:=$_l_TotalWidth+$_l_ColumnWidth
				End if 
			End for 
			LAY_l_CurrentColumnsWidth:=$_l_TotalWidth
			
			
		Else 
			Gen_Alert("Error")
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ LAYOUT_CONFIG.Field1"; $_t_oldMethodName)

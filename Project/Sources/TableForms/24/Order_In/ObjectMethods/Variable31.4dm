If (False:C215)
	//object Name: [ORDERS]Orders_In.Variable31
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/08/2012 21:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	C_LONGINT:C283($_l_TableRow)
	C_POINTER:C301($_ptr_ListBoxSetup)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.Variable31"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		$_l_TableRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
		
		If ($_l_TableRow>0)
			$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableRow}
			
			LBi_DragCopy($_ptr_ListBoxSetup; ->[ORDER_ITEMS:25]Item_Number:27; ""; "ORD_SelectedRelated")
		End if 
End case 
ERR_MethodTrackerReturn("OBJ:Orders_In,ORD_l_BDragAll"; $_t_oldMethodName)

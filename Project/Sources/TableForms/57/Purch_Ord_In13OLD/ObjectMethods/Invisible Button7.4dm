If (False:C215)
	//object Name: [PURCHASE_ORDERS]Purch_Ord_In13OLD.Invisible Button7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 19:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PAL_at_PopUpMenu5;0)
	C_BOOLEAN:C305(PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_CallBackProcess; $_l_event; $_l_FieldNumber; $_l_Index; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_PopUpProcess; $_l_TableNumber)
	C_POINTER:C301($_ptr_PalletButton; $_Ptr_PopUpNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_PopupMenu; $_t_ProcessName; $_t_RecordName; $_t_RecordName2; $_t_SubRecordName; $_t_SubRecordName2; PAL_BUTTON)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.Invisible Button7"; Form event code:C388)
$_ptr_PalletButton:=Self:C308
RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
$_l_event:=Form event code:C388
$_l_ButtonNumber:=Num:C11(PAL_BUTTON)
$_t_RecordName:="Order"  //This will be contextual
$_t_SubRecordName:="Order Items"  //This will be contextual
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (Size of array:C274(PAL_at_PopUpMenu5)>=2)
			$_t_RecordName:=PAL_at_PopUpMenu5{1}
			$_t_SubRecordName:=PAL_at_PopUpMenu5{2}
			$_t_RecordName2:=Replace string:C233($_t_RecordName; "Delete "; "")
			$_t_SubRecordName2:=Replace string:C233($_t_SubRecordName; "Delete "; "")
			Gen_Confirm("Delete "+$_t_RecordName+" or "+$_t_SubRecordName; $_t_SubRecordName; $_t_RecordName)
			
			
			If (Ok=0)
				PAL_BUTTON:="PAL_BUTTON"+String:C10(3)
			Else 
				PAL_BUTTON:="PAL_BUTTON"+String:C10(5)
			End if 
		Else 
			PAL_BUTTON:="PAL_BUTTON"+String:C10(3)
		End if 
	: ($_l_event=On Long Click:K2:37)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		$_Ptr_PopUpNumber:=Get pointer:C304("PAL_at_PopUpMenu"+String:C10($_l_ButtonNumber))
		PAL_bo_ButtonSubFunction:=True:C214
		$_t_ProcessName:="$PALPOP_"+PAL_BUTTON
		$_l_CallBackProcess:=Current process:C322
		$_Ptr_PopUpNumber:=Get pointer:C304("PAL_at_PopUpMenu"+String:C10($_l_ButtonNumber))
		PAL_bo_ButtonSubFunction:=True:C214
		$_t_ProcessName:="$PALPOP_"+PAL_BUTTON
		$_l_CallBackProcess:=Current process:C322
		$_t_PopupMenu:=""
		If (Size of array:C274($_Ptr_PopUpNumber->)>0)
			For ($_l_Index; 1; Size of array:C274($_Ptr_PopUpNumber->))
				If ($_l_Index=1)
					$_t_PopupMenu:=$_Ptr_PopUpNumber->{$_l_Index}
				Else 
					$_t_PopupMenu:=$_t_PopupMenu+";"+$_Ptr_PopUpNumber->{$_l_Index}
				End if 
				
			End for 
			
			$_l_PopUpProcess:=New process:C317("PAL_DisplayPopUp"; 64000; $_t_ProcessName; $_l_CallBackProcess; $_l_ButtonNumber; $_l_MouseX; $_l_MouseY; $_t_PopupMenu)
			BRING TO FRONT:C326($_l_PopUpProcess)
		Else 
			
			PAL_bo_ButtonSubFunction:=False:C215
			
		End if 
		//ARRAY STRING(55;PAL_at_PopUpMenu5;2)
		//ARRAY STRING(55;PAL_at_Function5;2)
		//NG note we will swap these words contextually.
		//PAL_at_PopUpMenu5{1}:="Delete"+$_t_RecordName
		//PAL_at_Function5{1}:="DeleteRecord"
		//PAL_at_PopUpMenu5{2}:="Delete "+$_t_SubRecordName
		//PAL_at_Function5{2}:="DeleteSubrecord"
		
	Else 
		
		PAL_bo_ButtonSubFunction:=False:C215
		
		
End case 
ERR_MethodTrackerReturn("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.Invisible Button7"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_SuMod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     22/11/2010 20:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	C_BOOLEAN:C305($_bo_Reselect)
	C_LONGINT:C283($_l_TableRow)
	C_POINTER:C301($_ptr_HighlightSet; $_ptr_ListBoxSetup; BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_Button; $_t_CurrentFormUsage; $_t_HighlightSetName; $_t_NamedSet; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_SuMod")
//Orders_SuMod
Menu_Record("Orders_SuMod"; "Subscription Details")
If (DB_GetModuleSettingByNUM(Module_Subscriptions)>1)
	//If (◊Screen="13"
	If (Gen_PPChkStSing(->[ORDERS:24]State:15; 6))
		//TRACE
		$_t_Button:=BUT_p_ButtonStringPointer->
		COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
		$_t_NamedSet:=""
		$_bo_Reselect:=False:C215
		If ($_t_Button="II@")
			OK:=1
		Else 
			$_l_TableRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
			OK:=0
			If ($_l_TableRow>0)
				
				$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableRow}
				$_ptr_HighlightSet:=$_ptr_ListBoxSetup->{20}
				$_t_HighlightSetName:=$_ptr_HighlightSet->
				$_bo_Reselect:=False:C215
				If ($_t_HighlightSetName#"")
					If (Records in set:C195($_t_HighlightSetName)>0)
						USE SET:C118($_t_HighlightSetName)
						CREATE SET:C116([ORDER_ITEMS:25]; "$Reselection")
						$_bo_Reselect:=True:C214
					End if 
				End if 
				
				OK:=Num:C11((Records in selection:C76([ORDER_ITEMS:25])>=1))
			End if 
		End if 
		If (OK=1)
			If ([ORDER_ITEMS:25]Product_Code:2#"")
				//  START TRANSACTION
				StartTransaction  // 13/05/02 pb
				
				If ([ORDER_ITEMS:25]Invoice_Number:17="SUBS*")
					OrderI_SubSubs
				End if 
				$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
				DB_t_CurrentFormUsage:="Items"
				
				//INPUT FORM([ORDER ITEMS];"Items_Su")
				//Open_Pro_Window ("Subscriptions";0;2;->[ORDER ITEMS];"Items_Su")
				
				//MODIFY RECORD([ORDER ITEMS];*)
				DBI_DisplayRecord(-Current process:C322; Table:C252(->[ORDER_ITEMS:25]); "Subscriptions")
				//Close_ProWin (Table name(->[ORDER ITEMS])+"_"+"Items_Su")
				//UNLOAD RECORD([ORDER ITEMS])
				//iNPUT FORM([ORDER ITEMS];"Items_in")
				Transact_End  // 13/05/02 pb
				
				If ($_t_Button#"II@")
					Orders_InLPOI
					Orders_InLPß("S1")
				End if 
				DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
			Else 
				Gen_Alert("Please first choose an Item with a Subscriptions Product Code"; "Cancel")
			End if 
		Else 
			Gen_Alert("Please first choose an Item with a Subscriptions Product Code"; "Cancel")
		End if 
		USE NAMED SELECTION:C332("$Temp")
		If ($_bo_Reselect)
			HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("Orders_SuMod"; $_t_oldMethodName)

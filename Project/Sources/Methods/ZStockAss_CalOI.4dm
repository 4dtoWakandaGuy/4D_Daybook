//%attributes = {}
If (False:C215)
	//Project Method Name:      ZStockAss_CalOI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   22/11/2010 16:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(ORD_bo_IsRevision)
	C_LONGINT:C283($_l_TableRow)
	C_POINTER:C301($_ptr_ListBoxSetup)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZStockAss_CalOI")
If (Not:C34(ORD_bo_IsRevision))
	
	Menu_Record("ZStockAss_CalOI"; "Trial Assembly - Display")
	If ((DB_GetModuleSettingByNUM(Module_Assemblies))>1)
		If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
			$_l_TableRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
			
			If ($_l_TableRow>0)
				$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableRow}
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
				//TRACE
				COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
				If (LBi_FindIfAL($_ptr_ListBoxSetup))
					If ([ORDER_ITEMS:25]Product_Code:2="")
						Gen_Alert("Please first select an Item line containing a Product Code"; "Try again")
					Else 
						ZProc("StockAss_CalcDP"; DB_ProcessMemoryinit(2); "Trial Assembly"; [ORDER_ITEMS:25]Product_Code:2)
					End if 
				End if 
				USE NAMED SELECTION:C332("$Temp")
			End if 
		Else 
			Gen_Alert("This function can only be used when viewing order items")
			
		End if 
		
	Else 
		Gen_Alert("You do not have access to Assemblies"; "Cancel")
	End if 
Else 
	Gen_Alert("This Function cannot be used when viewing previous revisions")
End if 
ERR_MethodTrackerReturn("ZStockAss_CalOI"; $_t_oldMethodName)
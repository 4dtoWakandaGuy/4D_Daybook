//%attributes = {}
If (False:C215)
	//Project Method Name:      Table_Setup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 12:58
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_ModuleAccess; $1; MOD_l_CurrentModuleAccess; vIn)
	C_TEXT:C284(<>SYS_t_ACCOpenBalancesStatus; $_t_oldMethodName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Table_Setup")
If (Count parameters:C259>=1)
	Case of 
		: ($1=Table:C252(->[INVOICES_ITEMS:161]))
			//DEFAULT TABLE([INVOICES_ITEMS])
			FORM SET INPUT:C55([INVOICES_ITEMS:161]; "Items_in")  //NG April 2004 removed reference to ◊screen
			WIN_t_CurrentInputForm:="Items_in"  //Added NG may 2004
			//ARRAY POINTER(INV_aptr_ListboxSetup;0)
			FORM SET OUTPUT:C54([INVOICES_ITEMS:161]; "Items_Out")
			WIN_t_CurrentOutputform:="Items_Out"
			vIn:=1
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)
			If ($_l_ModuleAccess<2)
				Gen_Alert("You do not have access to the Sales Ledger Module"; "Cancel")
				OK:=0
				vIn:=0
				$0:=False:C215
			Else 
				If (<>SYS_t_ACCOpenBalancesStatus#"")
					$0:=False:C215
					Gen_Confirm("You cannot access the Sales Ledger until all Opening Balance"+" postings have been completed."+Char:C90(13)+Char:C90(13)+"Would you like to see the Opening Balances screen now?"; "Opening Bals"; "Cancel")
					If (OK=1)
						ZStartup_SetOB
					End if 
					OK:=0
					vIn:=0
					// Process_End
					// ABORT
				Else 
					$0:=True:C214
					READ ONLY:C145([INVOICES_ITEMS:161])  //This is always read only
					If (MOD_l_CurrentModuleAccess#3)
						READ ONLY:C145([INVOICES_ITEMS:161])
					End if 
				End if 
			End if 
	End case 
	
	
End if 
ERR_MethodTrackerReturn("Table_Setup"; $_t_oldMethodName)

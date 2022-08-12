//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_Mod2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/01/2010 14:21
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; StatsSwitch; SYS_bo_StatsView)
	C_POINTER:C301($2; $4)
	C_TEXT:C284($_t_oldMethodName; $1; $3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Mod2")
If (SYS_bo_StatsView)
	
	StatsView_Disp($1; $2; $3)
	If (StatsSwitch)
		StatsSwitch:=False:C215
		SYS_bo_StatsView:=False:C215
		Close_ProWin
		Open_Pro_Window($1)
		WIn_SetFormSize(1; $2; WIN_t_CurrentOutputform)
		Gen_Mod2($1; $2; $3)
	End if 
	StatsSwitch:=False:C215
Else 
	
	
	//OUTPUT FORM([COMPANIES];"TEST")
	//ALERT("13")  `4/1/2010
	FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252($2))
	//ALERT("14")  `4/1/2010
	
	WIn_SetFormSize(1; $2; WIN_t_CurrentOutputform)
	//ALERT("15")  `4/1/2010
	MODIFY SELECTION:C204($2->; *)
	If (OK=0)
		If (Count parameters:C259>=4)
			$4->:=-1
		End if 
	End if 
	
	If (StatsSwitch)
		Close_ProWin
		Case of 
			: (Table:C252($2)=Table:C252(->[COMPANIES:2]))
				Companies_File
				Open_Pro_Window($1)
			: (Table:C252($2)=Table:C252(->[ORDERS:24]))
				// ALERT("ORDERS")
				Orders_File
				Open_Pro_Window($1)
			: (Table:C252($2)=Table:C252(->[CONTACTS:1]))
				Contacts_File
				Open_Pro_Window($1)
			: (Table:C252($2)=Table:C252(->[PRODUCTS:9]))
				Products_File
				Open_Pro_Window($1)
			: (Table:C252($2)=Table:C252(->[ORDER_ITEMS:25]))
				OrderI_File
				Open_Pro_Window($1)
			: (Table:C252($2)=Table:C252(->[TRANSACTIONS:29]))
				$_bo_OK:=Trans_File
				If ($_bo_OK)
					Open_Pro_Window($1)
				End if 
				
			: (Table:C252($2)=Table:C252(->[ACCOUNT_BALANCES:34]))
				ACC_BalFile
				Open_Pro_Window($1)
			: (Table:C252($2)=Table:C252(->[PURCHASE_INVOICES:37]))
				Purchases_File
				Open_Pro_Window($1)
			: (Table:C252($2)=Table:C252(->[INVOICES:39]))
				Invoices_File
				Open_Pro_Window($1)
				
		End case 
		
		
		SYS_bo_StatsView:=True:C214
		Gen_Mod2($1; $2; $3)
	End if 
	StatsSwitch:=False:C215
	
	
End if 
ERR_MethodTrackerReturn("Gen_Mod2"; $_t_oldMethodName)
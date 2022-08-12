//%attributes = {}
If (False:C215)
	//Project Method Name:      Contracts_GP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 22:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SVS_lb_ItemsSetup;0)
	C_LONGINT:C283(<>MENU_l_BarModule)
	C_TEXT:C284($_t_CurrentOutputform; $_t_DragString; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_GP")
//Contracts_GP
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Menu_Record("Contracts_GP"; "Add Product Items")
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
//NG MARCH 2004
//this method really is TOSH
//this creates order items with no ORDER NUMBER!!!

//NEW CODE NG MARCH 2004
If ([CONTRACTS:17]Contract_Code:3#"")
	If ([CONTRACTS:17]Company_Code:1#"")
		If ([CONTRACTS:17]End_Date:6>Current date:C33(*)) | ([CONTRACTS:17]xOpenEndedStatus:16=1)
			//NG this is COMPLETELY different to what it did in the old version
			//the old version was fundamentaly flawed
			$_t_DragString:="OrdItems"
			//AL_SetDrgDst (SC_PowerviewCHAR;1;$_t_DragString)  ` not needed - set on the LB object
			LBI_SetDRGPair(1; ->SVS_lb_ItemsSetup; $_t_DragString)
			QUERY:C277([ORDERS:24]; [ORDERS:24]Company_Code:1=[CONTRACTS:17]Company_Code:1)
			COPY NAMED SELECTION:C331([ORDERS:24]; "DefaultSelection")
			DBI_MenuDisplayRecords("OrdersCopy"; <>MENU_l_BarModule; "DefaultSelection")
			
			//$_l_Process:=New Process("Orders_Mod";◊K4;"Assign Order items"+String(Current process);String(Current process);"";"";"";"";"-1";*)
			//SHOW PROCESS($_l_Process)
			//BRING TO FRONT($_l_Process)
		Else 
			Gen_Alert("This contract is now closed, items cannot be added")
		End if 
		
	Else 
		Gen_Alert("Items cannot be added to a contract till a company is entered!")
	End if 
	
Else 
	Gen_Alert("You must enter a contract code first")
End if 
ERR_MethodTrackerReturn("Contracts_GP"; $_t_oldMethodName)
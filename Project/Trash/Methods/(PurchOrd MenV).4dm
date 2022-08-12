//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PurchOrd MenV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/09/2010 20:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_LONGINT:C283(<>AutoProc; $_l_Menu)
	C_TEXT:C284(<>AutoFile; <>CompCode; <>ContCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd MenV")
$_l_Menu:=Sel_LPmi("PurchOrd MenV")
<>CompCode:=[PURCHASE_ORDERS:57]Company_Code:1
<>ContCode:=[PURCHASE_ORDERS:57]Contact_Code:5
<>DB_bo_AutoOut:=False:C215
<>AutoFind:=True:C214
<>AutoProc:=vProc
<>AutoFile:="PurchOrd"
Case of 
	: ($_l_Menu=1)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[COMPANIES:2])))
		
	: ($_l_Menu=2)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CONTACTS:1])))
		
		//ZContacts_Mod
End case 
ERR_MethodTrackerReturn("PurchOrd MenV"; $_t_oldMethodName)

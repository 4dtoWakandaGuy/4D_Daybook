//%attributes = {}
If (False:C215)
	//Project Method Name:      Projects_MenV
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
	C_LONGINT:C283(<>AutoProc; $_l_Menu; $1)
	C_TEXT:C284(<>AutoFile; <>CompCode; <>ContCode; <>JobCode; <>ProdCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_MenV")
If (Count parameters:C259=0)
	$_l_Menu:=Sel_LPmi("Projects_MenV")
Else 
	$_l_Menu:=$1
End if 

If (Modified record:C314([JOBS:26]))
	DB_SaveRecord(->[JOBS:26])
	AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
End if 
<>CompCode:=[PROJECTS:89]Company_Code:3
<>ContCode:=[PROJECTS:89]Contact_Code:4
<>ProdCode:=""
<>JobCode:=""
<>DB_bo_AutoOut:=False:C215
<>AutoFind:=True:C214
<>AutoProc:=Current process:C322
<>AutoFile:="Projects"
Case of 
	: ($_l_Menu=1)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[COMPANIES:2])))
		
	: ($_l_Menu=2)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CONTACTS:1])))
		//ZContacts_Mod
End case 
ERR_MethodTrackerReturn("Projects_MenV"; $_t_oldMethodName)

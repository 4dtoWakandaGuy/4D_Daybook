//%attributes = {}

If (False:C215)
	//Project Method Name:      Country_File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283(vO; vP)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Country_File")

//NG November 2004

//Written to faclitate using Gen_Mod to display a personnel record(currently displayed with Minor_Mod which displays all records)
$_t_oldMethodName:=ERR_MethodTracker("Country_File")


vO:=1
READ WRITE:C146([COUNTRIES:73])

FORM SET INPUT:C55([COUNTRIES:73]; "Country_In")  //NG April 2004 removed reference to ◊screen
WIN_t_CurrentInputForm:="Country_In"
FORM SET OUTPUT:C54([COUNTRIES:73]; "Countries_Out")
WIN_t_CurrentOutputform:="Countries_Out"
vP:=1
$0:=True:C214
ERR_MethodTrackerReturn("Country_File"; $_t_oldMethodName)
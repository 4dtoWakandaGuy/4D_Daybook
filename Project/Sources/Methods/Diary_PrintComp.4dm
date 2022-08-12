//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_PrintComp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_PrintComp")
//Diary_Print Company
Menu_Record("Diary_PrintComp"; "Print Company Form")
If (Modified record:C314([DIARY:12]))
	Diary_PersPrior
	DB_SaveRecord(->[DIARY:12])
	AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
End if 
COPY NAMED SELECTION:C331([DIARY:12]; "Diary Items")
Diary_CompPrt
USE NAMED SELECTION:C332("Diary Items")
CLEAR NAMED SELECTION:C333("Diary Items")
FORM SET OUTPUT:C54([DIARY:12]; "Diary")
WIN_t_CurrentOutputform:="Diary"
DB_t_CurrentFormUsage:=""
vNo:=Records in selection:C76([DIARY:12])
ERR_MethodTrackerReturn("Diary_PrintComp"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_PrintSht
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/11/2009 14:00:13If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SR_bo_Validated)
	C_LONGINT:C283($_l_Printed)
	C_TEXT:C284($_t_CurrentWindowTitle; $_t_DocumentName; $_t_oldMethodName; SD_t_CurrentDiaryInitials)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_PrintSht")
//Diary_Print Sheet
SR_bo_Validated:=False:C215
Menu_Record("Diary_PrintSht"; "Print Diary_Sheet")

If (Modified record:C314([DIARY:12]))
	Diary_PersPrior
	DB_SaveRecord(->[DIARY:12])
	AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
End if 
COPY NAMED SELECTION:C331([DIARY:12]; "Diary Items")
$_t_DocumentName:=[DIARY:12]Action_Code:9+" "+[DIARY:12]Diary_Code:3  //
$_t_CurrentWindowTitle:=Get window title:C450
SET WINDOW TITLE:C213($_t_DocumentName)
$_l_Printed:=Gen_PPSingle(->[DIARY:12]; "Diary_Sheet"; "Diary_Out"; [DIARY:12]Action_Code:9+"Printout"; [DIARY:12]Action_Code:9+"Printout"; ""; 0; ->[DIARY:12]Status:30; "Diary "+[DIARY:12]Action_Code:9; ""; False:C215; $_t_DocumentName)  // 05/04/040 pb"
SET WINDOW TITLE:C213($_t_CurrentWindowTitle)
USE NAMED SELECTION:C332("Diary Items")
CLEAR NAMED SELECTION:C333("Diary Items")

If (True:C214)
	If (False:C215)
		COPY NAMED SELECTION:C331([DIARY:12]; "Diary Items")
		FORM SET OUTPUT:C54([DIARY:12]; "Diary_Sheet")
		PRINT RECORD:C71([DIARY:12])
		FORM SET OUTPUT:C54([DIARY:12]; "Diary")
		USE NAMED SELECTION:C332("Diary Items")
		CLEAR NAMED SELECTION:C333("Diary Items")
	End if 
Else 
	Diary_PrintOut(SD_t_CurrentDiaryInitials)
End if 
ERR_MethodTrackerReturn("Diary_PrintSht"; $_t_oldMethodName)
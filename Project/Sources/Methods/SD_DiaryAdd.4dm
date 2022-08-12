//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_DiaryAdd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(SD_D_CurrentviewDate)
	C_LONGINT:C283(<>NoStart; WS_l_SELECTEDDIARYVIEWTAB)
	C_TEXT:C284(<>CompCode; <>ContCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_DiaryAdd")
Case of 
	: (WS_l_SELECTEDDIARYVIEWTAB=4) & (False:C215)
		<>CompCode:=[DIARY:12]Company_Code:1
		<>ContCode:=[DIARY:12]Contact_Code:2
		SD_AutoAddRec(""; SD_D_CurrentviewDate; ?00:00:00?; True:C214; True:C214)
	: (Macintosh option down:C545) | (Windows Alt down:C563)
		<>CompCode:=[DIARY:12]Company_Code:1
		<>ContCode:=[DIARY:12]Contact_Code:2
		// ◊OrderCode:=[DIARY]Order Code
		// ◊JobCode:=[DIARY]Job Code
		
		// ◊CallCode:=[DIARY]Call Code
		
		SD_AutoAddRec(""; SD_D_CurrentviewDate; ?00:00:00?; True:C214; True:C214)
		
	Else 
		
		// ◊CompCode:=[DIARY]Company Code
		//  ◊OrderCode:=[DIARY]Order Code
		// ◊JobCode:=[DIARY]Job Code
		// ◊CallCode:=[DIARY]Call Code
		
		//  SD_AutoAddRec ("";SD_D_CurrentviewDate;†00:00:00†;True)
		SD_AutoAddRec(""; SD_D_CurrentviewDate; ?00:00:00?; False:C215; True:C214)
		
		
		
End case 

<>NoStart:=0
ERR_MethodTrackerReturn("SD_DiaryAdd"; $_t_oldMethodName)
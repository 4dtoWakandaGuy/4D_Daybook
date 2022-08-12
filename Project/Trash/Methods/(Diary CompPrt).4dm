//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary CompPrt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 12:10:03If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary CompPrt")
//Diary CompPrt
CREATE SET:C116([COMPANIES:2]; "CMaster")
ONE RECORD SELECT:C189([COMPANIES:2])
QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1)
ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
FORM SET OUTPUT:C54([COMPANIES:2]; "Companies_Print")
DB_t_CurrentFormUsage:="NoSearch"
PRINT SELECTION:C60([COMPANIES:2])
DB_t_CurrentFormUsage:=""
FORM SET OUTPUT:C54([COMPANIES:2]; "Companies Out")
USE SET:C118("CMaster")
ERR_MethodTrackerReturn("Diary CompPrt"; $_t_oldMethodName)
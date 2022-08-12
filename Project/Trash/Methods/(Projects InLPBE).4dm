//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Projects_InLPBE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vSelPrev)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_InLPBE")
OBJECT SET ENTERABLE:C238([PROJECTS:89]Project_Code:1; True:C214)
OBJECT SET ENTERABLE:C238([PROJECTS:89]Project_Name:2; True:C214)
OBJECT SET ENTERABLE:C238([PROJECTS:89]Company_Code:3; True:C214)
OBJECT SET ENTERABLE:C238([PROJECTS:89]Contact_Code:4; True:C214)
OBJECT SET ENTERABLE:C238([PROJECTS:89]Start_Date:5; True:C214)
OBJECT SET ENTERABLE:C238([PROJECTS:89]End_Date:6; True:C214)
OBJECT SET ENTERABLE:C238([PROJECTS:89]Project_Type:7; True:C214)
OBJECT SET ENTERABLE:C238([PROJECTS:89]Person:8; True:C214)
OBJECT SET ENTERABLE:C238([PROJECTS:89]State:9; True:C214)
vSelPrev:=""
ERR_MethodTrackerReturn("Projects_InLPBE"; $_t_oldMethodName)
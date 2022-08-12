//%attributes = {}
If (False:C215)
	//Project Method Name:      Qualities_InLPD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/10/2009 13:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("Qualities_InLPD")
Case of 
	: (Modified:C32([INFORMATION:55]Group:2))
		//Qualities_InLPX(->[INFORMATION]Group)
	: (Modified:C32([INFORMATION:55]SubGroup:6))
		//Qualities_InLPX(->[INFORMATION]SubGroup)
	: (Modified:C32([INFORMATION:55]Information_Level:4))
		//Qualities_InLPX(->[INFORMATION]Quality_Level)
	: (Modified:C32([INFORMATION:55]Year:5))
		//Qualities_InLPX(->[INFORMATION]Year)
	: (Modified:C32([INFORMATION:55]Information_Date:8))
		//Qualities_InLPX(->[INFORMATION]Quality_Date)
End case 
ERR_MethodTrackerReturn("Qualities_InLPD"; $_t_oldMethodName)
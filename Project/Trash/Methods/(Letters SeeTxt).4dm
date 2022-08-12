//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters SeeTxt
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
	C_TEXT:C284(<>SYS_t_4DWriteType; $_t_oldMethodName; DB_t_CurrentFormUsage2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters SeeTxt")
Menu_Record("Letters SeeTxt"; "See Daybook Text")
If (In_ButtChkMan(->[DOCUMENTS:7]; "1"))
	If (Modified record:C314([DOCUMENTS:7]))
		DB_SaveRecord(->[DOCUMENTS:7])
	End if 
	ACCEPT:C269
	DB_t_CurrentFormUsage2:="SeeTxt"
	FORM SET INPUT:C55([DOCUMENTS:7]; "Letters_In13")  //NG April 2004 removed reference to ◊screen)
	
	MODIFY RECORD:C57([DOCUMENTS:7]; *)
	FORM SET INPUT:C55([DOCUMENTS:7]; "Letters_In13"+<>SYS_t_4DWriteType)
	DB_t_CurrentFormUsage2:=""
End if 
ERR_MethodTrackerReturn("Letters SeeTxt"; $_t_oldMethodName)
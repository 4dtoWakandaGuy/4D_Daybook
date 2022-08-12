//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_See4DW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/03/2010 19:11
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

$_t_oldMethodName:=ERR_MethodTracker("Letters_See4DW")

Menu_Record("Letters_See4DW"; "See 4D Write Text")
If (Documents_4DWriteAccessType(True:C214)#"")
	If (In_ButtChkMan(->[DOCUMENTS:7]; "1"))
		If (Modified record:C314([DOCUMENTS:7]))
			DB_SaveRecord(->[DOCUMENTS:7])
		End if 
		ACCEPT:C269
		FORM SET INPUT:C55([DOCUMENTS:7]; "Letters_inW")  //NG April 2004 removed reference to ◊screen"
		DB_t_CurrentFormUsage2:="See4DW"
		MODIFY RECORD:C57([DOCUMENTS:7]; *)
		FORM SET INPUT:C55([DOCUMENTS:7]; "Letters_inW")  //NG April 2004 removed reference to ◊screen
		DB_t_CurrentFormUsage2:=""
	End if 
End if 
ERR_MethodTrackerReturn("Letters_See4DW"; $_t_oldMethodName)
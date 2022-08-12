//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies_InAS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAccessSwNo)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SYS_t_AccessType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_InAS")
Menu_Record("Companies_InAS"; "Switch Access")


If (vAccessSwNo<4)
	If (In_ButtChkMan(->[COMPANIES:2]; "1"))
		Companies_InLPA
		If (Modified record:C314([COMPANIES:2]))
			DB_SaveRecord(->[COMPANIES:2])
			AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
		End if 
		CANCEL:C270
		If (SYS_t_AccessType="Q")  // Was used to determine different screens-Aug 2006 no longer used for that
			SYS_t_AccessType:=""
		Else 
			SYS_t_AccessType:="Q"
		End if 
		$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
		DB_t_CurrentFormUsage:="AS"
		vAccessSwNo:=vAccessSwNo+1
		Companies_FileI
		If ((Locked:C147([COMPANIES:2])) | (Read only state:C362([COMPANIES:2])))
			DIALOG:C40([COMPANIES:2]; "Companies_In13")
		Else 
			MODIFY RECORD:C57([COMPANIES:2]; *)
		End if 
		If (OK=1)
			DB_t_CallOnCloseorSave:="AS"  //Done to make Batch entry work properly
		End if 
		vAccessSwNo:=-1  //Required for vFromIn LPs to make them not set it to false
		DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	End if 
Else 
	Gen_Alert("The Switch Access Function can only be used 4 times before returning to a list "+"or to the menus"; "Cancel")
End if 
ERR_MethodTrackerReturn("Companies_InAS"; $_t_oldMethodName)
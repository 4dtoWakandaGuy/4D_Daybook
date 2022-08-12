//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contacts_InAS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAccessSwNo)
	C_TEXT:C284($_t_oldMethodName; SYS_t_AccessType; DB_t_CallOnCloseorSave)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_InAS")
Menu_Record("Contacts_InAS"; "Switch Access")
//NG April 2004 removed reference to ◊screen
//And removed silver restrictions

If (vAccessSwNo<4)
	If (In_ButtChkMan(->[CONTACTS:1]; "2"))
		Contacts_InMCA
		If (Modified record:C314([CONTACTS:1]))
			DB_SaveRecord(->[CONTACTS:1])
			AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
		End if 
		CANCEL:C270
		If (SYS_t_AccessType="Q")  // Was used to determine different screens-Aug 2006 no longer used for that
			SYS_t_AccessType:=""
		Else 
			SYS_t_AccessType:="Q"
		End if 
		vAccessSwNo:=vAccessSwNo+1
		FORM SET INPUT:C55([CONTACTS:1]; "Contacts_InM13")  //NG April 2004 removed reference to ◊screen
		//actually this all means this will now do nothing!!
		If ((Locked:C147([CONTACTS:1])) | (Read only state:C362([CONTACTS:1])))
			DIALOG:C40([CONTACTS:1]; "Contacts_InM13")
		Else 
			MODIFY RECORD:C57([CONTACTS:1]; *)
		End if 
		If (OK=1)
			DB_t_CallOnCloseorSave:="AS"
		End if 
		vAccessSwNo:=vAccessSwNo-1
	End if 
Else 
	Gen_Alert("The Switch Access Function can only be used 4 times before returning to a list "+"or to the menus"; "Cancel")
End if 
ERR_MethodTrackerReturn("Contacts_InAS"; $_t_oldMethodName)
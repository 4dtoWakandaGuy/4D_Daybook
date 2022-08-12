//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_InAS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:29:29If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAccessSwNo)
	C_TEXT:C284(<>SYS_t_FormSizeName; $_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SYS_t_AccessType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InAS")
Menu_Record("Diary_InAS"; "Switch Access")
If ((DB_GetModuleSettingByNUM(1))#5)
	If (<>SYS_t_FormSizeName="13")
		If (vAccessSwNo<4)
			If (In_ButtChkMan(->[DIARY:12]; "3 9"))
				$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
				DB_t_CurrentFormUsage:="AS"
				Diary_InLPA
				DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
				If (Modified record:C314([DIARY:12]))
					DB_SaveRecord(->[DIARY:12])
					AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
				End if 
				CANCEL:C270
				If (SYS_t_AccessType="Q")  // Was used to determine different screens-Aug 2006 no longer used for that
					SYS_t_AccessType:=""
				Else 
					SYS_t_AccessType:="Q"
				End if 
				vAccessSwNo:=vAccessSwNo+1
				FORM SET INPUT:C55([DIARY:12]; "Diary_In13"+SYS_t_AccessType)
				
				If ((Locked:C147([DIARY:12])) | (Read only state:C362([DIARY:12])))
					DIALOG:C40([DIARY:12]; "Diary_In13")
				Else 
					MODIFY RECORD:C57([DIARY:12]; *)
				End if 
				If (OK=1)
					DB_t_CallOnCloseorSave:="AS"
				End if 
				vAccessSwNo:=vAccessSwNo-1
			End if 
		Else 
			Gen_Alert("The Switch Access Function can only be used 4 times before returning to a list "+"or to the menus"; "Cancel")
		End if 
	Else 
		Gen_Alert("The Switch Access Function cannot be used with 9 inch screens"; "Cancel")
	End if 
Else 
	Gen_Alert("The Switch Access Function cannot be used in Daybook Silver"; "Cancel")
End if 
ERR_MethodTrackerReturn("Diary_InAS"; $_t_oldMethodName)
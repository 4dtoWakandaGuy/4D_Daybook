//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_InAS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/09/2009 08:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAccessSwNo)
	C_REAL:C285(SwNo)
	C_TEXT:C284($_t_oldMethodName; $Lay; DB_t_CallOnCloseorSave; SYS_t_AccessType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_InAS")
Menu_Record("TransB_InAS"; "Switch Access")
If ((DB_GetModuleSettingByNUM(1))#5)
	//NG April 2004 Removed ◊Screen
	
	If (vAccessSwNo<4)
		If (In_ButtChkMan(->[TRANSACTION_BATCHES:30]; "1"))
			If (Modified record:C314([TRANSACTION_BATCHES:30]))
				DB_SaveRecord(->[TRANSACTION_BATCHES:30])
			End if 
			CANCEL:C270
			If (SYS_t_AccessType="Q")
				SYS_t_AccessType:=""
			Else 
				SYS_t_AccessType:="Q"
			End if 
			vAccessSwNo:=vAccessSwNo+1
			TransB_FileI
			If ((Locked:C147([TRANSACTION_BATCHES:30])) | (Read only state:C362([TRANSACTION_BATCHES:30])))
				DIALOG:C40([TRANSACTION_BATCHES:30]; "TransB_in")
			Else 
				MODIFY RECORD:C57([TRANSACTION_BATCHES:30]; *)
			End if 
			If (OK=1)
				DB_t_CallOnCloseorSave:="AS"
			End if 
			SwNo:=vAccessSwNo-1
		End if 
	Else 
		Gen_Alert("The Switch Access Function can only be used 4 times before returning to a list "+"or to the menus"; "Cancel")
	End if 
	
Else 
	Gen_Alert("The Switch Access Function cannot be used in Daybook Silver"; "Cancel")
End if 
ERR_MethodTrackerReturn("TransB_InAS"; $_t_oldMethodName)
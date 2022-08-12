//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_ContactsRenumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  17/09/2010 18:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_AddMode; DB_l_CurrentDisplayedForm; Vadd; vNo)
	C_TEXT:C284($_t_MenuName; $_t_oldMethodName; DB_t_CurrentContext; vContCode; vSurname; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_ContactsRenumber")
If (Count parameters:C259=0)
	CREATE SET:C116([CONTACTS:1]; "$Temp")
	If (Records in set:C195("ListboxSet0")>0)
		USE SET:C118("ListboxSet0")
	End if 
Else 
	//use the current selection
End if 
If (Records in selection:C76([CONTACTS:1])>0)
	If (Records in selection:C76([CONTACTS:1])=1)
		$_t_MenuName:=Get localized string:C991("MenuItem_Contact")
		
	Else 
		$_t_MenuName:=Get localized string:C991("Table_Contacts")
	End if 
	Gen_Confirm(Get localized string:C991("Text_Recode")+" "+String:C10(Records in selection:C76([CONTACTS:1]))+" "+$_t_MenuName+" ?"; Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
	
	If (OK=1)
		Are_You_Sure
		If (OK=1)
			$_l_AddMode:=Vadd
			vAdd:=1
			CREATE SET:C116([CONTACTS:1]; "OMaster")
			CREATE SET:C116([CONTACTS:1]; "Master")
			While (Records in set:C195("Master")>0)
				USE SET:C118("Master")
				FIRST RECORD:C50([CONTACTS:1])
				ONE RECORD SELECT:C189([CONTACTS:1])
				CREATE SET:C116([CONTACTS:1]; "Extra")
				DIFFERENCE:C122("Master"; "Extra"; "Master")
				vContCode:=[CONTACTS:1]Contact_Code:2
				Cont_RenumSrch(vContCode)
				vSurname:=[CONTACTS:1]Surname:5
				Contact_Code
				DB_SaveRecord(->[CONTACTS:1])
				AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
				vText:=[CONTACTS:1]Contact_Code:2
				Cont_Trans
				
			End while 
			If ((Records in set:C195("OMaster")>0) & (OK=1))
				Gen_Confirm(Get localized string:C991("Text_SeeRecoded ")+" "+Get localized string:C991("Table_Contacts")+" ?"; Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
				If (OK=1)
					
					USE SET:C118("OMaster")
					vNo:=Records in selection:C76([CONTACTS:1])
				End if 
			End if 
		End if 
		
	End if 
End if 
If (Count parameters:C259=0)  // so this bit only gets called from the output form
	USE SET:C118("$temp")
	
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
	DB_SetFormMenuoptions
End if 
ERR_MethodTrackerReturn("CON_ContactsRenumber"; $_t_oldMethodName)
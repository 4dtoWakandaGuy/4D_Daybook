//%attributes = {}
If (False:C215)
	//Project Method Name:      COM_CompanyRenumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:       17/09/2010 16:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_AddMode; DB_l_CurrentDisplayedForm; r1; Vadd; vNo)
	C_TEXT:C284($_t_MenuName; $_t_oldMethodName; DB_t_CurrentContext; vCompCode; vCompName; vSurname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("COM_CompanyRenumber")
If (Count parameters:C259=0)
	CREATE SET:C116([COMPANIES:2]; "$temp")
	
	If (Records in set:C195("ListboxSet0")>0)
		USE SET:C118("ListboxSet0")
	End if 
Else 
	//use the current selection
End if 
If (Records in selection:C76([COMPANIES:2])>0)
	If (Records in selection:C76([COMPANIES:2])=1)
		
		$_t_MenuName:=Get localized string:C991("MenuItem_Company")
	Else 
		$_t_MenuName:=Get localized string:C991("Table_Companies")
	End if 
	Gen_Confirm(Get localized string:C991("Text_Recode")+" "+String:C10(Records in selection:C76([COMPANIES:2]))+" "+$_t_MenuName+" ?"; Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
	
	If (OK=1)
		Are_You_Sure
		If (OK=1)
			$_l_AddMode:=Vadd
			Vadd:=1
			CREATE SET:C116([COMPANIES:2]; "CMaster")
			CREATE SET:C116([COMPANIES:2]; "Master")
			While (Records in set:C195("Master")>0)
				USE SET:C118("Master")
				FIRST RECORD:C50([COMPANIES:2])
				ONE RECORD SELECT:C189([COMPANIES:2])
				CREATE SET:C116([COMPANIES:2]; "Extra")
				DIFFERENCE:C122("Master"; "Extra"; "Master")
				vCompCode:=[COMPANIES:2]Company_Code:1
				vCompName:=[COMPANIES:2]Company_Name:2
				Comp_RenumSrc(vCompCode)
				vSurname:=[CONTACTS:1]Surname:5
				If ([COMPANIES:2]Private:37=True:C214)
					r1:=1
				Else 
					r1:=0
				End if 
				Company_No
				Comp_RenumApp([COMPANIES:2]Company_Code:1; vCompCode)
			End while 
			vAdd:=$_l_AddMode
			If ((Records in set:C195("CMaster")>0) & (OK=1))
				Gen_Confirm(Get localized string:C991("Text_SeeRecoded ")+" "+Get localized string:C991("Table_Companies")+" ?"; Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
				If (OK=1)
					USE SET:C118("CMaster")
					vNo:=Records in selection:C76([COMPANIES:2])
					
				End if 
			End if 
		End if 
		If (Count parameters:C259=0)  // so this bit only gets called from the output form
			DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
			DB_SetFormMenuoptions
		End if 
	End if 
End if 
If (Count parameters:C259=0)  // so this bit only gets called from the output form
	USE SET:C118("$Temp")
	
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
	DB_SetFormMenuoptions
End if 
ERR_MethodTrackerReturn("COM_CompanyRenumber"; $_t_oldMethodName)
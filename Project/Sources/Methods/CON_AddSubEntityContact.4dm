//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_AddSubEntityContact
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CON_abo_ContactMod;0)
	//ARRAY TEXT(CON_at_ContactCodes;0)
	//ARRAY TEXT(CON_at_ContactName;0)
	C_LONGINT:C283($_l_ContactRow; bCON_l_Delete; bCON_l_modify; CON_l_CurrentContactStatus)
	C_TEXT:C284($_t_oldMethodName; CON_t_CurContactCode; CON_t_CurContactName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CON_AddSubEntityContact")

//NG Feb 2004
//The method is only applicable within the form [CONTRACTS]Contract_in
//It is the script of the button bCON_l_modify which adds a new contact(or set a highlighted one to edit)
//it is in a method so the call can be via an outside call
$_t_oldMethodName:=ERR_MethodTracker("CON_AddSubEntityContact"; Form event code:C388)
Case of 
	: (CON_l_CurrentContactStatus=0)
		OBJECT SET VISIBLE:C603(bCON_l_Delete; True:C214)
		OBJECT SET VISIBLE:C603(CON_t_CurContactCode; True:C214)
		OBJECT SET VISIBLE:C603(CON_t_CurContactName; True:C214)
		CON_t_CurContactCode:=""
		CON_t_CurContactName:=""
		CON_at_ContactCodes{0}:=""
		CON_at_ContactName{0}:=""
		CON_at_ContactCodes:=0
		OBJECT SET TITLE:C194(bCON_l_Delete; "Clear")
		OBJECT SET TITLE:C194(bCON_l_modify; "Save")
		CON_l_CurrentContactStatus:=2
	: (CON_l_CurrentContactStatus=1)
		//item is selected not in edit mode
		//(Button text will say 'Edit')
		OBJECT SET VISIBLE:C603(bCON_l_Delete; True:C214)
		CON_l_CurrentContactStatus:=2
		OBJECT SET TITLE:C194(bCON_l_modify; "Save")
		OBJECT SET TITLE:C194(bCON_l_Delete; "Delete")
	: (CON_l_CurrentContactStatus=2)
		//editing (button text says save)
		
		If (CON_at_ContactName{0}#CON_t_CurContactName)
			//item is modified
			
			Case of 
				: (CON_at_ContactName{0}#"")
					//editing an existing entry
					CONFIRM:C162("Change "+CON_at_ContactName{0}+" to "+CON_t_CurContactName)
					If (OK=1)
						$_l_ContactRow:=Find in array:C230(CON_at_ContactCodes; CON_at_ContactCodes{0})
						If ($_l_ContactRow>0)
							CON_at_ContactCodes{$_l_ContactRow}:=CON_t_CurContactCode
							CON_at_ContactName{$_l_ContactRow}:=CON_t_CurContactName
							CON_abo_ContactMod{$_l_ContactRow}:=True:C214
						Else 
							//error
						End if 
						
					End if 
				: (CON_at_ContactName{0}="")
					//entering a new one
					CONFIRM:C162("Save additional contact "+CON_t_CurContactName+"?")
					If (OK=1)
						INSERT IN ARRAY:C227(CON_at_ContactCodes; Size of array:C274(CON_at_ContactCodes)+1; 1)  //to hold the current subrecords
						INSERT IN ARRAY:C227(CON_at_ContactName; Size of array:C274(CON_at_ContactName)+1; 1)  //to hold the current subrecords
						INSERT IN ARRAY:C227(CON_abo_ContactMod; Size of array:C274(CON_abo_ContactMod)+1; 1)  //to track modified
						CON_at_ContactCodes{Size of array:C274(CON_at_ContactCodes)}:=CON_t_CurContactCode
						CON_at_ContactName{Size of array:C274(CON_at_ContactName)}:=CON_t_CurContactName
						CON_abo_ContactMod{Size of array:C274(CON_abo_ContactMod)}:=True:C214
						
						
						
					End if 
					
			End case 
			
			
		End if 
		OBJECT SET TITLE:C194(bCON_l_Delete; "Clear")
		OBJECT SET VISIBLE:C603(bCON_l_Delete; False:C215)
		OBJECT SET TITLE:C194(bCON_l_modify; "Add")
		CON_l_CurrentContactStatus:=0
		
		OBJECT SET VISIBLE:C603(CON_t_CurContactCode; False:C215)
		OBJECT SET VISIBLE:C603(CON_t_CurContactName; False:C215)
		CON_t_CurContactCode:=""
		CON_t_CurContactName:=""
		
		CON_at_ContactCodes{0}:=""
		CON_at_ContactCodes:=0
		CON_at_ContactName{0}:=""
		CON_at_ContactName:=0
End case 
ERR_MethodTrackerReturn("CON_AddSubEntityContact"; $_t_oldMethodName)
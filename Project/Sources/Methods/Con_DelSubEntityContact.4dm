//%attributes = {}
If (False:C215)
	//Project Method Name:      Con_DelSubEntityContact
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
	//ARRAY TEXT(CON_at_DelContactCodes;0)
	C_LONGINT:C283($_l_ContactRow; bCON_l_Delete; bCON_l_modify; CON_l_CurrentContactStatus)
	C_TEXT:C284($_t_oldMethodName; CON_t_CurContactCode; CON_t_CurContactName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Con_DelSubEntityContact")

//NG Feb 2004
//The method is only applicable within the form [contracts]Contract_in
//It is the script of the button bCON_l_Delete which adds an contact(or clears an entry)
//it is in a method so the call can be via an outside call
$_t_oldMethodName:=ERR_MethodTracker("Con_DelSubEntityContact"; Form event code:C388)
Case of 
		
	: (CON_l_CurrentContactStatus=0)
		//this button is not visible in this state
		// i am just putting it here for completness
	: (CON_l_CurrentContactStatus=1)
		//Item selected not edit
		//just clear back to status 0
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
	: (CON_l_CurrentContactStatus=2)
		//editing record
		//if existing ask user about clearing
		//else just clear
		//both go to status 0
		If (CON_at_ContactCodes{0}#"")
			CONFIRM:C162("Are you sure you wish to remove this Contact?")
			If (OK=1)
				
				$_l_ContactRow:=Find in array:C230(CON_at_ContactCodes; CON_at_ContactCodes{0})
				If ($_l_ContactRow>0)
					INSERT IN ARRAY:C227(CON_at_DelContactCodes; Size of array:C274(CON_at_DelContactCodes)+1; 1)
					CON_at_DelContactCodes{Size of array:C274(CON_at_DelContactCodes)}:=CON_t_CurContactCode
					DELETE FROM ARRAY:C228(CON_at_ContactCodes; $_l_ContactRow; 1)
					DELETE FROM ARRAY:C228(CON_at_ContactName; $_l_ContactRow; 1)
					DELETE FROM ARRAY:C228(CON_abo_ContactMod; $_l_ContactRow; 1)
					
				Else 
					//error
				End if 
				
			End if 
			
		Else 
			//do nothing just clear
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
ERR_MethodTrackerReturn("Con_DelSubEntityContact"; $_t_oldMethodName)
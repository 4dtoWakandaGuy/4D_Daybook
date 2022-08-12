If (False:C215)
	//object Method Name: Object Name:      [USER].SD2_DiaryOwnerDialog.oPersonCode1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; SD2_l_AddPeople; SD2_l_DiaryOwnerID)
	C_TEXT:C284($_t_oldMethodName; SD2_t_DiaryPersonCode; SD2_t_DiaryPersonName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_DiaryOwnerDialog.oPersonCode1"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		If (SD2_t_DiaryPersonName#"")
			Check_MinorNC(->SD2_t_DiaryPersonName; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Name:2; ->[PERSONNEL:11]Initials:1)  //5
			If (SD2_t_DiaryPersonName#"")
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=SD2_t_DiaryPersonName)
				SD2_t_DiaryPersonCode:=[PERSONNEL:11]Initials:1
				[DIARY:12]Person:8:=SD2_t_DiaryPersonCode
				SD2_t_DiaryPersonName:=[PERSONNEL:11]Name:2
				SD2_l_DiaryOwnerID:=[PERSONNEL:11]Personnel_ID:48
				OBJECT SET VISIBLE:C603(SD2_l_AddPeople; True:C214)
				OBJECT SET VISIBLE:C603(*; "oAddPerson"; True:C214)
			End if 
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_DiaryOwnerDialog.oPersonCode1"; $_t_oldMethodName)

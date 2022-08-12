//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetLicenceMaxUsers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 14:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_UpdateDate)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; $_l_MaxUsers; $_l_offset; $_l_ThisCharacter; $0; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_LicenceNumeric; $_t_LicenceString; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetLicenceMaxUsers")


If (Application type:C494=4D Server:K5:6)
	
	If (DB_l_CurrentOwnerRequest>0)
		QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Licence_Owner_ID:12=DB_l_CurrentOwnerRequest)
	Else 
		QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Licence_Owner_ID:12=<>PER_l_CurLoggedinDataOwnerID)
	End if 
Else 
	QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Licence_Owner_ID:12=<>PER_l_CurLoggedinDataOwnerID)
End if 
QUERY SELECTION:C341([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Is_Licence_Active:11=True:C214)

//This should always be just one record...
If (Records in selection:C76([LICENCE_UPDATES:97])=0)  //at any point this is called this should have already been run-remember the server now does not have the licence it has many licences so this is always going to be on a client.
	DB_LoadLicenceDetails  //Makes sure there is a record including handling renewal
Else 
	CREATE SET:C116([LICENCE_UPDATES:97]; "$ThisClient")
	
	
	
	
	ORDER BY:C49([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Update_Date:2; <)
	FIRST RECORD:C50([LICENCE_UPDATES:97])
	$_d_UpdateDate:=[LICENCE_UPDATES:97]Update_Date:2
	USE SET:C118("$ThisClient")
	QUERY SELECTION:C341([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Update_Date:2=$_d_UpdateDate)
	
	ORDER BY:C49([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Created_Time:8; <)
End if 
$_l_offset:=0
BLOB TO VARIABLE:C533([LICENCE_UPDATES:97]Licence_Blob:10; $_t_LicenceString; $_l_offset)
//<>SYS_l_MaxConnectedUsers
$_t_LicenceNumeric:=DB_LicenceNUMfromCode($_t_LicenceString)
$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 1; 3)+Substring:C12($_t_LicenceNumeric; 8)
$_l_ThisCharacter:=Num:C11($_t_LicenceNumeric[[1]])
$_t_LicenceNumeric:=Substring:C12($_t_LicenceNumeric; 2; $_l_ThisCharacter-2)+Substring:C12($_t_LicenceNumeric; $_l_ThisCharacter+4)
If (Count parameters:C259>=1)
	If ($1="WP")
		$_l_MaxUsers:=DB_LicenceWPusersfromCode($_t_LicenceNumeric)
		
		
	Else 
		$_l_MaxUsers:=DB_LicenceUsersFromCode($_t_LicenceNumeric)
		
	End if 
Else 
	$_l_MaxUsers:=DB_LicenceUsersFromCode($_t_LicenceNumeric)
	
	
End if 
$0:=$_l_MaxUsers
ERR_MethodTrackerReturn("DB_GetLicenceMaxUsers"; $_t_oldMethodName)

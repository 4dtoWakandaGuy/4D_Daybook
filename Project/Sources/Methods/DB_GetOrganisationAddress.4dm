//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetOrganisationAddress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 15:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_ConfigInited)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_Address; $_t_oldMethodName; $0; DM_T_UserAddress1; DM_T_UserAddress2; DM_T_UserCountry; DM_T_UserCounty; DM_T_UserPostCode; DM_T_UserTown)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetOrganisationAddress")

If (<>PER_l_CurLoggedinDataOwnerID>0) | (DB_l_CurrentOwnerRequest>0)
	If (Not:C34(DB_bo_ConfigInited))
		DB_LoadConfigurationPrefs
		
		If (Application type:C494#4D Server:K5:6)
			DB_bo_ConfigInited:=True:C214
		End if 
	End if 
	
	$_t_Address:=""
	If (DM_T_UserAddress1#"")
		$_t_Address:=$_t_Address+DM_T_UserAddress1+(Char:C90(13))
	End if 
	If (DM_T_UserAddress2#"")
		$_t_Address:=$_t_Address+DM_T_UserAddress2+(Char:C90(13))
	End if 
	If (DM_T_UserTown#"")
		$_t_Address:=$_t_Address+DM_T_UserTown
		If (DM_T_UserCounty="")
			$_t_Address:=$_t_Address+" "+DM_T_UserPostCode
		End if 
		$_t_Address:=$_t_Address+(Char:C90(13))
	End if 
	If (DM_T_UserCounty#"")
		$_t_Address:=$_t_Address+DM_T_UserCounty+" "+DM_T_UserPostCode+(Char:C90(13))
	End if 
	If (DM_T_UserCountry#"")
		$_t_Address:=$_t_Address+DM_T_UserCountry+(Char:C90(13))
	End if 
	$0:=$_t_Address
Else 
	ALL RECORDS:C47([USER:15])
	$_t_Address:=""
	
	If ([USER:15]Add1:2#"")
		$_t_Address:=$_t_Address+[USER:15]Add1:2+(Char:C90(13))
	End if 
	If ([USER:15]Add2:3#"")
		$_t_Address:=$_t_Address+[USER:15]Add2:3+(Char:C90(13))
	End if 
	If ([USER:15]Town:4#"")
		$_t_Address:=$_t_Address+[USER:15]Town:4
		If ([USER:15]County:5="")
			$_t_Address:=$_t_Address+" "+[USER:15]Postcode:6
		End if 
		$_t_Address:=$_t_Address+(Char:C90(13))
	End if 
	If ([USER:15]County:5#"")
		$_t_Address:=$_t_Address+[USER:15]County:5+" "+[USER:15]Postcode:6+(Char:C90(13))
	End if 
	If ([USER:15]Country:7#"")
		$_t_Address:=$_t_Address+[USER:15]Country:7+(Char:C90(13))
	End if 
	$0:=$_t_Address
End if 
ERR_MethodTrackerReturn("DB_GetOrganisationAddress"; $_t_oldMethodName)
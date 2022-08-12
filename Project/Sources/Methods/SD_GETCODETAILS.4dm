//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_GETCODETAILS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_CompanyName; $_t_CompanyTelephone; $_t_oldMethodName; $0; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_GETCODETAILS")
$_t_CompanyName:=""
If ($1#"")
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$1)
	If ([COMPANIES:2]Private:37=False:C215)
		$_t_CompanyName:=[COMPANIES:2]Company_Name:2
		
	End if 
	$_t_CompanyTelephone:=[COMPANIES:2]Telephone:9
Else 
	$_t_CompanyTelephone:=""
	$_t_CompanyName:=""
End if 
If ($2#"")  //1
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$2)
	If ($_t_CompanyName#"")  //1
		$_t_CompanyName:=$_t_CompanyName+", "+[CONTACTS:1]Contact_Name:31+" ,"+$_t_CompanyTelephone
		If ([CONTACTS:1]Extn:9#"")  //3
			$_t_CompanyName:=$_t_CompanyName+"-"+[CONTACTS:1]Extn:9
		End if   //3
	Else   //2e
		If ($_t_CompanyTelephone#"")  //4
			If ([CONTACTS:1]Extn:9#"")  //5
				$_t_CompanyName:=[CONTACTS:1]Contact_Name:31+", "+$_t_CompanyTelephone+"-"+[CONTACTS:1]Extn:9
			Else   //5
				$_t_CompanyName:=[CONTACTS:1]Contact_Name:31+", "+$_t_CompanyTelephone
			End if   //5
		Else   //4
			If ([CONTACTS:1]Mobile:12#"")  //6
				$_t_CompanyName:=[CONTACTS:1]Contact_Name:31+", "+[CONTACTS:1]Mobile:12
			Else   //6
				$_t_CompanyName:=[CONTACTS:1]Contact_Name:31
			End if   //6
		End if   //2
	End if 
Else   //1 for compiler PB
	If ($_t_CompanyTelephone#"")  //7
		$_t_CompanyName:=$_t_CompanyName+", "+$_t_CompanyTelephone
	End if   //7
End if 
$0:=$_t_CompanyName
ERR_MethodTrackerReturn("SD_GETCODETAILS"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LicenceOrgFromcode
	//------------------ Method Notes ------------------
	//This will only return a string if the licence was based on the org name...
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 10:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CalculatedNumber; $_l_OrganisationNum)
	C_TEXT:C284($_t_LicenceNumeric; $_t_oldMethodName; $_t_OrganisationName; $_t_OrganisationNumSTRING; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LicenceOrgFromcode")
$_t_LicenceNumeric:=$1
$_t_OrganisationNumSTRING:=Substring:C12($_t_LicenceNumeric; 4; 4)
$_l_OrganisationNum:=Num:C11($_t_OrganisationNumSTRING)
$_t_OrganisationName:=DB_GetOrganisation
$_l_CalculatedNumber:=Character code:C91(Substring:C12($_t_OrganisationName; 1; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 2; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 3; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 4; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 5; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 6; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 7; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 8; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 9; 1))+Character code:C91(Substring:C12($_t_OrganisationName; 10; 1))
$_t_OrganisationNumSTRING:=""
If ($_l_OrganisationNum>5000)
	$_l_OrganisationNum:=$_l_OrganisationNum-5000
	If ($_l_CalculatedNumber#$_l_OrganisationNum)
		$_t_OrganisationNumSTRING:="No"
	End if 
End if 
$0:=$_t_OrganisationNumSTRING
ERR_MethodTrackerReturn("DB_LicenceOrgFromcode"; $_t_oldMethodName)
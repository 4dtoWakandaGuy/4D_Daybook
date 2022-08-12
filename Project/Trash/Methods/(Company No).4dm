//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Company No
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283(<>CCC; $_l_IsUnique; r1; vAdd)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_AbbreviateCompanyName; $_t_CompanyCode; $_t_Name; $_t_oldMethodName; $1; vCompName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Company No")
//Company No
If (vAdd=1)
	If (Count parameters:C259=0)
		[COMPANIES:2]Company_Abbreviated_Name:52:=Companies_Abbr(vCompName)
		$_t_AbbreviateCompanyName:=[COMPANIES:2]Company_Abbreviated_Name:52
	Else 
		If (Count parameters:C259>=2)
			$_t_AbbreviateCompanyName:=Companies_Abbr($1)
		Else 
			
			[COMPANIES:2]Company_Abbreviated_Name:52:=Companies_Abbr($1)
			$_t_AbbreviateCompanyName:=[COMPANIES:2]Company_Abbreviated_Name:52
		End if 
	End if 
	
	If (r1=1)
		$_t_Name:=Uppercase:C13(Substring:C12(vSurname; 1; <>CCC))
		If (Count parameters:C259<2)
			[COMPANIES:2]Private:37:=True:C214
		End if 
	Else 
		//  If ([COMPANIES]Company Abbrev#"")
		$_t_Name:=Uppercase:C13(Substring:C12($_t_AbbreviateCompanyName; 1; <>CCC))
		//  Else
		//   If (Length(vCompName)<=◊CCC)
		//   If (Ascii(Substring(vCompName;Length(vCompName);1))=64)
		//    $_t_Name:=Uppercase(Substring(vCompName;1;Length(vCompName)-1))
		//   Else
		//   $_t_Name:=Uppercase(Substring(vCompName;1;◊CCC))
		//   End if
		// Else
		//   If (vCompName="The @")
		//  $_t_Name:=Uppercase(Substring(vCompName;5;◊CCC))
		// Else
		//   $_t_Name:=Uppercase(Substring(vCompName;1;◊CCC))
		//  End if
		// End if
		// End if
	End if 
Else 
	$_t_Name:=""
End if 
If (Count parameters:C259>=2)
	//$2->:=$_t_Name+Gen_CodePref (1;->[COMPANIES]Company Code;$_t_Name)
	Repeat 
		$_t_CompanyCode:=$_t_Name+Gen_CodePref(1; ->[COMPANIES:2]Company_Code:1; $_t_Name)
		SET QUERY DESTINATION:C396(3; $_l_IsUnique)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
		If ($_l_IsUnique=0)
			$2->:=$_t_CompanyCode
		End if 
		SET QUERY DESTINATION:C396(0)
	Until ($_l_IsUnique=0)
	
	DB_bo_RecordModified:=True:C214
Else 
	//[COMPANIES]Company Code:=$_t_Name+Gen_CodePref (1;->[COMPANIES]Company Code;$_t_Name)
	Repeat 
		$_t_CompanyCode:=$_t_Name+Gen_CodePref(1; ->[COMPANIES:2]Company_Code:1; $_t_Name)
		SET QUERY DESTINATION:C396(3; $_l_IsUnique)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
		If ($_l_IsUnique=0)
			[COMPANIES:2]Company_Code:1:=$_t_CompanyCode
		End if 
		SET QUERY DESTINATION:C396(0)
	Until ($_l_IsUnique=0)
	
	[COMPANIES:2]Export:33:=Export_Stamp2([COMPANIES:2]Export:33)
	DB_bo_RecordModified:=True:C214
End if 
ERR_MethodTrackerReturn("Company No"; $_t_oldMethodName)
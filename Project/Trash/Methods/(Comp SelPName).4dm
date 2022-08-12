//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp_SelPName
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
	C_LONGINT:C283(cNAA)
	C_TEXT:C284($_t_CompanyAbbreviated; $_t_CompName; $_t_oldMethodName; $1; VCompName; vRec)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_SelPName")
If (Count parameters:C259>=1)
	$_t_CompName:=$1
Else 
	$_t_CompName:=VCompName
End if 

If ($_t_CompName#"")
	$_t_CompanyAbbreviated:=Companies_Abbr($_t_CompName)
	If (cNAA=0)
		$_t_CompanyAbbreviated:=Sel_AtSign($_t_CompanyAbbreviated)
	End if 
	$_t_CompName:=Sel_AtOp($_t_CompName; "=")
	If ((Character code:C91(Substring:C12($_t_CompName; 1; 1))=64) & (Length:C16($_t_CompName)>1))
		Master_UseSS(->[COMPANIES:2])
		
		QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Company_Name:2; vRec; $_t_CompName; *)
		If (vRec="#")
			QUERY SELECTION:C341([COMPANIES:2];  & ; [COMPANIES:2]Also_Known_As:43; vRec; $_t_CompName; *)
			QUERY SELECTION:C341([COMPANIES:2];  & ; [COMPANIES:2]Company_Abbreviated_Name:52; vRec; $_t_CompanyAbbreviated)
		Else 
			QUERY SELECTION:C341([COMPANIES:2];  | ; [COMPANIES:2]Also_Known_As:43; vRec; $_t_CompName; *)
			QUERY SELECTION:C341([COMPANIES:2];  | ; [COMPANIES:2]Company_Abbreviated_Name:52; vRec; $_t_CompanyAbbreviated)
		End if 
	Else 
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2; vRec; $_t_CompName; *)
		If (vRec="#")
			QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Also_Known_As:43; vRec; $_t_CompName; *)
			QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Company_Abbreviated_Name:52; vRec; $_t_CompanyAbbreviated)
		Else 
			QUERY:C277([COMPANIES:2];  | ; [COMPANIES:2]Also_Known_As:43; vRec; $_t_CompName; *)
			QUERY:C277([COMPANIES:2];  | ; [COMPANIES:2]Company_Abbreviated_Name:52; vRec; $_t_CompanyAbbreviated)
		End if 
	End if 
	Master2(->[COMPANIES:2])
End if 
ERR_MethodTrackerReturn("Comp_SelPName"; $_t_oldMethodName)